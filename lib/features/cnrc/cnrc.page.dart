import 'package:crm/core/core.dart';
import 'package:crm/features/cnrc/cubit/commercial_register_cubit.dart';
import 'package:crm/features/cnrc/update-cnrc.page.dart';
import 'package:crm/features/hiring/create-hire.page.dart';
import 'package:crm/logic/search/search_cubit.dart';
import 'package:crm/shared/widgets/container/profile-container.widget.dart';
import 'package:crm/shared/widgets/loading/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/widgets/image/svg.dart';
import '../../shared/widgets/inputs/search.text.field.widget.dart';

class CommercialRegisterPage extends StatelessWidget {
  const CommercialRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CommercialRegisterCubit()..started(),
      child: const CommercialRegisterContent(),
    );
  }
}

class CommercialRegisterContent extends StatefulWidget {
  const CommercialRegisterContent({super.key});

  @override
  State<CommercialRegisterContent> createState() => _CommercialRegisterContentState();
}

class _CommercialRegisterContentState extends State<CommercialRegisterContent> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_loadMore);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.i10n.cnrc,
            style: context.textTheme.headlineMedium,
          ),
        ),
        body: BlocListener<SearchCubit, String>(
          listener: (BuildContext context, String state) {
            context.read<CommercialRegisterCubit>().search(query: state);
          },
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
                SearchTextField(
                  hintText: context.i10n.searchClient,
                ),
                Expanded(
                  child: BlocBuilder<CommercialRegisterCubit, CommercialRegisterState>(
                    builder: (BuildContext context, CommercialRegisterState state) {
                      return state.maybeWhen(orElse: () {
                        return const Center(
                          child: Loader(),
                        );
                      }, loaded: (cnrc, _, __) {
                        if (cnrc.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SVG(
                                  'empty-states/info.svg',
                                  height: 175.sp,
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
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onLongPress: () {
                                context.push(UpdateCNRCPage(
                                  initialData: {
                                    'id': '${cnrc[index].id}',
                                    'nom': '${cnrc[index].lastName}',
                                    'prenom': '${cnrc[index].firstName}',
                                    'address': cnrc[index].address ?? '',
                                    'regionId': cnrc[index].stateWilaya ?? '',
                                  },
                                ));
                              },
                              child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(vertical: kPaddingSm1),
                                  leading: ProfileCard(
                                    text: '${cnrc[index].firstName} ${cnrc[index].lastName}',
                                  ),
                                  title: Text('${cnrc[index].firstName} ${cnrc[index].lastName}',
                                      maxLines: 2,
                                      softWrap: true,
                                      style: context.textTheme.headlineMedium!.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor,
                                      )),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cnrc[index].stateWilaya ?? context.i10n.noRegion,
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        cnrc[index].address ?? context.i10n.noAddress,
                                        style: context.textTheme.bodyMedium!.copyWith(
                                          fontSize: 12.sp,
                                        ),
                                        maxLines: 2,
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                  trailing: TextButton(
                                    onPressed: () {
                                      context.pushReplacement(
                                        CreateHirePage(
                                          initialData: {
                                            'id': '${cnrc[index].id}',
                                            'nom': '${cnrc[index].lastName}',
                                            'prenom': '${cnrc[index].firstName}',
                                            'address': cnrc[index].address ?? '',
                                            'regionId': cnrc[index].stateWilaya ?? '',
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      context.i10n.hire,
                                      style: context.textTheme.bodyMedium!.copyWith(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )),
                            );
                          },
                          itemCount: cnrc.length,
                        );
                      });
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
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<CommercialRegisterCubit>().loadMore(
            query: context.read<SearchCubit>().state,
          );
    }
  }
}
