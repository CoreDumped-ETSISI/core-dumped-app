import 'package:coredumpedapp/core/errors/failure.dart';
import 'package:coredumpedapp/core/utils/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository({FirebaseAuth? firebaseAuth});

  ResultVoid signUp({required String email, required String password});

  Future<Either<Failure, UserCredential>> signIn(
      {required String email, required String password});

  Future<Either<Failure, void>> signOut();
}
