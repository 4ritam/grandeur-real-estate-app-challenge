class Failure {
  final String message;
  final StackTrace? stackTrace;

  const Failure(this.message, this.stackTrace);

  @override
  String toString() => 'Failure(message: $message, stackTrace: $stackTrace)';
}
