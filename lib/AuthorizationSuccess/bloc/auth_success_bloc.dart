import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kc54learning/AuthorizationSuccess/AuthorizationSuccess.dart';

part 'auth_success_event.dart';
part 'auth_success_state.dart';

class AuthSuccessBloc extends Bloc<AuthSuccessEvent, AuthSuccessState> {
  AuthSuccessBloc() : super(AuthSuccessInitial()) {
    on<AuthSuccessEvent>((AuthSuccessEvent, AuthSuccessState) async{
      emit(AuthSuccessLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(AuthSuccessLoaded());
    });
  }
}
