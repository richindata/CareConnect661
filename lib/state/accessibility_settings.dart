import 'package:flutter/material.dart';

import '../models/accessibility_option.dart';

class AccessibilitySettings extends ChangeNotifier {
  bool _leftHandMode = true;
  bool _highContrast = true;
  bool _largerTouchTargets = true;
  double _textScale = 1.1;

  bool get leftHandMode => _leftHandMode;
  bool get highContrast => _highContrast;
  bool get largerTouchTargets => _largerTouchTargets;
  double get textScale => _textScale;

  List<AccessibilityOption> get options => <AccessibilityOption>[
        AccessibilityOption(
          title: 'Left-hand mode',
          description: 'Pins the main controls to the left edge for easier reach.',
          icon: Icons.back_hand_outlined,
          enabled: leftHandMode,
        ),
        AccessibilityOption(
          title: 'High contrast',
          description: 'Improves legibility with stronger color contrast.',
          icon: Icons.contrast,
          enabled: highContrast,
        ),
        AccessibilityOption(
          title: 'Larger touch targets',
          description: 'Expands tap areas on the most-used actions.',
          icon: Icons.touch_app_outlined,
          enabled: largerTouchTargets,
        ),
      ];

  void toggleLeftHandMode(bool value) {
    if (_leftHandMode == value) {
      return;
    }

    _leftHandMode = value;
    notifyListeners();
  }

  void toggleHighContrast(bool value) {
    if (_highContrast == value) {
      return;
    }

    _highContrast = value;
    notifyListeners();
  }

  void toggleLargerTouchTargets(bool value) {
    if (_largerTouchTargets == value) {
      return;
    }

    _largerTouchTargets = value;
    notifyListeners();
  }

  void setTextScale(double value) {
    final normalized = value.clamp(1.0, 1.4);

    if (_textScale == normalized) {
      return;
    }

    _textScale = normalized;
    notifyListeners();
  }
}
