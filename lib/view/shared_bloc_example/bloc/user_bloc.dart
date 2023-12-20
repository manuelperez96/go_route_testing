import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(0)) {
    on<IncrementState>((event, emit) {
      emit(UserState(state.value + 1));
    });
  }

  @override
  Future<void> close() {
    print('hola');
    return super.close();
  }
}
