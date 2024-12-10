import 'disabled_animation_checker_platform_interface.dart';

export 'resources/exceptions.dart';
export 'widgets/widget_mixin.dart';

/// A public-facing API to check the system's animation status.
///
/// This class delegates the call to the platform-specific implementation
/// defined by `DisabledAnimationCheckerPlatform`. It allows you to determine
/// whether animations are disabled on the user's device.
class DisabledAnimationChecker {
  /// Determines if animations are disabled on the system.
  ///
  /// Returns a [Future] that resolves to `true` if animations are disabled,
  /// and `false` otherwise. The actual implementation is handled by the
  /// platform-specific class.
  Future<bool> isAnimationDisabled() {
    return DisabledAnimationCheckerPlatform.instance.isAnimationDisabled();
  }
}
