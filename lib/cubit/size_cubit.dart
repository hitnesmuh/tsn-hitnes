import 'package:bloc/bloc.dart';

class SizeCubit extends Cubit<List<String>> {
  SizeCubit() : super([]);

  void selesctSize(String id) {
    //print('prev state: $state');
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }

    //print('new state: $state');
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    print('index: $index');
    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }
}
