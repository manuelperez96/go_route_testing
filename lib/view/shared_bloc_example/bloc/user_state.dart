part of 'user_bloc.dart';

@immutable
class UserState extends Equatable {
  final int value;

  const UserState(this.value);

  @override
  List<Object?> get props => [value];
}
