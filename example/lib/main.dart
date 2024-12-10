import 'package:disabled_animation_checker/disabled_animation_checker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

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
