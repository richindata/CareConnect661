import 'package:flutter/material.dart';

class HandednessLayout {
  static const double navigationRailWidth = 320;
  static const double defaultCardSpacing = 16;

  static Alignment quickActionAlignment(bool leftHandMode) {
    return leftHandMode ? Alignment.bottomLeft : Alignment.bottomRight;
  }

  static CrossAxisAlignment contentAlignment(bool leftHandMode) {
    return leftHandMode ? CrossAxisAlignment.start : CrossAxisAlignment.end;
  }

  static EdgeInsets contentPadding(bool leftHandMode) {
    return leftHandMode
        ? const EdgeInsets.fromLTRB(24, 24, 16, 24)
        : const EdgeInsets.fromLTRB(16, 24, 24, 24);
  }
}
