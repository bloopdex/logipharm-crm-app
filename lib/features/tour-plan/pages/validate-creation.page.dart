import 'package:crm/features/clients/clients.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/core.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../models/person/person.dart';
import '../../contacts/bloc/contacts_cubit.dart';
import '../../contacts/models/contact.dart';
import '../bloc/clients/clients_cubit.dart';
import '../bloc/delegate_cubit.dart';
import '../bloc/tour-creation/tour_creation_cubit.dart';

class ValidateCreationPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const ValidateCreationPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print("Data $data");
    // get the delegate from the cubit by delegate id
    final delegate = context
        .read<DelegateCubit>()
        .state
        .firstWhere((element) => element.id.toString() == data['delegueId']);

    // get the clients from the cubit by pharmacy id (default)
    final clients = context.read<ClientsCubit>().state.maybeWhen(
        orElse: () => <Person>[],
        loaded: (all, filter) => all
            .where((element) => data['pharmacieIds']
                ?.contains('${element.id.toString()}:${element.typeTier}'))
            .toList());

    // If companyType==0 (contacts flow), resolve selected contacts from pharmacieIds (formatted as id:typeclient)
    final user = context.read<AuthBloc>().user;
    final List<Contact> contacts = user.companyType == 1
        ? context.read<ContactsCubit>().state.maybeWhen(
              orElse: () => <Contact>[],
              loaded: (all) {
                final ids = (data['pharmacieIds'] as List?)
                        ?.map((e) => '$e'.split(':').first)
                        .map((e) => int.tryParse(e))
                        .whereType<int>()
                        .toSet() ??
                    <int>{};
                return all.where((c) => ids.contains(c.id)).toList();
              },
            )
        : <Contact>[];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<TourCreationCubit, TourCreationState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                failure: (message) => Container(
                    padding: EdgeInsets.all(kPaddingMd2),
                    margin: EdgeInsets.only(bottom: kSpacingX6),
                    decoration: BoxDecoration(
                      color: kCardinal.shade100,
                      borderRadius: BorderRadius.circular(kSpacingX3),
                      border: Border.all(color: kCardinal.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_rounded,
                          color: kCardinal.shade600,
                        ),
                        SizedBox(width: kSpacingX5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.tourCreationErrorTitle,
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                context.i10n.tourCreationErrorDescription,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          ),
          Text(
            context.i10n.tourValidationTitle,
            style: context.textTheme.displayMedium,
          ),
          SizedBox(height: kSpacingX7),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: kPaddingMd2),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(kSpacingX3),
              border: Border.all(color: kBorder3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kPaddingSm3),
                          decoration: BoxDecoration(
                            color: kCodGray.shade100,
                            borderRadius: BorderRadius.circular(kPaddingSm3),
                          ),
                          child: Center(
                            child: Text(
                              DateFormat("d\nMMM").format(
                                DateTime.parse(data['dateDebut']),
                              ),
                              textAlign: TextAlign.center,
                              style: context.textTheme.displaySmall!.copyWith(
                                color: kBrightSun.shade600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: kSpacingX4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.tourValidationPlanBy,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                delegate.fullName,
                                style: context.textTheme.displaySmall,
                              ),
                              SizedBox(height: kSpacingX1),
                              Text(
                                DateTime.parse(data['dateDebut']).ddMMYYYY(),
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: kSpacingX3),
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                  child: Text(
                    user.companyType == 1
                        ? 'Contacts: ${contacts.length}'
                        : context.i10n
                            .tourValidationClientLabelNumber(clients.length),
                    style: context.textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: user.companyType == 1
                      ? ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];
                            final name = [contact.nom, contact.prenom]
                                .where((e) => (e ?? '').isNotEmpty)
                                .join(' ');
                            return ListTile(
                              leading: CircleAvatar(
                                  child: Text(name.isNotEmpty ? name[0] : '?')),
                              title: Text(name.isNotEmpty
                                  ? name
                                  : (contact.nom ?? '-')),
                              subtitle: Text(
                                  contact.adresse ?? context.i10n.noAddress),
                            );
                          },
                        )
                      : ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: clients.length,
                          itemBuilder: (context, index) {
                            final Person client = clients[index];
                            return ClientCard(client: client);
                          },
                        ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
