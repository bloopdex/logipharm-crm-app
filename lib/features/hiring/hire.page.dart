import 'package:crm/core/core.dart';
import 'package:crm/features/hiring/hire-details.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/search/search_cubit.dart';
import '../../logic/time.range/time_range_cubit.dart';
import '../../shared/widgets/buttons/button.widget.dart';
import '../../shared/widgets/container/profile-container.widget.dart';
import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/daterange.picker.input.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';
import '../../shared/widgets/loading/loader.widget.dart';
import 'bloc/hires/hire_bloc.dart';
import 'create-hire.page.dart';

class HirePage extends StatelessWidget {
  const HirePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HireBloc>(
      create: (context) => HireBloc()..add(const HireEvent.started()),
      child: const HirePageContent(),
    );
  }
}

class HirePageContent extends StatefulWidget {
  const HirePageContent({super.key});

  @override
  State<HirePageContent> createState() => _HirePageContentState();
}

class _HirePageContentState extends State<HirePageContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.i10n.hirement,
          style: context.textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_rounded,
              size: kSpacingX7,
              color: kPrimaryColor,
            ),
            onPressed: () {
              context.push(const CreateHirePage());
            },
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SearchCubit, String>(
            listener: (context, state) {
              context.read<HireBloc>().add(
                    HireEvent.search(
                      query: state,
                      start: context.read<TimeRangeCubit>().state.validatedStartDate,
                      end: context.read<TimeRangeCubit>().state.validatedEndDate,
                    ),
                  );
            },
          ),
          BlocListener<TimeRangeCubit, TimeRangeState>(
            listener: (context, state) {
              context.read<HireBloc>().add(
                    HireEvent.search(
                      query: context.read<SearchCubit>().state,
                      start: state.validatedStartDate,
                      end: state.validatedEndDate,
                    ),
                  );
            },
          ),
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2),
            constraints: BoxConstraints(
              minHeight: context.height - context.appBarSize - context.paddingBottom,
              maxHeight: context.height - context.appBarSize - context.paddingBottom,
              minWidth: context.width,
              maxWidth: context.width,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                        hintText: context.i10n.tourSearchPerWilaya,
                      ),
                    ),
                    SizedBox(width: kSpacingX2),
                    const CustomDateRangePicker()
                  ],
                ),
                SizedBox(height: kSpacingX2),
                Expanded(
                  child: BlocBuilder<HireBloc, HireState>(
                    builder: (context, state) {
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<HireBloc>().add(const HireEvent.started());
                        },
                        child: state.maybeWhen(
                          orElse: () => const SizedBox.shrink(),
                          loading: () => const Center(
                            child: Loader(),
                          ),
                          loaded: (hires, hasReachedMax, currentPage) {
                            if (hires.isEmpty) {
                              return Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SVG(
                                    'empty-states/info.svg',
                                    height: 175.h,
                                  ),
                                  SizedBox(height: kSpacingX3),
                                  Text(
                                    context.i10n.noHirement,
                                    style: context.textTheme.headlineMedium,
                                  ),
                                  SizedBox(height: kSpacingX2),
                                  Text(
                                    context.i10n.youDontHaveAnyHirement,
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  SizedBox(height: kSpacingX3),
                                  CustomButton(
                                    text: context.i10n.createNewHirement,
                                    backgroundColor: kBgButtonSecondary,
                                    textColor: kText1,
                                    onPressed: () {
                                      context.push(const CreateHirePage());
                                    },
                                  ),
                                ],
                              ));
                            }
                            return ListView.builder(
                              controller: _scrollController,
                              itemCount: hires.length,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final hire = hires[index];
                                return ListTile(
                                  onTap: () {
                                    context.push(HireDetails(hire: hire));
                                  },
                                  leading: ProfileCard(
                                    text: '${hire.lastName} ${hire.firstName}',
                                  ),
                                  title: Text('${hire.lastName} ${hire.firstName}',
                                      style: context.textTheme.bodyLarge),
                                  subtitle: Text(hire.remark ?? context.i10n.noNote,
                                      style: context.textTheme.bodyMedium),
                                  trailing: HireStatusCard(status: hire.statusFlag),
                                );
                              },
                            );
                          },
                          failure: (message) => Center(
                            child: Text(message),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loadMore() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<HireBloc>().add(HireEvent.load(
            query: context.read<SearchCubit>().state,
            start: context.read<TimeRangeCubit>().state.validatedStartDate,
            end: context.read<TimeRangeCubit>().state.validatedEndDate,
          ));
    }
  }
}

class HireStatusCard extends StatelessWidget {
  final int status;

  const HireStatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text = '';
    switch (status) {
      case 0:
        text = context.i10n.pending;
        break;
      case 1:
        text = context.i10n.active;
        break;
      case 2:
        text = context.i10n.refused;
        break;
      default:
        text = context.i10n.pending;
    }

    Color backgroundColor = kCeruleanBlue.shade100;
    Color color = kCeruleanBlue.shade500;
    switch (status) {
      case 1:
        backgroundColor = kHighland.shade100;
        color = kHighland.shade500;
        break;
      case 2:
        backgroundColor = kCardinal.shade100;
        color = kCardinal.shade500;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kPaddingSm3,
        vertical: kPaddingSm3,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kSpacingX3),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: kSpacingX4,
            height: kSpacingX4,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: color),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: kSpacingX2),
          Text(
            text,
            style: context.textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
