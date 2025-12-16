import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/search/search_cubit.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}

class SearchTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  const SearchTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _controller;
  late final Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _debouncer = Debouncer(milliseconds: 500);
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, String>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (_controller.text != state) {
          _controller.value = TextEditingValue(
            text: state,
            selection: TextSelection.collapsed(offset: state.length),
          );
        }
      },
      child: TextFormField(
        controller: _controller,
        autocorrect: false,
        onChanged: (value) {
          _debouncer.run(() {
            context.read<SearchCubit>().search(value);
            widget.onChanged?.call(value);
          });
        },
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
