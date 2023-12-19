abstract class DataState<T> {
  const DataState();
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data);
}

class DataError<T> extends DataState<T> {
  final String message;

  const DataError(this.message);
}
