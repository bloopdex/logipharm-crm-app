import 'package:crm/core/core.dart';
import 'package:crm/features/contacts/bloc/contacts_cubit.dart';
import 'package:crm/features/contacts/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectContactPage extends StatefulWidget {
  const SelectContactPage({super.key});

  @override
  State<SelectContactPage> createState() => _SelectContactPageState();
}

class _SelectContactPageState extends State<SelectContactPage> {
  final ValueNotifier<Set<String>> _selectedCats =
      ValueNotifier({'1', '2', '3'});
  final TextEditingController _search = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<ContactsCubit>()
        .load(categories: _selectedCats.value.toList());
    _search.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.contactsTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(kPaddingMd2),
            child: Column(
              children: [
                TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    hintText: 'Search contacts',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSpacingX3),
                    ),
                  ),
                ),
                SizedBox(height: kSpacingX2),
                Wrap(
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
                    final filtered = contacts.where((c) {
                      final q = _search.text.trim().toLowerCase();
                      if (q.isEmpty) return true;
                      final name =
                          ('${c.nom ?? ''} ${c.prenom ?? ''}').toLowerCase();
                      return name.contains(q) ||
                          (c.email ?? '').toLowerCase().contains(q);
                    }).toList();

                    if (filtered.isEmpty) {
                      return Center(child: Text(context.i10n.contactsEmpty));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: kPaddingMd2, vertical: kPaddingSm3),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) => _ContactTile(contact: filtered[i]),
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

class _ContactTile extends StatelessWidget {
  const _ContactTile({required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final name = [contact.nom, contact.prenom]
        .where((e) => (e ?? '').isNotEmpty)
        .join(' ');
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: kSpacingX2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSpacingX3)),
      child: ListTile(
        onTap: () => Navigator.of(context).pop<Contact>(contact),
        title: Text(name.isNotEmpty ? name : (contact.nom ?? '-')),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if ((contact.ville ?? '').isNotEmpty) Text(contact.ville!),
            if ((contact.email ?? '').isNotEmpty) Text(contact.email!),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
