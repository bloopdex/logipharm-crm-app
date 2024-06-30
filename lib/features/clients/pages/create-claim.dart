import 'dart:convert';

import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../blocs/claims-motifs/motifs_cubit.dart';
import '../blocs/claims/claim_cubit.dart';

class CreateClaimPage extends StatefulWidget {
  final int pharmacyId;

  const CreateClaimPage({super.key, required this.pharmacyId});

  @override
  State<CreateClaimPage> createState() => _CreateClaimPageState();
}

class _CreateClaimPageState extends State<CreateClaimPage> {
  final QuillController _quillController = QuillController.basic();

  final FocusNode _quillFocusNode = FocusNode();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> claim = {};

  @override
  void initState() {
    claim['pharmacieId'] = widget.pharmacyId;
    super.initState();
  }

  @override
  void dispose() {
    _quillFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ClaimCubit, ClaimState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (claims) {
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
            context.i10n.addClaim,
            style: context.textTheme.headlineMedium,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(160.sp),
            child: QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
              controller: _quillController,
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
                maxHeight: context.height - context.appBarSize - context.paddingBottom - 160.sp,
                minHeight: context.height - context.appBarSize - context.paddingBottom - 160.sp,
                maxWidth: context.width,
                minWidth: context.width,
              ),
              child: Column(
                children: [
                  const Divider(),
                  // Dropdown menu for motifs using ClaimMotifCubit
                  BlocBuilder<ClaimMotifCubit, ClaimMotifState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Container(),
                        loading: () => const Center(
                          child: Loader(),
                        ),
                        loaded: (motifs) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: kPaddingLg1,
                              vertical: kPaddingSm1,
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: context.i10n.homeHello,
                                labelStyle: context.textTheme.bodyLarge,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(kPaddingSm3),
                                ),
                              ),
                              value: claim['motif'],
                              onChanged: (String? value) {
                                setState(() {
                                  claim['motif'] = value;
                                });
                              },
                              items: motifs
                                  .map<DropdownMenuItem<String>>((motif) => DropdownMenuItem(
                                        value: motif.id.toString(),
                                        child: Text(motif.label),
                                      ))
                                  .toList(),
                            ),
                          );
                        },
                        error: (error) {
                          return Center(child: Text(error));
                        },
                      );
                    },
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
                        configurations: QuillEditorConfigurations(
                          controller: _quillController,
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
                            claim['rapportText'] = _quillController.document.toPlainText();
                            claim['rapport'] =
                                json.encode(_quillController.document.toDelta().toJson());
                            context.read<ClaimCubit>().create(data: claim);
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
