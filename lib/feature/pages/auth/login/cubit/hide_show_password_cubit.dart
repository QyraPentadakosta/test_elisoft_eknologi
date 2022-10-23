import 'package:bloc/bloc.dart';

class HideShowPasswordCubit extends Cubit<bool> {
  HideShowPasswordCubit() : super(true);

  void hideShowPassword() {
    if (state) {
      emit(false);
    } else {
      emit(true);
    }
  }
}
