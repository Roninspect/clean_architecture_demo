import 'package:clean_architecture_demo/src/core/resources/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Either<Failure, T>;

typedef FutureVoid = FutureEither<void>;
