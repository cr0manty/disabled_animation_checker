import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'disabled_animation_checker_method_channel.dart';

abstract class DisabledAnimationCheckerPlatform extends PlatformInterface {
  /// Constructs a DisabledAnimationCheckerPlatform.
  DisabledAnimationCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static DisabledAnimationCheckerPlatform _instance =
      MethodChannelDisabledAnimationChecker();

  /// The default instance of [DisabledAnimationCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelDisabledAnimationChecker].
  static DisabledAnimationCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DisabledAnimationCheckerPlatform] when
  /// they register themselves.
  static set instance(DisabledAnimationCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isAnimationDisabled() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
