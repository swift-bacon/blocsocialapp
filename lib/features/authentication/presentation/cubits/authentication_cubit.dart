import 'package:blocsocialapp/features/authentication/domain/entities/app_user.dart';
import 'package:blocsocialapp/features/authentication/domain/repository/authentication_repository.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {

    final AuthenticationRepository authRepo;
    AppUser? _currentUser;

    AuthenticationCubit({required this.authRepo}) : super(AuthenticationInitial());

    void checkAuth() async {
        final AppUser? user = await authRepo.getCurrentUser();

        if (user != null) {
            _currentUser = user;
            emit(Authenticated(user));
        } else {
            emit(Unauthenticated());
        }
    }

    AppUser? get currentUser => _currentUser;

    Future<void> login(String email, String password) async {
        try {
            emit(AuthenticationLoading());
            final user = await authRepo.loginWithEmailPassword(email, password);

            if (user != null) {
                _currentUser = user;
                emit(Authenticated(user));
            } else {
                emit(Unauthenticated());
            }
        } catch (e) {
            emit(AuthenticationError(e.toString()));
            emit(Unauthenticated());
        }
    }

    Future<void> register(String name, String email, String password) async {
        try {
            emit(AuthenticationLoading());
            final user = await authRepo.registerWithEmailPassword(name, email, password);

            if (user != null) {
                _currentUser = user;
                emit(Authenticated(user));
            } else {
                emit(Unauthenticated());
            }
        } catch (e) {
            emit(AuthenticationError(e.toString()));
            emit(Unauthenticated());
        }
    }

    Future<void> logout() async {
        authRepo.logout();
        emit(Unauthenticated());
    }

}