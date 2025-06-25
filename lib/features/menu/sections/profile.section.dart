import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../shared/widgets/container/profile-container.widget.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().user;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: kPaddingMd1,
      ),
      leading: ProfileCard(
        text: user.fullName ?? "no-name",
      ),
      title: Text(user.fullName ?? "no-name", style: context.textTheme.bodyLarge),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingSm3,
              vertical: kPaddingSm1,
            ),
            decoration: BoxDecoration(
              color: kCeruleanBlue.shade100,
              borderRadius: BorderRadius.circular(kPaddingSm3),
            ),
            child: Text(
                user.typeTier != "3" ? context.i10n.supervisorRole : context.i10n.delegateRole,
                style: context.textTheme.bodyLarge),
          ),
          Text(context.i10n.manageProfile,
              maxLines: 2, overflow: TextOverflow.ellipsis, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
