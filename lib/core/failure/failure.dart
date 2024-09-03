class Failure {
  final String message;
  Failure([this.message = 'sorry an unexpected error occured']);

  @override
  String toString() => 'Failure: $message';
}
