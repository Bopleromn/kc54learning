import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kc54learning/Registration/bloc/registration_event.dart';
import 'package:kc54learning/Registration/bloc/registration_state.dart';

import '../../Models/current_user_class.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState>{
  RegistrationBloc() : super(RegistrationInitial()){
    on<Register>((event, emit) async{
      emit(RegistrationLoading());

      final regex = RegExp(r"(^[\w]+@[A-Za-z]{2,10}.[A-Za-z]{2,7}$)");
      if(regex.hasMatch(CurrentUser.userModel.email!) &&
        CurrentUser.userModel.name!.length > 3 && CurrentUser.userModel.age.toString().length > 0 &&
        CurrentUser.userModel.password!.length > 5){

        bool success = await CurrentUser.userModel.checkMail();

        if(success){
          emit(RegistrationSuccess());
        }
        else{
          emit(RegistrationFailure());
        }
      }
      else{
        emit(RegistrationIncorrectFields());
      }
    });
  }
}