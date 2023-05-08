class HttpExceptionClass implements Exception {
  final String message;

  HttpExceptionClass(this.message);

  @override
  String toString() {
    return message;
    // return super.toString(); // Instance of HttpException
  }
}
