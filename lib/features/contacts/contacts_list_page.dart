import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contacts_cubit.dart';
import 'models/contact.dart';
import 'contact_form_page.dart';
import 'contact_details_page.dart';
import '../../shared/widgets/container/profile-container.widget.dart';

class ContactsListPage extends StatefulWidget {
  static const routeName = '/contacts';
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  final ValueNotifier<Set<String>> _selectedCats =
      ValueNotifier({'1', '2', '3'});

  @override
  void initState() {
    super.initState();
    context
        .read<ContactsCubit>()
        .load(categories: _selectedCats.value.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.contactsTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ContactFormPage()),
          );
          context
              .read<ContactsCubit>()
              .load(categories: _selectedCats.value.toList());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Wrap(
              spacing: kSpacingX2,
              children: [
                FilterChip(
                  label: Text(context.i10n.contactsPharmacien),
                  selected: _selectedCats.value.contains('1'),
                  onSelected: (v) {
                    setState(() {
                      v
                          ? _selectedCats.value.add('1')
                          : _selectedCats.value.remove('1');
                    });
                    context
                        .read<ContactsCubit>()
                        .load(categories: _selectedCats.value.toList());
                  },
                ),
                FilterChip(
                  label: Text(context.i10n.contactsMedecin),
                  selected: _selectedCats.value.contains('2'),
                  onSelected: (v) {
                    setState(() {
                      v
                          ? _selectedCats.value.add('2')
                          : _selectedCats.value.remove('2');
                    });
                    context
                        .read<ContactsCubit>()
                        .load(categories: _selectedCats.value.toList());
                  },
                ),
                FilterChip(
                  label: Text(context.i10n.contactsPatient),
                  selected: _selectedCats.value.contains('3'),
                  onSelected: (v) {
                    setState(() {
                      v
                          ? _selectedCats.value.add('3')
                          : _selectedCats.value.remove('3');
                    });
                    context
                        .read<ContactsCubit>()
                        .load(categories: _selectedCats.value.toList());
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(child: Text(message)),
                  loaded: (contacts) {
                    if (contacts.isEmpty) {
                      return Center(child: Text(context.i10n.contactsEmpty));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: kPaddingMd2,
                        vertical: kPaddingSm3,
                      ),
                      itemCount: contacts.length,
                      itemBuilder: (_, i) => _ContactCard(contact: contacts[i]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact});
  final Contact contact;

  String _catLabel(BuildContext context, String? cat) {
    switch (cat) {
      case '1':
        return context.i10n.contactsPharmacien;
      case '2':
        return context.i10n.contactsMedecin;
      case '3':
        return context.i10n.contactsPatient;
      default:
        return '-';
    }
  }

  @override
  Widget build(BuildContext context) {
    final name = [contact.nom, contact.prenom]
        .where((e) => (e ?? '').isNotEmpty)
        .join(' ');
    return Card(
      elevation: 1,
      margin: EdgeInsets.only(bottom: kSpacingX2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSpacingX3)),
      child: InkWell(
        borderRadius: BorderRadius.circular(kSpacingX3),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ContactDetailsPage(contact: contact)),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(kPaddingMd2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileCard(
                size: 48,
                text: name.isNotEmpty ? name : (contact.nom ?? '-'),
                backgroundColor: kCeruleanBlue.shade100,
                borderColor: kCeruleanBlue,
                textStyle:
                    context.textTheme.labelLarge!.copyWith(color: kWhite),
              ),
              SizedBox(width: kSpacingX3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name.isNotEmpty ? name : (contact.nom ?? '-'),
                            style: context.textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSpacingX1),
                    Wrap(
                      spacing: kSpacingX2,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Chip(
                          label: Text(_catLabel(context, contact.categorie)),
                          backgroundColor: kBgGrayVisibility1,
                          padding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        if ((contact.ville ?? '').isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16),
                              SizedBox(width: kSpacingX1),
                              Text(contact.ville!),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: kSpacingX2),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if ((contact.tel1 ?? '').isNotEmpty)
                    IconButton(
                      tooltip: 'Call',
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        // leaving integration for url_launcher to future enhancement
                      },
                    ),
                  if ((contact.email ?? '').isNotEmpty)
                    IconButton(
                      tooltip: 'Email',
                      icon: const Icon(Icons.email_outlined),
                      onPressed: () {},
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
