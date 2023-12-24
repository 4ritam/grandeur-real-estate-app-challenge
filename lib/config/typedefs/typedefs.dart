import 'package:fpdart/fpdart.dart';

import '../../core/utils/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureEitherVoid = FutureEither<void>;

typedef FutureEitherString = FutureEither<String>;

typedef EitherString = Either<Failure, String>;

typedef EitherVoid = Either<Failure, void>;