import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/inputs/dropdown.input.dart';
import '../tour-plan/bloc/wilaya_cubit.dart';
import '../tour-plan/models/wilaya/wilaya.dart';
import 'cubit/cnrc-update/cnrc_update_cubit.dart';

class UpdateCNRCPage extends StatelessWidget {
  final Map<String, dynamic>? initialData;

  const UpdateCNRCPage({super.key, this.initialData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CNRCUpdateCubit>(
      create: (context) => CNRCUpdateCubit()..reset(),
      child: UpdateCNRCPageContent(
        initialData: initialData,
      ),
    );
  }
}

class UpdateCNRCPageContent extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const UpdateCNRCPageContent({super.key, this.initialData});

  @override
  State<UpdateCNRCPageContent> createState() => _UpdateCNRCPageContentState();
}

class _UpdateCNRCPageContentState extends State<UpdateCNRCPageContent> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _addressController = TextEditingController();

  Map<String, dynamic> data = {};

  @override
  void initState() {
    data = widget.initialData ?? {};
    _addressController.text = data['address'] ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.update,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<CNRCUpdateCubit, CNRCUpdateState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: () {
                context.pop();
              });
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              constraints: BoxConstraints(
                minHeight: context.height - context.appBarSize - context.paddingBottom,
                maxHeight: context.height - context.appBarSize - context.paddingBottom,
                minWidth: context.width,
                maxWidth: context.width,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Center(
                      child: ProfileCard(
                        text: '${data['nom'] ?? ''} ${data['prenom'] ?? ''}',
                        textStyle: context.textTheme.displaySmall,
                        size: 100,
                      ),
                    ),
                    SizedBox(height: kSpacingX3),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.lastName,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              CustomTextFormField(
                                hintText: context.i10n.lastNamePlaceholder,
                                data: data,
                                mapKey: 'nom',
                                readOnly: true,
                                initialValue: data['nom'],
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
                            ],
                          ),
                        ),
                        SizedBox(width: kSpacingX3),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.i10n.firstName,
                                style: context.textTheme.bodyMedium,
                              ),
                              SizedBox(height: kSpacingX1),
                              CustomTextFormField(
                                hintText: context.i10n.firstNamePlaceholder,
                                readOnly: true,
                                data: data,
                                mapKey: 'prenom',
                                initialValue: data['prenom'],
                                onChanged: (value) {
                                  setState(() {
                                    data['prenom'] = value;
                                  });
                                  return null;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context.i10n.firstNameRequired;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.region,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    BlocBuilder<WilayaCubit, List<Wilaya>>(
                      builder: (context, state) {
                        return CustomDropDownInput(
                          data: data,
                          initialValue: data['regionId'],
                          mapKey: 'regionId',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.i10n.regionRequired;
                            }
                            return null;
                          },
                          items: [
                            CustomDropDownItem(
                              label: context.i10n.regionPlaceholder,
                              value: '',
                            ),
                            ...state.map(
                                (e) => CustomDropDownItem(label: e.name, value: e.code.toString())),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.address,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      controller: _addressController,
                      hintText: context.i10n.addressPlaceholder,
                      data: data,
                      mapKey: 'address',
                      onChanged: (value) {
                        setState(() {
                          data['address'] = value;
                        });
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.i10n.addressRequired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.phone,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.phonePlaceholder,
                      data: data,
                      mapKey: 'telMobile',
                      onChanged: (value) {
                        setState(() {
                          data['telephone'] = value;
                        });
                        return null;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.i10n.phoneRequired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.email,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      hintText: context.i10n.emailPlaceholder,
                      data: data,
                      mapKey: 'email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.i10n.emailRequired;
                        }
                        if (!value.isEmail) {
                          return context.i10n.emailInvalid;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),
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
                    ),
                    SizedBox(height: kSpacingX10),
                    BlocBuilder<CNRCUpdateCubit, CNRCUpdateState>(
                      builder: (context, state) {
                        if (state.maybeWhen(orElse: () => false, loading: () => true)) {
                          return const Loader();
                        }
                        return CustomButton(
                          text: context.i10n.update,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              await context.read<CNRCUpdateCubit>().create(data);
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
