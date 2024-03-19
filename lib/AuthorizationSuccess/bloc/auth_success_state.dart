part of 'auth_success_bloc.dart';
@immutable
abstract class AuthSuccessState{
  const AuthSuccessState();
  
  @override
  List<Object> get props => [];
}

final class AuthSuccessInitial extends AuthSuccessState {}

class AuthSuccessLoading extends AuthSuccessState{
}
class AuthSuccessLoaded extends AuthSuccessState{
}