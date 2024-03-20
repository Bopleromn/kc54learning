import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_accepted_event.dart';
part 'auth_accepted_state.dart';

class AuthAcceptedBloc extends Bloc<AuthAcceptedEvent, AuthAcceptedState> {
  AuthAcceptedBloc() : super(AuthAcceptedInitial()) {
    on<AuthAcceptedEvent>((AuthAcceptedEvent, AuthAcceptedState) async{
      emit(AuthAcceptedLoading());
      await Future.delayed(Duration(seconds: 4));
      emit(AuthAcceptedLoaded());
    });
  }
}
