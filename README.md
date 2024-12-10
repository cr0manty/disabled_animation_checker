# disabled_animation_checker

Retrieve the system animation status to determine whether reduced animations are enabled or disabled.

## Getting Started

A simple usage example:

```dart
import 'package:disabled_animation_checker/disabled_animation_checker.dart';

final isEnabled = await _aAnimationCheckerPlugin.isAnimationDisabled();


// You can also use mixin
class _MyAppState extends State<MyApp>
    with WidgetsBindingObserver, AnimationDisabledObserverMixin<MyApp> {
  bool _isAnimationEnabled = false;

  @override
  void animationStatusChanged(bool isEnabled) {
    setState(() {
      _isAnimationEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Is animation disabled: $_isAnimationEnabled'),
        ),
      ),
    );
  }
}
```
## Support Platform

- [x] Android
- [x] iOS

