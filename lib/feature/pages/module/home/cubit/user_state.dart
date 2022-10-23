part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final String name;

  const UserState({required this.name});

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  const UserInitial({required String name}) : super(name: name);
}

class UserLoading extends UserState {
  const UserLoading({required String name}) : super(name: name);
}

class UserLoaded extends UserState {
  const UserLoaded({required String name}) : super(name: name);
}

class UserNotFound extends UserState {
  const UserNotFound({required String name}) : super(name: name);
}
