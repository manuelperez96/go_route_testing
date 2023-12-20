part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class IncrementState extends UserEvent {
  @override
  List<Object?> get props => [];
}
