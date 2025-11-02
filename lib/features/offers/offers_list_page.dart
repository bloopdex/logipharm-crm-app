import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/error/error.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'cubit/offers_cubit.dart';
import 'models/offer_dto.dart';
import 'offer_details_page.dart';

class OffersListPage extends StatelessWidget {
  static const routeName = '/offers';
  const OffersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OffersCubit()..load(),
      child: const _OffersView(),
    );
  }
}

class _OffersView extends StatefulWidget {
  const _OffersView();

  @override
  State<_OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<_OffersView> {
  String? _selectedLab; // null => All

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.offersTitle),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: BlocBuilder<OffersCubit, OffersState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => _ErrorRetry(
            message: msg,
            onRetry: () => context.read<OffersCubit>().load(),
          ),
          empty: () => const _Empty(),
          loaded: (offers) {
            // Build unique, non-empty labs list from offers
            final labs = offers
                .map((o) => (o.labo ?? '').trim())
                .where((l) => l.isNotEmpty)
                .toSet()
                .toList()
              ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

            final filtered = _selectedLab == null
                ? offers
                : offers
                    .where((o) => (o.labo ?? '').trim() == _selectedLab)
                    .toList();

            return RefreshIndicator(
              onRefresh: () => context.read<OffersCubit>().load(refresh: true),
              child: Column(
                children: [
                  if (labs.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          kPaddingMd2, kPaddingMd2, kPaddingMd2, kPaddingSm2),
                      child: DropdownButtonFormField<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          labelText: context.i10n.labelLaboratory,
                          border: const OutlineInputBorder(),
                        ),
                        value: _selectedLab,
                        items: [
                          DropdownMenuItem<String>(
                            value: null,
                            child: Text(context.i10n.eventAll),
                          ),
                          ...labs.map(
                            (lab) => DropdownMenuItem<String>(
                              value: lab,
                              child: Text(lab, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                        onChanged: (val) => setState(() => _selectedLab = val),
                      ),
                    ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(kPaddingMd2),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final offer = filtered[index];
                        return _OfferCard(
                          offer: offer,
                          onTap: () =>
                              context.push(OfferDetailsPage(offer: offer)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.i10n.emptyOffers));
  }
}

class _ErrorRetry extends StatelessWidget {
  const _ErrorRetry({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ErrorState(err: message),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: onRetry, child: Text(context.i10n.retry)),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer, required this.onTap});
  final OfferDto offer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = context.theme.colorScheme.primary;
    final dates = (offer.debut != null || offer.fin != null)
        ? '${_date(context, offer.debut)} → ${_date(context, offer.fin)}'
        : '-';
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(kPaddingMd2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LabelValue(
                label: context.i10n.labelReference,
                value: offer.reference ?? '${offer.id ?? '-'}',
                color: primary,
              ),
              const SizedBox(height: 8),
              if ((offer.labo ?? '').isNotEmpty) ...[
                _LabelValue(
                  label: context.i10n.labelLaboratory,
                  value: offer.labo!,
                  color: primary,
                ),
                const SizedBox(height: 8),
              ],
              if ((offer.type ?? '').isNotEmpty) ...[
                _LabelValue(
                  label: context.i10n.labelType,
                  value: offer.type!,
                  color: primary,
                ),
                const SizedBox(height: 8),
              ],
              if ((offer.terType ?? '').isNotEmpty) ...[
                _LabelValue(
                  label: context.i10n.labelTierType,
                  value: offer.terType!,
                  color: primary,
                ),
                const SizedBox(height: 8),
              ],
              _LabelValue(
                label: context.i10n.labelAmount,
                value: _money(offer.montant ?? offer.montantConsom),
                color: primary,
              ),
              const SizedBox(height: 8),
              _LabelValue(
                label: context.i10n.labelDates,
                value: dates,
                color: primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _date(BuildContext context, String? iso) {
    if (iso == null || iso.isEmpty) return '';
    try {
      final d = DateTime.tryParse(iso);
      if (d == null) return iso;
      return DateFormat.yMMMd(Localizations.localeOf(context).toString())
          .format(d);
    } catch (_) {
      return iso;
    }
  }

  String _money(num? value) {
    if (value == null) return '-';
    final f = NumberFormat.currency(symbol: 'DA', decimalDigits: 0);
    return f.format(value);
  }
}

class _LabelValue extends StatelessWidget {
  const _LabelValue(
      {required this.label, required this.value, required this.color});
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: context.textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value.isEmpty ? '-' : value,
            style: context.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
