import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../logic/localizations/localizations_bloc.dart';
import '../../../logic/search/search_cubit.dart';
import '../../../logic/time.range/time_range_cubit.dart';
import 'menu.bottom.app.bar.widget.dart';

class CustomAppBars {
  static AppBar CustomMenuAppBar(
      {required BuildContext context,
      required String title,
      bool time = true}) {
    bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return AppBar(
        elevation: 0,
        centerTitle: true,
        leading: canPop
            ? IconButton(
                onPressed: () {
                  context.read<SearchCubit>().setSearchQuery("");
                  context.read<TimeRangeCubit>().reset(context);
                  context.pop();
                },
                icon: BlocBuilder<LocalizationsBloc, LocalizationsState>(
                  builder: (context, state) {
                    return Icon(
                      state.locale.languageCode != 'ar'
                          ? Icons.chevron_left_rounded
                          : Icons.chevron_right_rounded,
                      color: kBgGrayVisibility6,
                    );
                  },
                ),
              )
            : null,
        title: Text(
          title.translate(context),
          style: context.textTheme.headlineMedium,
        ),
        bottom: CustomMenuBottomAppBar(
          time: time,
        ));
  }
}
