import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

enum TodoType { task, event }

class Todo extends Appointment {
  TodoType type = TodoType.task;
  Todo({
    super.startTimeZone,
    super.endTimeZone,
    super.recurrenceRule,
    super.isAllDay = false,
    super.notes,
    super.location,
    super.resourceIds,
    super.recurrenceId,
    super.id,
    required super.startTime,
    required super.endTime,
    super.subject = '',
    super.color = Colors.lightBlue,
    super.recurrenceExceptionDates,
    required this.type,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      subject: json['subject'],
      color: Color(json['color']),
      notes: json['notes'],
      isAllDay: json['isAllDay'] ?? false,
      type: json['type'] == 'task' ? TodoType.task : TodoType.event,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'subject': subject,
      'color': color.value,
      'notes': notes,
      'isAllDay': isAllDay,
      'type': type == TodoType.task ? 'task' : 'event',
    };
  }
}

class TodoDataSource extends CalendarDataSource {
  TodoDataSource(List<Todo> source) {
    appointments = source;
  }
}

class TodoCubit extends HydratedCubit<List<Todo>> {
  TodoCubit() : super([]);

  TodoDataSource get datasource => TodoDataSource(state);

  void add(Todo appointment) {
    state.add(appointment);
    emit(state);
  }

  void remove(Todo appointment) {
    state.remove(appointment);
    emit(state);
  }

  void update(Todo appointment) {
    final index = state.indexWhere((element) => element.id == appointment.id);
    state[index] = appointment;
    emit(state);
  }

  @override
  List<Todo>? fromJson(Map<String, dynamic> json) {
    return (json['appointments'] as List).map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Map<String, dynamic>? toJson(List<Todo> state) {
    return {'appointments': state.map((e) => e.toJson()).toList()};
  }
}
