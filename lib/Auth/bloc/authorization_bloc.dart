import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Models/current_user_class.dart';

import 'authorization_event.dart';
import 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState>{
  AuthorizationBloc() : super(AuthorizationInitial()){
    on<AuthorizationLoad>((event, emit) async{
      emit(AuthorizationLoading());
      bool success = await CurrentUser.userModel.authorization();

      if(success){
        emit(AuthorizationSuccess());
      }
      else{
        emit(AuthorizationFailure());
      }
    });
  }
}