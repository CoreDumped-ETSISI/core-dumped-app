import 'package:coredumpedapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Future<void>;

typedef ResultUserCredential = Future<Either<Failure, UserCredential>>;
