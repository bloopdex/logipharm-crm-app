import 'dart:convert';

import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../blocs/etablissement/etablissement_cubit.dart';

class CreateEtablissementPage extends StatefulWidget {
  final int pharmacyId;

  const CreateEtablissementPage({super.key, required this.pharmacyId});

  @override
  State<CreateEtablissementPage> createState() => _CreateEtablissementPageState();
}

class _CreateEtablissementPageState extends State<CreateEtablissementPage> {
  final QuillController _quillController = QuillController.basic();
  final FocusNode _quillFocusNode = FocusNode();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> etablissement = {};

  @override
  void initState() {
    etablissement['pharmacieId'] = widget.pharmacyId;
    super.initState();
  }

  @override
  void dispose() {
    _quillFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EtablissementCubit, EtablissementState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (etablissements) {
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
            context.i10n.addEtablissement,
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
                maxHeight: context.height - context.appBarSize - context.paddingBottom - 160.h,
                minHeight: context.height - context.appBarSize - context.paddingBottom - 160.h,
                maxWidth: context.width,
                minWidth: context.width,
              ),
              child: Column(
                children: [
                  const Divider(),
                  TextFormField(
                    initialValue: etablissement['titre'],
                    style: context.textTheme.displayMedium,
                    cursorColor: kPrimaryColor,
                    maxLines: 2,
                    onSaved: (String? value) {
                      etablissement['titre'] = value;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return context.i10n.todoTitleError;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: context.i10n.todoTitlePlaceholder,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: context.textTheme.displayMedium,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: kPaddingLg1,
                          vertical: kPaddingSm1,
                        )),
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
                          placeholder: context.i10n.visitCreationRapportPlaceholder,
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
                            etablissement['rapportText'] = _quillController.document.toPlainText();
                            etablissement['rapport'] =
                                json.encode(_quillController.document.toDelta().toJson());
                            context.read<EtablissementCubit>().create(data: etablissement);
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
