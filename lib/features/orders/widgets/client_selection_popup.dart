import 'package:crm/core/core.dart';
import 'package:crm/models/person/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../tour-plan/bloc/clients/clients_cubit.dart';

class ClientSelectionPopup extends StatefulWidget {
  const ClientSelectionPopup({super.key});

  @override
  State<ClientSelectionPopup> createState() => _ClientSelectionPopupState();
}

class _ClientSelectionPopupState extends State<ClientSelectionPopup> {
  Person? _selectedClient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: kPaddingMd2, vertical: 24.h),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.i10n.selectClient,
                  style: context.textTheme.displayMedium,
                ),
                SizedBox(height: kSpacingX3),
              ],
            ),
          ),
          BlocBuilder<ClientsCubit, ClientsState>(
            builder: (context, clientState) {
              return clientState.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (all, filtered) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final client = filtered[index];
                        return ListTile(
                          title: Text(client.fullName),
                          subtitle: Text(client.address ?? context.i10n.noAddress),
                          leading: CircleAvatar(
                            child: Text(client.fullName.characters.first),
                          ),
                          trailing: _selectedClient == client ? const Icon(Icons.check) : null,
                          onTap: () {
                            setState(() {
                              _selectedClient = client;
                            });
                          },
                        );
                      },
                    ),
                  );
                },
                error: (message) => Center(child: Text(message)),
                initial: () => const Center(child: Text('No clients')),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kSpacingX2, vertical: 16.h),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedClient);
              },
              child: Text("Select"),
            ),
          ),
        ],
      ),
    );
  }
}
