import 'dart:developer';

import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/models/motif_visit/motif_visit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../models/person/person.dart';
import '../../../shared/widgets/inputs/date.picker.input.dart';
import '../../../shared/widgets/inputs/dropdown.input.dart';
import '../../tour-plan/bloc/visit_motif_cubit.dart';
import '../../tour-plan/models/tour.dart';
import '../add_client_selection.dart';

class ClientSelectionForm extends StatefulWidget {
  final List<TourDetail> clients;
  final Map<String, dynamic> data;
  final QuillController quillController;
  final Function()? onQuillFocus;

  const ClientSelectionForm({
    super.key,
    required this.data,
    required this.clients,
    required this.quillController,
    this.onQuillFocus,
  });

  @override
  State<ClientSelectionForm> createState() => _ClientSelectionFormState();
}

class _ClientSelectionFormState extends State<ClientSelectionForm> {
  final FocusNode _quillFocusNode = FocusNode();
  Person? pharmacy;

  @override
  void initState() {
    super.initState();
    log('pharmacy: $pharmacy');
    if (widget.data['pharmacieId'] != null) {
      pharmacy = widget.clients
          .where((element) =>
              '${element.pharmacy?.id.toString()}:${element.pharmacy?.typeTier}' ==
              widget.data['pharmacieId'])
          .firstOrNull
          ?.pharmacy;
    } else {
      pharmacy = widget.clients.firstOrNull?.pharmacy;
    }
    log('pharmacy: $pharmacy');
    _quillFocusNode.addListener(_handleQuillFocusChange);
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
                  ],
                ),
              ),
              if (context.user.addVisitOutPlanPrivilege == 1)
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
                          this.pharmacy = pharmacy;
                        });
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
          CustomDatePicker(
            data: widget.data,
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
                return CustomDropDownInput(
                  data: widget.data,
                  mapKey: 'motif',
                  items: [
                    CustomDropDownItem(
                      label: context.i10n.selectReason,
                      value: "",
                    ),
                    ...state.map((motif) => CustomDropDownItem(
                          value: motif.id.toString(),
                          label: motif.label ?? "",
                        ))
                  ],
                  initialValue: widget.data['motif'],
                  onChanged: (value) {
                    setState(() {
                      widget.data['motif'] = value;
                    });
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
          Expanded(
            child: QuillEditor(
              focusNode: _quillFocusNode,
              configurations: QuillEditorConfigurations(
                controller: widget.quillController,
                scrollable: true,
                autoFocus: false,
                placeholder: context.i10n.visitCreationRapportPlaceholder,
                expands: false,
                showCursor: true,
              ),
              scrollController: ScrollController(),
            ),
          ),
        ],
      ),
    );
  }
}
