import 'dart:convert';

import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final QuillController _quillController = QuillController.basic();
  final FocusNode _quillFocusNode = FocusNode();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> grossiste = {};

  @override
  void initState() {
    super.initState();
    grossiste['pharmacieId'] = widget.pharmacyId;
    // Load fournisseur LOV after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FournisseurLovCubit>().load();
    });
  }

  @override
  void dispose() {
    _quillFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GrossisteCubit, GrossisteState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (grossistes) {
            context.pop();
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(160.h),
            child: QuillSimpleToolbar(
                controller: _quillController,
                config: QuillSimpleToolbarConfig(
                  showAlignmentButtons: true,
                  showBackgroundColorButton: false,
                  showColorButton: false,
                  showCodeBlock: false,
                  showQuote: false,
                  showLink: false,
                  showClearFormat: false,
                  showInlineCode: false,
                  showListCheck: false,
                  showJustifyAlignment: false,
                  showHeaderStyle: false,
                  showSearchButton: false,
                  showFontFamily: false,
                )),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
              constraints: BoxConstraints(
                maxHeight: context.height -
                    context.appBarSize -
                    context.paddingBottom -
                    160.h,
                minHeight: context.height -
                    context.appBarSize -
                    context.paddingBottom -
                    160.h,
                maxWidth: context.width,
                minWidth: context.width,
              ),
              child: Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kPaddingLg1,
                      vertical: kPaddingSm1,
                    ),
                    child:
                        BlocBuilder<FournisseurLovCubit, FournisseurLovState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: Loader()),
                          error: (message) => Text(
                            'Error loading suppliers: $message',
                            style: TextStyle(color: kCardinal),
                          ),
                          loaded: (fournisseurs) {
                            return DropdownButtonFormField<int>(
                              decoration: InputDecoration(
                                labelText: context.i10n.supplier,
                                labelStyle: context.textTheme.bodyLarge,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kPaddingSm3),
                                ),
                              ),
                              value: grossiste['fournisseurId'],
                              onChanged: (int? value) {
                                setState(() {
                                  grossiste['fournisseurId'] = value;
                                  // Store the fournisseur name to use as title
                                  final selected = fournisseurs.firstWhere(
                                    (f) => f.id == value,
                                  );
                                  grossiste['titre'] = selected.label;
                                });
                              },
                              items: fournisseurs
                                  .map<DropdownMenuItem<int>>(
                                      (fournisseur) => DropdownMenuItem(
                                            value: fournisseur.id,
                                            child: Text(fournisseur.label),
                                          ))
                                  .toList(),
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kPaddingLg1,
                        vertical: kPaddingSm1,
                      ),
                      child: QuillEditor(
                        focusNode: _quillFocusNode,
                        controller: _quillController,
                        config: QuillEditorConfig(
                          scrollable: true,
                          autoFocus: false,
                          placeholder:
                              context.i10n.visitCreationRapportPlaceholder,
                          expands: false,
                          showCursor: true,
                        ),
                        scrollController: ScrollController(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: kPaddingLg1,
                    ),
                    child: CustomButton(
                        text: context.i10n.save,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            grossiste['rapportText'] =
                                _quillController.document.toPlainText();
                            grossiste['rapport'] = json.encode(
                                _quillController.document.toDelta().toJson());
                            context
                                .read<GrossisteCubit>()
                                .create(data: grossiste);
                            context.pop();
                          }
                        }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
