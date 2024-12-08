import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../core/core.dart';
import 'create-todo.page.dart';
import 'cubit/todo_cubit.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: kSpacingX5),
        constraints: BoxConstraints(
          maxWidth: context.width,
          minWidth: context.width,
          maxHeight: context.height - context.appBarSize - context.bottomNavigationBarSize,
          minHeight: context.height - context.appBarSize - context.bottomNavigationBarSize,
        ),
        child: SfCalendar(
          view: CalendarView.schedule,
          backgroundColor: kWhite,
          appointmentBuilder: (context, calendarAppointmentDetails) {
            final Todo appointment = calendarAppointmentDetails.appointments.first as Todo;
            return Container(
              padding: EdgeInsets.all(kSpacingX3),
              decoration: BoxDecoration(
                color: appointment.color,
                borderRadius: BorderRadius.circular(kSpacingX2),
              ),
              child: InkWell(
                onTap: () {
                  context.push(CreateTaskPage(todo: appointment));
                },
                child: Row(
                  children: [
                    appointment.appointmentType == AppointmentType.occurrence
                        ? Icon(Icons.circle, color: kWhite)
                        : const SizedBox.shrink(),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(appointment.subject, style: context.textTheme.bodyMedium),
                          Text(
                            appointment.notes ?? '',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          dataSource: context.watch<TodoCubit>().datasource,
          headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: kWhite,
            textStyle: TextStyle(
              color: kText1,
              fontSize: 20.h,
            ),
          ),
          viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: kWhite,
            dayTextStyle: TextStyle(color: kText4, fontSize: 12),
            dateTextStyle: TextStyle(color: kTextPrimary, fontSize: 14),
          ),
          todayTextStyle: TextStyle(color: kWhite),
          todayHighlightColor: kCeruleanBlue.shade800,
          appointmentTextStyle: context.textTheme.bodyMedium!,
          showDatePickerButton: true,
          scheduleViewSettings: ScheduleViewSettings(
            appointmentItemHeight: 70.h,
            appointmentTextStyle: TextStyle(
              color: kText1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            dayHeaderSettings: DayHeaderSettings(
              dayFormat: 'EEE',
              dayTextStyle: TextStyle(
                color: kText4,
                fontSize: 12,
              ),
            ),
            monthHeaderSettings: MonthHeaderSettings(
              monthFormat: 'MMM yyyy',
              backgroundColor: kWhite,
              monthTextStyle: TextStyle(
                color: kText1,
                fontSize: 20.h,
              ),
            ),
          ),
          scheduleViewMonthHeaderBuilder: (context, details) {
            final String date = details.date.MMMyyyy;
            return Container(
              constraints: BoxConstraints(
                maxWidth: context.width,
                minWidth: context.width,
                maxHeight: 50.h,
                minHeight: 50.h,
              ),
              padding: EdgeInsets.all(kSpacingX5),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(kSpacingX4),
              ),
              child: Text(
                date,
                style: context.textTheme.headlineMedium!.copyWith(
                  color: kWhite,
                ),
              ),
            );
          },
          monthViewSettings: MonthViewSettings(
            dayFormat: 'EEE',
            numberOfWeeksInView: 6,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            showAgenda: true,
            agendaStyle: AgendaStyle(
              appointmentTextStyle: TextStyle(
                color: kText1,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              dayTextStyle: TextStyle(color: kPrimaryColor, fontSize: 13),
              dateTextStyle: TextStyle(color: kText1, fontSize: 25),
            ),
            monthCellStyle: MonthCellStyle(
              textStyle: TextStyle(color: kText4, fontSize: 14),
              trailingDatesTextStyle: TextStyle(color: kText3, fontSize: 12),
              leadingDatesTextStyle: TextStyle(color: kText3, fontSize: 12),
              backgroundColor: kBgGrayVisibility1,
              todayBackgroundColor: kPrimaryColor,
              leadingDatesBackgroundColor: kBgGrayVisibility3,
              trailingDatesBackgroundColor: kBgGrayVisibility3,
            ),
          ),
        ));
  }
}
