/// Exception thrown when the animation status cannot be determined.
///
/// This exception is used to indicate that an error occurred while attempting
/// to retrieve the system's animation status. It includes optional details
/// about the underlying error and its stack trace for debugging purposes.
class UnknownAnimationStatus implements Exception {
  /// Creates an instance of [UnknownAnimationStatus].
  ///
  /// [error] is the underlying error that caused the exception (if any).
  /// [stackTrace] is the stack trace of the error (if available).
  UnknownAnimationStatus({
    required this.error,
    this.stackTrace,
  });

  final Object error;
  final StackTrace? stackTrace;

  @override
  String toString() => 'UnknownAnimationStatus: $error\n$stackTrace';
}
