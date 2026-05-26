import 'package:flutter/material.dart';

class AccessibilityOption {
  const AccessibilityOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.enabled,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool enabled;

  AccessibilityOption copyWith({bool? enabled}) {
    return AccessibilityOption(
      title: title,
      description: description,
      icon: icon,
      enabled: enabled ?? this.enabled,
    );
  }
}
