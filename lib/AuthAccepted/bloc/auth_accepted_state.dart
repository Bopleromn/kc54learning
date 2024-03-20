part of 'auth_accepted_bloc.dart';

sealed class AuthAcceptedState extends Equatable {
  const AuthAcceptedState();
  
  @override
  List<Object> get props => [];
}

final class AuthAcceptedInitial extends AuthAcceptedState {

}
class AuthAcceptedLoading extends AuthAcceptedState{

}
class AuthAcceptedLoaded extends AuthAcceptedState{
  
}
