import 'package:crm/features/hiring/create-hire.page.dart';
import 'package:crm/features/hiring/hire.page.dart';
import 'package:crm/features/todo/create-event.page.dart';
import 'package:crm/features/tour-plan/create-plan.page.dart';
import 'package:crm/logic/auth/auth_bloc.dart';
import 'package:crm/shared/widgets/container/divider.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../shared/widgets/buttons/circlebutton.text.widget.dart';
import '../clients/clients.page.dart';
import '../tour-plan/bloc/tour-plan/tour_plan_bloc.dart';
import '../tour-plan/core/enums.dart';
import '../visits/create-visit.page.dart';
import 'sections/profile.section.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxWidth: context.width,
          minWidth: context.width,
          maxHeight: context.height -
              context.appBarSize -
              context.bottomNavigationBarSize,
          minHeight: context.height -
              context.appBarSize -
              context.bottomNavigationBarSize,
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: const ProfileSection(),
            ),
            SizedBox(height: kSpacingX5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CircleButtonText(
                      icon: Icons.offline_bolt_rounded,
                      text: context.i10n.homeCreateNewPlan,
                      onPressed: () {
                        context.push(const CreatePlanPage());
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleButtonText(
                      icon: Icons.fact_check_rounded,
                      text: context.i10n.homeCreateNewVisit,
                      onPressed: () {
                        final current =
                            context.read<TourPlanBloc>().state.maybeWhen(
                                  loaded: (tours, hasReachedMax, currentPage) {
                                    return tours
                                        .where((element) =>
                                            element.statusFlag ==
                                            StatuFlags.opened.value)
                                        .firstOrNull;
                                  },
                                  orElse: () => null,
                                );
                        if (current != null &&
                            current.pharmacies != null &&
                            current.pharmacies!.isNotEmpty) {
                          context.push(
                            CreateVisitPage(
                              tour: current,
                              pharmacieId: current
                                  .pharmacies!.first.pharmacy!.id
                                  .toString(),
                            ),
                          );
                        }
                      },
                      color: context.watch<TourPlanBloc>().state.maybeWhen(
                                    loaded:
                                        (tours, hasReachedMax, currentPage) {
                                      return tours
                                          .where((element) =>
                                              element.statusFlag ==
                                              StatuFlags.opened.value)
                                          .firstOrNull;
                                    },
                                    orElse: () => null,
                                  ) ==
                              null
                          ? kBgGrayVisibility4
                          : kPrimaryColor,
                    ),
                  ),
                  Expanded(
                    child: CircleButtonText(
                      icon: Icons.event_rounded,
                      text: context.i10n.homeCreateNewEvent,
                      onPressed: () {
                        context.push(const CreateEventPage());
                      },
                    ),
                  ),
                  Expanded(
                    child: CircleButtonText(
                      icon: Icons.person_add_rounded,
                      text: context.i10n.homeHireNewClient,
                      onPressed: () {
                        context.push(const CreateHirePage());
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: kSpacingX5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: Text(context.i10n.consultation,
                  style: context.textTheme.bodyLarge),
            ),
            SizedBox(height: kSpacingX3),
            DividerContainer(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: Row(
                children: [
                  Container(
                    width: kSpacingX9,
                    height: kSpacingX9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kCeruleanBlue.shade100,
                    ),
                    padding: EdgeInsets.all(kPaddingSm3),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.analytics_rounded,
                      color: kCeruleanBlue,
                    ),
                  ),
                  SizedBox(width: kSpacingX3),
                  Expanded(
                    child: Text(
                      context.i10n.dashboard,
                      style: context.textTheme.bodyLarge,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: kSpacingX5,
                  ),
                ],
              ),
            )),
            DividerContainer(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: InkWell(
                onTap: () {
                  context.push(const ClientsPage());
                },
                child: Row(
                  children: [
                    Container(
                      width: kSpacingX9,
                      height: kSpacingX9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCeruleanBlue.shade100,
                      ),
                      padding: EdgeInsets.all(kPaddingSm3),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.group_rounded,
                        color: kCeruleanBlue,
                      ),
                    ),
                    SizedBox(width: kSpacingX3),
                    Expanded(
                      child: Text(
                        context.i10n.clientList,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: kSpacingX5,
                    ),
                  ],
                ),
              ),
            )),
            DividerContainer(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: InkWell(
                onTap: () {
                  context.push(const HirePage());
                },
                child: Row(
                  children: [
                    Container(
                      width: kSpacingX9,
                      height: kSpacingX9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCeruleanBlue.shade100,
                      ),
                      padding: EdgeInsets.all(kPaddingSm3),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.assignment_ind_rounded,
                        color: kCeruleanBlue,
                      ),
                    ),
                    SizedBox(width: kSpacingX3),
                    Expanded(
                      child: Text(
                        context.i10n.hiring,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: kSpacingX5,
                    ),
                  ],
                ),
              ),
            )),
            DividerContainer(
              isBottom: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                child: Row(
                  children: [
                    Container(
                      width: kSpacingX9,
                      height: kSpacingX9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCeruleanBlue.shade100,
                      ),
                      padding: EdgeInsets.all(kPaddingSm3),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.insert_drive_file_rounded,
                        color: kCeruleanBlue,
                      ),
                    ),
                    SizedBox(width: kSpacingX3),
                    Expanded(
                      child: Text(
                        context.i10n.fileCNRC,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: kSpacingX5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: kSpacingX5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
              child: Text(
                context.i10n.system,
                style: context.textTheme.bodyLarge,
              ),
            ),
            SizedBox(height: kSpacingX3),
            DividerContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                child: Row(
                  children: [
                    Container(
                      width: kSpacingX9,
                      height: kSpacingX9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCeruleanBlue.shade100,
                      ),
                      padding: EdgeInsets.all(kPaddingSm3),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.notifications_rounded,
                        color: kCeruleanBlue,
                      ),
                    ),
                    SizedBox(width: kSpacingX3),
                    Expanded(
                      child: Text(
                        context.i10n.notifications,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: kWhite,
                    ),
                  ],
                ),
              ),
            ),
            DividerContainer(
              isBottom: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
                child: Row(
                  children: [
                    Container(
                      width: kSpacingX9,
                      height: kSpacingX9,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kCardinal.shade100,
                      ),
                      padding: EdgeInsets.all(kPaddingSm3),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.logout_rounded,
                        color: kCardinal,
                      ),
                    ),
                    SizedBox(width: kSpacingX3),
                    Expanded(
                      child: Text(
                        context.i10n.logout,
                        style: context.textTheme.bodyLarge,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(const AuthEvent.loggedOut());
                      },
                      iconSize: kSpacingX5,
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
