import 'dart:typed_data';

import 'package:crm/core/core.dart';
import 'package:crm/features/hiring/bloc/hire-creation/hire_creation_cubit.dart';
import 'package:crm/shared/services/helpers/location.helper.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/file/file_cubit.dart';
import '../../shared/widgets/inputs/dropdown.input.dart';
import '../tour-plan/bloc/wilaya_cubit.dart';
import '../tour-plan/models/wilaya/wilaya.dart';

class CreateHirePage extends StatelessWidget {
  final Map<String, dynamic>? initialData;

  const CreateHirePage({super.key, this.initialData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HireCreationCubit>(
      create: (context) => HireCreationCubit()..reset(),
      child: CreateHirePageContent(
        initialData: initialData,
      ),
    );
  }
}

class CreateHirePageContent extends StatefulWidget {
  final Map<String, dynamic>? initialData;

  const CreateHirePageContent({super.key, this.initialData});

  @override
  State<CreateHirePageContent> createState() => _CreateHirePageContentState();
}

class _CreateHirePageContentState extends State<CreateHirePageContent> {
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
          context.i10n.homeHireNewClient,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<HireCreationCubit, HireCreationState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              loaded: (hire) {
                final files = context.read<FileCubit>().state.maybeWhen(
                      loaded: (files) => files,
                      orElse: () {
                        return <String, FileModel>{};
                      },
                    );
                // Loop on the files and add them and remove them
                files.forEach((key, value) {
                  context.read<HireCreationCubit>().file(hire.id, value);
                  context.read<FileCubit>().removeFile(key);
                });
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
                      mapKey: 'telephone',
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
                    SizedBox(height: kSpacingX7),
                    // Dotted border using Container for upload files
                    InkWell(
                      onTap: () {
                        final cubit = BlocProvider.of<FileLoadingCubit>(context);
                        cubit.startLoading();
                        select(context, 'file-${DateTime.now().millisecondsSinceEpoch}');
                      },
                      child: Container(
                        padding: EdgeInsets.all(kPaddingMd1),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(kSpacingX4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.upload_file,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: kSpacingX1),
                            Text(
                              context.i10n.uploadFile,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: kSpacingX3),
                    BlocBuilder<FileCubit, FileState>(
                      builder: (context, state) {
                        final files = state.maybeWhen(
                          loaded: (files) => files,
                          orElse: () {
                            return <String, FileModel>{};
                          },
                        );

                        if (files.isEmpty) {
                          return const SizedBox.shrink();
                        }

                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(kSpacingX4),
                          ),
                          child: Column(
                            children: files.entries
                                .map(
                                  (e) => ListTile(
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.upload_file,
                                          color: kPrimaryColor,
                                        ),
                                        SizedBox(width: kSpacingX1),
                                        Expanded(
                                          child: Text(
                                            e.value.fileName,
                                            softWrap: true,
                                            maxLines: 2,
                                            style: context.textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.delete_rounded,
                                        color: kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        context.read<FileCubit>().removeFile(e.key);
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: kSpacingX10),
                    BlocBuilder<HireCreationCubit, HireCreationState>(
                      builder: (context, state) {
                        if (state.maybeWhen(orElse: () => false, loading: () => true)) {
                          return const Loader();
                        }
                        return CustomButton(
                          text: context.i10n.hire,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              final position = await LocationHelper.getCurrentPosition();
                              if (position != null) {
                                data['latitude'] = position.latitude;
                                data['longitude'] = position.longitude;
                              }

                              await context.read<HireCreationCubit>().create(data);
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

  Future<void> select(BuildContext context, String fileKey) async {
    final cubit = BlocProvider.of<FileLoadingCubit>(context);
    cubit.startLoading();

    final FilePickerResult? file = await FilePicker.platform.pickFiles(
      type: FileType.any,
      onFileLoading: (status) {
        cubit.updateProgress(status.index);
      },
    );

    cubit.stopLoading();
    if (file != null && file.files.isNotEmpty) {
      final bytes = file.files.first.bytes;
      final name = file.files.first.name;
      context.read<FileCubit>().addFile(
            fileKey,
            name,
            bytes ?? Uint8List(0),
            url: file.files.first.path ?? "",
          );
    }
  }
}
