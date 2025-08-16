abstract class Result<T> {
  const Result();
  factory Result.success(T data) => Success<T>(data);
  factory Result.failure(String message) => Failure<T>(message);
}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  Failure(this.message);
}

