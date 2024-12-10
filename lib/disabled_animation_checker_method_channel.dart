import 'package:disabled_animation_checker/resources/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disabled_animation_checker_platform_interface.dart';

/// A concrete implementation of the platform interface for checking
/// system animation settings using a method channel.
class MethodChannelDisabledAnimationChecker
    extends DisabledAnimationCheckerPlatform {
  /// The method channel used to communicate with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disabled_animation_checker');

  /// Checks if animations are disabled on the system.
  ///
  /// This method communicates with the native platform using the method
  /// channel to retrieve the animation status.
  ///
  /// Returns `true` if animations are disabled, `false` otherwise.
  /// Throws [UnknownAnimationStatus] if the status cannot be determined or an
  /// error occurs during the platform call.
  @override
  Future<bool> isAnimationDisabled() async {
    try {
      // Invokes the 'isAnimationDisabled' method on the platform side.
      final isAnimationDisabled = await methodChannel.invokeMethod<bool>(
        'isAnimationDisabled',
      );

      // If the result is null, throw an exception as the status is unknown.
      if (isAnimationDisabled == null) {
        throw UnknownAnimationStatus(
          error: "Can't determine animation status, status is null",
        );
      }

      // Return the retrieved animation status.
      return isAnimationDisabled;
    } on PlatformException catch (e, stack) {
      // Catch platform-specific exceptions and wrap them in a custom exception.
      throw UnknownAnimationStatus(error: e, stackTrace: stack);
    }
  }
}
