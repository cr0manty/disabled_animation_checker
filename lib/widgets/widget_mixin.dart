import 'package:disabled_animation_checker/disabled_animation_checker.dart';
import 'package:flutter/widgets.dart';

/// A mixin to observe and handle changes in system animation settings.
/// It monitors whether animations are enabled or disabled and triggers
/// a callback when the status changes.
mixin AnimationDisabledObserverMixin<T extends StatefulWidget>
    on State<T>, WidgetsBindingObserver {
  // Instance of the animation checker plugin used to check the animation status.
  final _aAnimationCheckerPlugin = DisabledAnimationChecker();

  // Stores the current animation status: `true` if animations are enabled, `false` otherwise.
  bool _isAnimationEnabled = false;

  /// Abstract method to handle changes in animation status.
  /// This must be implemented by any class using this mixin.
  void animationStatusChanged(bool isEnabled);

  /// Getter for the current animation status.
  bool get isAnimationEnabled => _isAnimationEnabled;

  @override
  void initState() {
    super.initState();
    // Adds this class as an observer to the widgets binding to monitor app lifecycle changes.
    WidgetsBinding.instance.addObserver(this);
    // Checks the initial animation status.
    _checkStatus();
  }

  @override
  void dispose() {
    // Removes this class as an observer when the widget is disposed.
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Checks the current animation status asynchronously and updates the state
  /// if there is a change. Triggers `animationStatusChanged` when updated.
  Future<void> _checkStatus() async {
    final isEnabled = await _aAnimationCheckerPlugin.isAnimationDisabled();

    if (_isAnimationEnabled != isEnabled) {
      _isAnimationEnabled = isEnabled;

      // Notify about the animation status change.
      animationStatusChanged(isEnabled);
    }
  }

  @override
  @mustCallSuper
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-check the animation status when the app resumes from the background.
    if (state == AppLifecycleState.resumed) {
      _checkStatus();
    }
  }
}
