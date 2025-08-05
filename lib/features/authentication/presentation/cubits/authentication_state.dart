import 'package:blocsocialapp/features/authentication/domain/entities/app_user.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
    final AppUser user;
    Authenticated(this.user);
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
    final String message;
    AuthenticationError(this.message);
}