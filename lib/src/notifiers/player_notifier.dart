import 'dart:developer';

import 'package:flutter/material.dart';

///
/// The new State-Manager for Chewie!
/// Has to be an instance of Singleton to survive
/// over all State-Changes inside chewie
///
class PlayerNotifier extends ChangeNotifier {
  PlayerNotifier._(
    bool hideStuff,
  ) : _hideStuff = hideStuff;

  bool _hideStuff;
  String? _selectedResolution;

  bool get hideStuff => _hideStuff;

  set hideStuff(bool value) {
    _hideStuff = value;
    notifyListeners();
  }

  String? get selectedResolution => _selectedResolution;

  set selectedResolution(String? value) {
    _selectedResolution = value;
    notifyListeners();
    log('notified');
  }

  // ignore: prefer_constructors_over_static_methods
  static PlayerNotifier init() {
    return PlayerNotifier._(
      true,
    );
  }
}
