import 'package:crm/core/core.dart';
import 'package:crm/shared/widgets/buttons/button.widget.dart';
import 'package:crm/shared/widgets/inputs/custom.text.form.field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/widgets/loading/loader.widget.dart';
import 'blocs/create_visit/create_event_visit_cubit.dart';
import 'models/event/event.dart';

class AddVisitToEventPage extends StatelessWidget {
  final Event event;

  const AddVisitToEventPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateEventVisitCubit(),
      child: AddVisitToEventPageContent(event: event),
    );
  }
}

class AddVisitToEventPageContent extends StatefulWidget {
  final Event event;

  const AddVisitToEventPageContent({super.key, required this.event});

  @override
  State<AddVisitToEventPageContent> createState() => _AddVisitToEventPageContentState();
}

class _AddVisitToEventPageContentState extends State<AddVisitToEventPageContent> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _remarqueController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.addVisitToEvent,
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: BlocListener<CreateEventVisitCubit, CreateEventVisitState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: (eventVisit) {
              context.successSnackBar(context.i10n.visitAddedSuccessfully);
              context.pop();
              context.pop();
            },
            failure: (message) {
              context.errorSnackBar(message);
            },
          );
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
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.lastName,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      controller: _nomController,
                      hintText: context.i10n.lastNamePlaceholder,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.i10n.lastNameRequired;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.firstName,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      controller: _prenomController,
                      hintText: context.i10n.firstNamePlaceholder,
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
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.phone,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      controller: _telephoneController,
                      hintText: context.i10n.phonePlaceholder,
                    ),
                    SizedBox(height: kSpacingX3),
                    Text(
                      context.i10n.email,
                      style: context.textTheme.bodyMedium,
                    ),
                    SizedBox(height: kSpacingX1),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: context.i10n.emailPlaceholder,
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
                      controller: _remarqueController,
                      hintText: context.i10n.notePlaceholder,
                      minLines: 4,
                      maxLines: 4,
                    ),
                    SizedBox(height: kSpacingX7),
                    BlocBuilder<CreateEventVisitCubit, CreateEventVisitState>(
                      builder: (context, state) {
                        if (state.maybeWhen(orElse: () => false, loading: () => true)) {
                          return const Loader();
                        }
                        return CustomButton(
                          text: context.i10n.addVisit,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final data = {
                                'evenementId': widget.event.id,
                                'date': DateTime.now().toIso8601String(),
                                'nom': _nomController.text,
                                'prenom': _prenomController.text,
                                'address': _addressController.text,
                                'telephone': _telephoneController.text,
                                'email': _emailController.text,
                                'remarque': _remarqueController.text,
                              };

                              context.read<CreateEventVisitCubit>().createEventVisit(data: data);
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
