import 'package:careconnect661/utils/handedness_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('left-hand mode keeps primary actions on the left edge', () {
    expect(
      HandednessLayout.quickActionAlignment(true),
      Alignment.bottomLeft,
    );
    expect(
      HandednessLayout.quickActionAlignment(false),
      Alignment.bottomRight,
    );
  });

  test('left-hand mode applies heavier left-side content padding', () {
    expect(
      HandednessLayout.contentPadding(true),
      const EdgeInsets.fromLTRB(24, 24, 16, 24),
    );
    expect(
      HandednessLayout.contentPadding(false),
      const EdgeInsets.fromLTRB(16, 24, 24, 24),
    );
  });
}
