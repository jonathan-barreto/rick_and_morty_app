import 'package:rick_and_morty_app/app/core/either/either.dart';
import 'package:rick_and_morty_app/app/core/errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {}
