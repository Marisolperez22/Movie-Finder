import 'package:either_dart/either.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NoParams && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}