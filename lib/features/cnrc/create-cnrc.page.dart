import 'package:crm/core/core.dart';
import 'package:crm/features/tour-plan/bloc/commune_cubit.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/inputs/dropdown.input.dart';
import '../tour-plan/bloc/wilaya_cubit.dart';
import '../tour-plan/models/commune/commune.dart';
import '../tour-plan/models/wilaya/wilaya.dart';
import 'cubit/cnrc-create/cnrc_create_cubit.dart';

class CreateCNRCPage extends StatelessWidget {
  const CreateCNRCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CNRCCreateCubit>(
          create: (context) => CNRCCreateCubit()..reset(),
        ),
        BlocProvider<WilayaCubit>(
          create: (context) => WilayaCubit()..load(),
        ),
        BlocProvider<CommuneCubit>(
          create: (context) => CommuneCubit()..load(),
        ),
      ],
      child: const CreateCNRCPageContent(),
    );
  }
}

class CreateCNRCPageContent extends StatefulWidget {
  const CreateCNRCPageContent({super.key});

  @override
  State<CreateCNRCPageContent> createState() => _CreateCNRCPageContentState();
}

class _CreateCNRCPageContentState extends State<CreateCNRCPageContent> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> data = {
    'nom': '',
    'prenom': '',
    'wilayaId': '',
    'commune': '',
    'email': '',
    'phone': '',
    'nif': '',
    'nis': '',
    'remarque': '',
  };

  String? selectedWilayaCode;
  List<Commune> filteredCommunes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.createCnrc,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<CNRCCreateCubit, CNRCCreateState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            success: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.i10n.cnrcCreatedSuccessfully),
                  backgroundColor: Colors.green,
                ),
              );
              context.pop();
            },
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
          );
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              constraints: BoxConstraints(
                minWidth: context.width,
                maxWidth: context.width,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: kSpacingX3),
                    // Nom (Required)
                    Text(
                      '${context.i10n.lastName} *',
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.lastNamePlaceholder,
                      data: data,
                      mapKey: 'nom',
                      onChanged: (value) {
                        setState(() {
                          data['nom'] = value;
                        });
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.i10n.lastNameRequired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Prenom (Optional)
                    Text(
                      context.i10n.firstName,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.firstNamePlaceholder,
                      data: data,
                      mapKey: 'prenom',
                      onChanged: (value) {
                        setState(() {
                          data['prenom'] = value;
                        });
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Wilaya (Optional)
                    Text(
                      context.i10n.region,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    BlocBuilder<WilayaCubit, List<Wilaya>>(
                      builder: (context, wilayaState) {
                        return CustomDropDownInput(
                          data: data,
                          mapKey: 'wilayaId',
                          onChanged: (value) {
                            setState(() {
                              selectedWilayaCode = value;
                              data['wilayaId'] = value;
                              data['commune'] =
                                  ''; // Reset commune when wilaya changes

                              // Filter communes by selected wilaya
                              final allCommunes =
                                  context.read<CommuneCubit>().state;
                              filteredCommunes = allCommunes
                                  .where((commune) => commune.wlyCode == value)
                                  .toList();
                            });
                          },
                          items: [
                            CustomDropDownItem(
                              label: context.i10n.regionPlaceholder,
                              value: '',
                            ),
                            ...wilayaState.map(
                              (e) => CustomDropDownItem(
                                label: e.name,
                                value: e.code.toString(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Commune (Optional)
                    Text(
                      context.i10n.commune,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    BlocBuilder<CommuneCubit, List<Commune>>(
                      builder: (context, communeState) {
                        final communes = selectedWilayaCode != null &&
                                selectedWilayaCode!.isNotEmpty
                            ? filteredCommunes
                            : [];

                        return CustomDropDownInput(
                          data: data,
                          mapKey: 'commune',
                          items: [
                            CustomDropDownItem(
                              label: context.i10n.communePlaceholder,
                              value: '',
                            ),
                            ...communes.map(
                              (e) => CustomDropDownItem(
                                label: e.name,
                                value: e.code.toString(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Email (Optional)
                    Text(
                      context.i10n.email,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.emailPlaceholder,
                      data: data,
                      mapKey: 'email',
                      onChanged: (value) {
                        setState(() {
                          data['email'] = value;
                        });
                        return null;
                      },
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            !value.isEmail) {
                          return context.i10n.emailInvalid;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Phone (Optional)
                    Text(
                      context.i10n.phone,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.phonePlaceholder,
                      data: data,
                      mapKey: 'phone',
                      onChanged: (value) {
                        setState(() {
                          data['phone'] = value;
                        });
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // NIF (Optional)
                    Text(
                      context.i10n.nif,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.nifPlaceholder,
                      data: data,
                      mapKey: 'nif',
                      onChanged: (value) {
                        setState(() {
                          data['nif'] = value;
                        });
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // NIS (Optional)
                    Text(
                      context.i10n.nis,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.nisPlaceholder,
                      data: data,
                      mapKey: 'nis',
                      onChanged: (value) {
                        setState(() {
                          data['nis'] = value;
                        });
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),

                    // Remarque (Optional)
                    Text(
                      context.i10n.note,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.notePlaceholder,
                      data: data,
                      mapKey: 'remarque',
                      minLines: 4,
                      maxLines: 4,
                      onChanged: (value) {
                        setState(() {
                          data['remarque'] = value;
                        });
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX6),

                    // Submit button
                    BlocBuilder<CNRCCreateCubit, CNRCCreateState>(
                      builder: (context, state) {
                        if (state.maybeWhen(
                          orElse: () => false,
                          loading: () => true,
                        )) {
                          return const Loader();
                        }
                        return CustomButton(
                          text: context.i10n.create,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await context
                                  .read<CNRCCreateCubit>()
                                  .create(data);
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX6),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
