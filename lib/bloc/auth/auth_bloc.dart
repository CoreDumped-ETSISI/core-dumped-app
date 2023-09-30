import 'package:bloc/bloc.dart';
import 'package:coredumpedapp/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(Unauthenticated()) {
    on<SignUpRequested>((event, emit) async {
      emit(Loading());

      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(
          e.toString(),
        ));
      }
    });

    on<SignInRequested>((event, emit) async {
      emit(Loading());

      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(
          e.toString(),
        ));
      }
    });

    on<SignOutRequested>((event, emit) async {
      if (state is Authenticated) {
        emit(Loading()); // Emit a loading state
        try {
          await authRepository.signOut();
          emit(Unauthenticated());
        } catch (e) {
          emit(AuthError(
            e.toString(),
          ));
        }
      }
    });
  }
}
