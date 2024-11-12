import 'package:disabled_animation_checker/resources/exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'disabled_animation_checker_platform_interface.dart';

/// An implementation of [DisabledAnimationCheckerPlatform] that uses method channels.
class MethodChannelDisabledAnimationChecker
    extends DisabledAnimationCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('disabled_animation_checker');

  @override
  Future<bool> isAnimationDisabled() async {
    try {
      final isAnimationDisabled = await methodChannel.invokeMethod<bool>(
        'isAnimationDisabled',
      );

      if (isAnimationDisabled == null) {
        throw UnknownAnimationStatus();
      }

      return isAnimationDisabled;
    } on PlatformException catch (e, stack) {
      throw UnknownAnimationStatus(error: e, stackTrace: stack);
    }
  }
}
