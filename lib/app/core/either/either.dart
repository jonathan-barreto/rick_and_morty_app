abstract class Either<L, R> {
  const Either();

  bool get isLeft;
  bool get isRight => !isLeft;

  L get left;
  R get right;

  T fold<T>(T Function(L) onLeft, T Function(R) onRight);
}

class Left<L, R> extends Either<L, R> {
  final L _value;

  const Left(this._value);

  @override
  bool get isLeft => true;

  @override
  L get left => _value;

  @override
  R get right => throw Exception('Cannot get right value from a Left');

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onLeft(_value);
}

class Right<L, R> extends Either<L, R> {
  final R _value;

  const Right(this._value);

  @override
  bool get isLeft => false;

  @override
  L get left => throw Exception('Cannot get left value from a Right');

  @override
  R get right => _value;

  @override
  T fold<T>(T Function(L) onLeft, T Function(R) onRight) => onRight(_value);
}
