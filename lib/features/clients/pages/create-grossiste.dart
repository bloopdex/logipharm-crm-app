import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../blocs/grossiste/grossiste_cubit.dart';
import '../blocs/fournisseur_lov/fournisseur_lov_cubit.dart';
import '../../../shared/widgets/loading/loader.widget.dart';

class CreateGrossistePage extends StatefulWidget {
  final int pharmacyId;

  const CreateGrossistePage({super.key, required this.pharmacyId});

  @override
  State<CreateGrossistePage> createState() => _CreateGrossistePageState();
}

class _CreateGrossistePageState extends State<CreateGrossistePage> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<int> selectedFournisseurs = [];
  List<int> initialSelectedFournisseurs = [];

  @override
  void initState() {
    super.initState();
    // Load fournisseur LOV and existing grossistes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FournisseurLovCubit>().load();
      context.read<GrossisteCubit>().get(pharmacyId: widget.pharmacyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GrossisteCubit, GrossisteState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (grossistes) {
            // Extract fournisseur IDs from existing grossistes only on initial load
            if (initialSelectedFournisseurs.isEmpty && grossistes.isNotEmpty) {
              setState(() {
                // Try to extract fournisseur ID from title or other fields
                // Since we store fournisseur name in titre, we need to match it back
                initialSelectedFournisseurs = [];
                selectedFournisseurs = [];
              });
            }
          },
          error: (error) {
            context.errorSnackBar(error);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              size: kSpacingX7,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            context.i10n.addGrossiste,
            style: context.textTheme.headlineMedium,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints(
              maxHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              minHeight:
                  context.height - context.appBarSize - context.paddingBottom,
              maxWidth: context.width,
              minWidth: context.width,
            ),
            child: Column(
              children: [
                const Divider(),
                Expanded(
                  child: BlocBuilder<FournisseurLovCubit, FournisseurLovState>(
                    builder: (context, fournisseurState) {
                      return fournisseurState.maybeWhen(
                        loading: () => const Center(child: Loader()),
                        error: (message) => Center(
                          child: Text(
                            'Error loading suppliers: $message',
                            style: TextStyle(color: kCardinal),
                          ),
                        ),
                        loaded: (fournisseurs) {
                          return BlocBuilder<GrossisteCubit, GrossisteState>(
                            builder: (context, grossisteState) {
                              // Initialize selected fournisseurs from loaded grossistes
                              grossisteState.maybeWhen(
                                orElse: () {},
                                loaded: (grossistes) {
                                  if (selectedFournisseurs.isEmpty &&
                                      grossistes.isNotEmpty) {
                                    // Extract fournisseur IDs directly from grossistes
                                    final matchedIds = grossistes
                                        .where((g) => g.fournisseurId != null)
                                        .map((g) => g.fournisseurId!)
                                        .toList();
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (mounted) {
                                        setState(() {
                                          selectedFournisseurs = matchedIds;
                                        });
                                      }
                                    });
                                  }
                                },
                              );

                              return ListView(
                                padding: EdgeInsets.symmetric(
                                  horizontal: kPaddingLg1,
                                  vertical: kPaddingSm1,
                                ),
                                children: [
                                  Text(
                                    context.i10n.supplier,
                                    style: context.textTheme.headlineMedium,
                                  ),
                                  SizedBox(height: kSpacingX2),
                                  Text(
                                    'Sélectionnez les grossistes (plusieurs choix possibles)',
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: kSpacingX3),
                                  ...fournisseurs.map((fournisseur) {
                                    final isSelected = selectedFournisseurs
                                        .contains(fournisseur.id);
                                    return CheckboxListTile(
                                      title: Text(fournisseur.label),
                                      value: isSelected,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          if (value == true) {
                                            selectedFournisseurs
                                                .add(fournisseur.id);
                                          } else {
                                            selectedFournisseurs
                                                .remove(fournisseur.id);
                                          }
                                        });
                                      },
                                      activeColor: kPrimaryColor,
                                    );
                                  }),
                                ],
                              );
                            },
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kPaddingLg1,
                    vertical: kPaddingSm1,
                  ),
                  child: BlocBuilder<FournisseurLovCubit, FournisseurLovState>(
                    builder: (context, fournisseurState) {
                      return CustomButton(
                        text: context.i10n.save,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // Build fournisseurs list with id and name
                            final fournisseurs = fournisseurState.maybeWhen(
                              loaded: (fournisseursList) {
                                return selectedFournisseurs
                                    .map((id) {
                                      try {
                                        final fournisseur = fournisseursList
                                            .firstWhere((f) => f.id == id);
                                        return {
                                          'id': fournisseur.id,
                                          'name': fournisseur.label,
                                        };
                                      } catch (e) {
                                        return null;
                                      }
                                    })
                                    .where((item) => item != null)
                                    .cast<Map<String, dynamic>>()
                                    .toList();
                              },
                              orElse: () => <Map<String, dynamic>>[],
                            );

                            final data = {
                              'pharmacieId': widget.pharmacyId,
                              'fournisseurs': fournisseurs,
                              'rapport': '',
                              'rapportText': '',
                            };

                            context
                                .read<GrossisteCubit>()
                                .bulkUpdate(data: data);
                            context.pop();
                          }
                        },
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
