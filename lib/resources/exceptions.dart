class UnknownAnimationStatus implements Exception {
  UnknownAnimationStatus({
    this.error,
    this.stackTrace,
  });

  final Object? error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'UnknownAnimationStatus: $error\n$stackTrace';
}
