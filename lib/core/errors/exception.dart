// exception.dart

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix: $_message';
  }
}

class DioFailureException extends AppException {
  DioFailureException([String? message])
      : super(message, 'Failed to fetch data');
}
