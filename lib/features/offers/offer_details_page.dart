import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/error/error.widget.dart';
// removed custom list loading; using centered CircularProgressIndicator
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/paliers_cubit.dart';
import 'models/offer_dto.dart';
import 'models/palier_dto.dart';

class OfferDetailsPage extends StatelessWidget {
  const OfferDetailsPage({super.key, required this.offer});
  final OfferDto offer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OfferPaliersCubit()..load(offer.id ?? 0),
      child: _OfferDetailsView(offer: offer),
    );
  }
}

class _OfferDetailsView extends StatelessWidget {
  const _OfferDetailsView({required this.offer});
  final OfferDto offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.offerDetailsTitle(
            offer.reference ?? '${offer.id ?? ''}',
          ),
        ),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: BlocBuilder<OfferPaliersCubit, OfferPaliersState>(
        builder: (context, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (msg) => _ErrorRetry(
            message: msg,
            onRetry: () =>
                context.read<OfferPaliersCubit>().load(offer.id ?? 0),
          ),
          empty: () => Center(child: Text(context.i10n.emptyPaliers)),
          loaded: (paliers) => _DetailsContent(offer: offer, paliers: paliers),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
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

class _DetailsContent extends StatelessWidget {
  const _DetailsContent({required this.offer, required this.paliers});
  final OfferDto offer;
  final List<PalierDto> paliers;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(kPaddingMd2),
      children: [
        _OfferHeader(offer: offer),
        const SizedBox(height: 12),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.i10n.paliersTitle,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.theme.colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                ...paliers.map((p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: _PalierRow(p: p),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _OfferHeader extends StatelessWidget {
  const _OfferHeader({required this.offer});
  final OfferDto offer;
  @override
  Widget build(BuildContext context) {
    final primary = context.theme.colorScheme.primary;
    final dates = (offer.debut != null || offer.fin != null)
        ? '${_date(context, offer.debut)} → ${_date(context, offer.fin)}'
        : '-';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

class _PalierRow extends StatelessWidget {
  const _PalierRow({required this.p});
  final PalierDto p;
  @override
  Widget build(BuildContext context) {
    final primary = context.theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.theme.dividerColor.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _LabelValue(
                  label: context.i10n.labelMin,
                  value: (p.valMin?.toString() ?? '-'),
                  color: primary,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _LabelValue(
                  label: context.i10n.labelMax,
                  value: (p.valMax?.toString() ?? '-'),
                  color: primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          _LabelValue(
            label: context.i10n.labelType,
            value: (p.type ?? '-'),
            color: primary,
          ),
          const SizedBox(height: 6),
          _LabelValue(
            label: context.i10n.labelValue,
            value: (p.valeur?.toString() ?? '-'),
            color: primary,
          ),
        ],
      ),
    );
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
