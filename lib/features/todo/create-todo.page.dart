import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../shared/services/helpers/notification.helper.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import 'cubit/todo_cubit.dart';

class CreateTaskPage extends StatefulWidget {
  final Todo? todo;
  const CreateTaskPage({super.key, this.todo});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> task = {
    'title': '',
    'notes': '',
  };
  bool isAllDay = false;
  DateTime selectedDate = DateTime.now();
  Color? selectedColor;
  List<Color> colors = [
    kCeruleanBlue.shade300,
    kHighland.shade300,
    kCardinal.shade300,
    kCodGray.shade300,
    kBrightSun.shade300,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      task['title'] = widget.todo!.subject;
      task['notes'] = widget.todo!.notes;
      selectedDate = widget.todo!.startTime;
      selectedColor = widget.todo!.color;
      isAllDay = widget.todo!.isAllDay;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 1),
      lastDate: DateTime(2101),
    );
    // Pick time and put it into picked
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          selectedDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.i10n.todoCreateNewTask),
      ),
      body: Container(
        constraints: BoxConstraints(
          minHeight: context.height - context.appBarSize - context.paddingBottom,
          maxHeight: context.height - context.appBarSize - context.paddingBottom,
          minWidth: context.width,
          maxWidth: context.width,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        initialValue: task['title'],
                        style: context.textTheme.displayMedium,
                        cursorColor: kPrimaryColor,
                        maxLines: 2,
                        onSaved: (String? value) {
                          task['title'] = value;
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
                              horizontal: kPaddingLg3,
                              vertical: kPaddingSm1,
                            )),
                      ),
                      const Divider(),
                      TextFormField(
                        initialValue: task['notes'],
                        style: context.textTheme.bodyLarge,
                        cursorColor: kPrimaryColor,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onSaved: (String? value) {
                          task['notes'] = value;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return context.i10n.todoDetailsError;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: context.i10n.todoDetailsPlaceholder,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: context.textTheme.bodyLarge,
                          prefixIcon: const Icon(Icons.notes_rounded),
                          prefixIconColor: kBgGrayVisibility6,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: kPaddingLg3,
                            vertical: kPaddingSm1,
                          ),
                        ),
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text('Toute la journée'),
                        value: isAllDay,
                        onChanged: (bool value) {
                          setState(() {
                            isAllDay = value;
                          });
                        },
                      ),
                      InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: kPaddingMd2,
                          ),
                          width: context.width,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  selectedDate.EEEdMMMMyyyy,
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                SizedBox(width: kSpacingX12),
                                Text(
                                  selectedDate.HHMM(),
                                  style: context.textTheme.bodyLarge!.copyWith(
                                    color: kPrimaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(height: kSpacingX5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kPaddingMd2,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: kSpacingX6,
                              height: kSpacingX6,
                              decoration: BoxDecoration(
                                color: colors[0],
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: kSpacingX3),
                            Text(
                              context.i10n.color,
                              style: context.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: kSpacingX5),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kPaddingMd1,
                        ),
                        child: Wrap(
                          spacing: kSpacingX3,
                          alignment: WrapAlignment.center,
                          children: List<Widget>.generate(colors.length, (int index) {
                            return Container(
                              width: kSpacingX9,
                              height: kSpacingX9,
                              padding: EdgeInsets.all(kSpacingX1),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedColor == colors[index]
                                      ? kPrimaryColor
                                      : Colors.transparent,
                                  width: selectedColor == colors[index] ? 2 : 0,
                                ),
                              ),
                              child: ChoiceChip(
                                label: const Text(''),
                                selected: selectedColor == colors[index],
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedColor = selected ? colors[index] : null;
                                  });
                                },
                                backgroundColor: colors[index],
                                selectedColor: colors[index],
                                padding: EdgeInsets.all(kSpacingX14),
                                showCheckmark: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(kRadiusRounded),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: kSpacingX5),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kPaddingMd2,
                ),
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      final Todo todo = Todo(
                        id: widget.todo?.id ?? DateTime.now().toString(),
                        startTime: selectedDate,
                        endTime: selectedDate.add(const Duration(hours: 1)),
                        isAllDay: isAllDay,
                        subject: task['title'],
                        notes: task['notes'],
                        color: selectedColor ?? kCeruleanBlue.shade300,
                        type: TodoType.task,
                      );
                      if (widget.todo != null) {
                        context.read<TodoCubit>().update(todo);
                      } else {
                        context.read<TodoCubit>().add(todo);
                      }
                      NotificationService().showScheduledNotification(
                        id: 1,
                        title: task['title'],
                        body: task['notes'],
                        payload: '',
                        scheduledDate: selectedDate.subtract(const Duration(minutes: 5)),
                      );
                      context.pop();
                    }
                  },
                  text: widget.todo == null ? context.i10n.add : context.i10n.update,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
