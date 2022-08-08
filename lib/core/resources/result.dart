abstract class Result<E, S> {
  bool get isError;
  bool get isSuccess;
  dynamic get();
}

class Success<E, S> implements Result<E, S> {
  final S _success;
  Success(S success) : _success = success;

  @override
  bool get isError => false;

  @override
  bool get isSuccess => true;

  @override
  S get() => _success;
}

class Error<E, S> implements Result<E, S> {
  final E _error;

  Error(E error) : _error = error;

  @override
  E get() => _error;

  @override
  bool get isError => true;

  @override
  bool get isSuccess => false;
}
