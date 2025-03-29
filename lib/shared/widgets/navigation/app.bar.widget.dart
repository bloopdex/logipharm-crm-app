import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';
import '../../../logic/localizations/localizations_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    bool canPop = ModalRoute.of(context)?.canPop ?? false;

    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 50.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (canPop)
              IconButton(
                onPressed: () => context.pop(),
                icon: BlocBuilder<LocalizationsBloc, LocalizationsState>(
                  builder: (context, state) {
                    return state.locale.languageCode != 'ar'
                        ? const Icon(Icons.chevron_left_rounded)
                        : const Icon(Icons.chevron_right_rounded);
                  },
                ),
              ),
            Center(
              child: Text(
                title,
                style: context.textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50.h);
}
