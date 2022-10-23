import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_elisoft_eknologi/core/constants/i_constants.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitial(name: 'User'));

  Future getUser() async {
    emit(const UserLoading(name: 'User'));
    String? userName = await IConstants().getString(IConstants.name);
    emit(UserLoaded(name: userName ?? ""));
  }
}
