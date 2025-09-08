// ClientSelectionForm.dart
import 'dart:developer';

import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/motif_visit/motif_visit.dart';
import 'package:crm/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../logic/auth/auth_bloc.dart';
import '../../../models/person/person.dart';
import '../../../shared/widgets/inputs/date.time.picker.input.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../../tour-plan/bloc/visit_motif_cubit.dart';
import '../../tour-plan/models/tour.dart';
import '../add_client_selection.dart';

class ClientSelectionForm extends StatefulWidget {
  final List<TourDetail> clients;
  final Map<String, dynamic> data;
  final QuillController quillController;
  final Function()? onQuillFocus;
  final Tour? tour;
  final Function()? onQuillChange;

  const ClientSelectionForm({
    super.key,
    required this.data,
    required this.clients,
    required this.quillController,
    this.onQuillFocus,
    this.tour,
    this.onQuillChange,
  });

  @override
  State<ClientSelectionForm> createState() => _ClientSelectionFormState();
}

class _ClientSelectionFormState extends State<ClientSelectionForm> {
  late User user;

  final FocusNode _quillFocusNode = FocusNode();
  Person? pharmacy;
  bool isReportValid = false;

  @override
  void initState() {
    super.initState();

    // Initialize the user from AuthBloc
    user = context.read<AuthBloc>().user;

    log("TourPlan Rami: ${widget.tour?.toJson()}");

    // Initialize validation based on initial content
    isReportValid =
        widget.quillController.document.toPlainText().trim().length >= (user.minReportChar ?? 1);

    if (widget.data['pharmacieId'] != null) {
      pharmacy = widget.clients
          .where((element) {
            return '${element.pharmacy?.id.toString()}:${element.pharmacy?.typeTier}' ==
                widget.data['pharmacieId'];
          })
          .firstOrNull
          ?.pharmacy;
    } else {
      pharmacy = widget.clients.firstOrNull?.pharmacy;
    }

    _quillFocusNode.addListener(_handleQuillFocusChange);
    widget.quillController.addListener(() {
      final textLength = widget.quillController.document.toPlainText().trim().length;
      setState(() {
        isReportValid = textLength >= (user.minReportChar ?? 1);
      });
      widget.onQuillChange?.call();
    });
  }

  @override
  void dispose() {
    _quillFocusNode.removeListener(_handleQuillFocusChange);
    _quillFocusNode.dispose();
    super.dispose();
  }

  void _handleQuillFocusChange() {
    if (_quillFocusNode.hasFocus) {
      widget.onQuillFocus?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.i10n.visitCreationTitle,
                  style: context.textTheme.displayMedium,
                ),
                SizedBox(height: kSpacingX3),
                Text(
                  context.i10n.visitCreationDescription,
                  style: context.textTheme.bodyLarge,
                ),
                SizedBox(height: kSpacingX7),
                Text(
                  context.i10n.visitCreationClientLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropDownInput(
                        data: widget.data,
                        mapKey: 'pharmacieId',
                        items: [
                          if (pharmacy == null)
                            CustomDropDownItem(
                              label: context.i10n.selectClient,
                              value: "",
                            ),
                          if (pharmacy != null)
                            CustomDropDownItem(
                              label: pharmacy!.fullName,
                              value: '${pharmacy!.id}:${pharmacy!.typeTier}',
                            ),
                          ...widget.clients
                              .where((e) =>
                                  e.pharmacy != null &&
                                  '${e.pharmacy?.id}:${e.pharmacy?.typeTier}' !=
                                      widget.data['pharmacieId'])
                              .map(
                                (e) => CustomDropDownItem(
                                  label: e.pharmacy?.fullName ?? "",
                                  value: '${e.pharmacy?.id}:${e.pharmacy?.typeTier}',
                                ),
                              ),
                        },
                      ),
                    ),
                    if (context.user.addVisitOutPlanPrivilege == true)
                      Row(
                        children: [
                          SizedBox(width: kPaddingSm2),
                          IconButton(
                            onPressed: () async {
                              Person? pharmacy = await Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AddClientSelection()),
                              );

                              if (!context.mounted || pharmacy == null) return;

                              setState(() {
                                widget.data['pharmacieId'] =
                                    '${pharmacy.id.toString()}:${pharmacy.typeTier.toString()}';
                                widget.data['tourneeId'] = null;
                                widget.data['clientAuthorizedRadius'] = pharmacy.authorizedRadius;
                              });
                              widget.onQuillChange?.call();
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                  ],
                ),
                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationDateLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                CustomDateTimePicker(
                  data: widget.data,
                  firstDate: DateTime.parse(widget.tour?.startDate ?? DateTime.now().toString()),
                  initialDate: DateTime.now(),
                  onChanged: (value) {
                    widget.onQuillChange?.call();
                  },
                  mapKey: 'dateDebut',
                ),
                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationReasonLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                BlocBuilder<MotifVisitCubit, List<MotifVisit>>(
                  builder: (context, state) {
                    if (state.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      // Deduplicate motifs by id
                      final uniqueMotifs = <MotifVisit>{};
                      final deduplicatedMotifs =
                          state.where((motif) => uniqueMotifs.add(motif)).toList();

                      // Extract values from dropdown items
                      final itemValues = <String>[
                        ...deduplicatedMotifs.map((motif) => motif.id.toString()),
                      ];

                      // Ensure the current value exists in items; default to empty if not
                      final currentValue =
                          widget.data['motif'] == null || !itemValues.contains(widget.data['motif'])
                              ? ""
                              : widget.data['motif'];

                      return CustomDropDownInput(
                        data: widget.data,
                        mapKey: 'motif',
                        items: [
                          CustomDropDownItem(
                            label: context.i10n.selectReason,
                            value: "",
                          ),
                          ...deduplicatedMotifs.map(
                            (motif) => CustomDropDownItem(
                              value: motif.id.toString(),
                              label: motif.label ?? "",
                            ),
                          ),
                        ],
                        initialValue: currentValue,
                        onChanged: (value) {
                          setState(() {
                            widget.data['motif'] = value;
                          });
                          widget.onQuillChange?.call();
                        },
                      );
                    }
                  },
                ),
                SizedBox(height: kSpacingX5),
                Text(
                  context.i10n.visitCreationRapportLabel,
                  style: context.textTheme.bodyMedium,
                ),
                SizedBox(height: kSpacingX1),
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: QuillEditor(
                    focusNode: _quillFocusNode,
                    controller: widget.quillController,
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
                // Add error message if report is too short
                if (!isReportValid)
                  Padding(
                    padding: EdgeInsets.only(top: kSpacingX1),
                    child: Text(
                      context.i10n.visitCreationRapportMinCharError(user.minReportChar ?? 1),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
