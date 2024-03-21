import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/search/search_cubit.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;

  const SearchTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    Debouncer debouncer = Debouncer(milliseconds: 500);
    return BlocBuilder<SearchCubit, String>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state,
          autocorrect: false,
          onChanged: (value) {
            debouncer.run(() {
              context.read<SearchCubit>().search(value);
            });
          },
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
