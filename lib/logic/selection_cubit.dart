import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(const SelectionState([]));

  void select(String value) {
    List<String> selected = state.selected.toList();

    if (state.selected.contains(value)) {
      selected.remove(value);
      emit(SelectionState(selected));
    } else {
      selected.add(value);
      emit(SelectionState(selected));
    }
  }

  void unselect(String value) {
    List<String> selected = state.selected.toList();

    if (state.selected.contains(value)) {
      selected.remove(value);
      emit(SelectionState(selected));
    }
  }

  bool isSelected(String value) => state.selected.contains(value);

  void clear() => emit(const SelectionState([]));

  static SelectionCubit get(context) => BlocProvider.of<SelectionCubit>(context);
}

class SelectionState extends Equatable {
  final List<String> selected;

  const SelectionState(this.selected);

  @override
  List<Object?> get props => [selected];
}
