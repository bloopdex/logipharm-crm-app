import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/search/search_cubit.dart';
import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../contacts/bloc/contacts_cubit.dart';
import '../contacts/models/contact.dart';

class AddContactSelection extends StatefulWidget {
  const AddContactSelection({super.key});

  @override
  State<AddContactSelection> createState() => _AddContactSelectionState();
}

class _AddContactSelectionState extends State<AddContactSelection> {
  List<Contact> _allContacts = [];
  List<Contact> _visibleContacts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ContactsCubit>();
    final state = cubit.state;
    state.maybeWhen(
      loaded: (contacts) {
        _allContacts = contacts;
        _visibleContacts = _filterContacts('');
      },
      orElse: () async {
        await cubit.load(categories: const ['1', '2', '3']);
      },
    );
  }

  List<Contact> _filterContacts(String query) {
    final lower = query.toLowerCase();
    return _allContacts.where((contact) {
      final name = [contact.nom, contact.prenom]
          .where((e) => (e ?? '').isNotEmpty)
          .join(' ')
          .toLowerCase();
      final city = (contact.ville ?? '').toLowerCase();
      return lower.isEmpty || name.contains(lower) || city.contains(lower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.contacts,
            style: context.textTheme.headlineMedium),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, String>(
            listener: (context, state) {
              setState(() {
                _searchQuery = state;
                _visibleContacts = _filterContacts(state);
              });
            },
          ),
          BlocListener<ContactsCubit, ContactsState>(
            listener: (context, state) {
              state.maybeWhen(
                loaded: (contacts) {
                  setState(() {
                    _allContacts = contacts;
                    _visibleContacts = _filterContacts(_searchQuery);
                  });
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            constraints: BoxConstraints(
              minHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              maxHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              minWidth: context.width,
              maxWidth: context.width,
            ),
            child: Column(
              children: [
                SearchTextField(
                  hintText: context.i10n.contactLabel,
                ),
                SizedBox(height: kSpacingX2),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_visibleContacts.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SVG(
                                'empty-states/info.svg',
                                height: 175.h,
                              ),
                              SizedBox(height: kSpacingX3),
                              Text(
                                context.i10n.contacts,
                                style: context.textTheme.headlineMedium,
                              ),
                              SizedBox(height: kSpacingX2),
                              Text(
                                context.i10n.tourEmptyPlansDescription,
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () async {
                          await context
                              .read<ContactsCubit>()
                              .load(categories: const ['1', '2', '3']);
                        },
                        child: ListView.separated(
                          itemCount: _visibleContacts.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: kSpacingX3),
                          itemBuilder: (context, index) {
                            final contact = _visibleContacts[index];
                            final name = [contact.nom, contact.prenom]
                                .where((e) => (e ?? '').isNotEmpty)
                                .join(' ')
                                .trim();
                            final initials = name.initials.isEmpty
                                ? (contact.nom ?? context.i10n.contactLabel)
                                    .trim()
                                    .initials
                                : name.initials;
                            return ListTile(
                              leading: ProfileCard(
                                size: 48.h,
                                text: initials,
                                borderColor: kCeruleanBlue,
                              ),
                              title: Text(name.isEmpty
                                  ? context.i10n.contactLabel
                                  : name),
                              subtitle: Text(
                                [contact.ville, contact.adresse]
                                    .where((e) => (e ?? '').isNotEmpty)
                                    .join(' • '),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () => Navigator.of(context).pop(contact),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
