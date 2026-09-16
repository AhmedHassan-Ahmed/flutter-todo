abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailedState extends AuthState {
  final String message;

  AuthFailedState({required this.message});
}
