import 'disabled_animation_checker_platform_interface.dart';

export 'resources/exceptions.dart';

class DisabledAnimationChecker {
  Future<bool> isAnimationDisabled() {
    return DisabledAnimationCheckerPlatform.instance.isAnimationDisabled();
  }
}
