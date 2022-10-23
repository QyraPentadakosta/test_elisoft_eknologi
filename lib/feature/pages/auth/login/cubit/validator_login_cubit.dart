import 'package:bloc/bloc.dart';

class ValidatorLoginCubit extends Cubit<bool> {
  ValidatorLoginCubit() : super(false);

  void validator({required String username, required String password}) {
    if (username.isNotEmpty && password.isNotEmpty) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
