import 'package:dartz/dartz.dart';
import 'package:ploff_kebab/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}

class CacheParams {
  final bool isCache;

  CacheParams({required this.isCache});
}
