import 'package:flutter/material.dart';

import '../state/accessibility_settings.dart';
import '../utils/handedness_layout.dart';
import '../widgets/accessibility_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.settings,
  });

  final AccessibilitySettings settings;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settings,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('CareConnect'),
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 900) {
                  return Column(
                    children: <Widget>[
                      AccessibilityPanel(settings: settings),
                      Expanded(child: _HomeContent(settings: settings)),
                    ],
                  );
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      width: HandednessLayout.navigationRailWidth,
                      child: AccessibilityPanel(settings: settings),
                    ),
                    Expanded(child: _HomeContent(settings: settings)),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.settings,
  });

  final AccessibilitySettings settings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final alignment = HandednessLayout.contentAlignment(settings.leftHandMode);
    final buttonAlignment =
        HandednessLayout.quickActionAlignment(settings.leftHandMode);

    return SingleChildScrollView(
      key: const Key('home-content'),
      padding: HandednessLayout.contentPadding(settings.leftHandMode),
      child: Column(
        crossAxisAlignment: alignment,
        children: <Widget>[
          Card(
            key: const Key('hero-card'),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Left-hand accessibility',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A simplified dashboard that keeps the most-used actions, '
                    'safety checks, and support shortcuts close to the left edge.',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const <Widget>[
                      _FeatureChip(
                        icon: Icons.pan_tool_alt_outlined,
                        label: 'Thumb-friendly controls',
                      ),
                      _FeatureChip(
                        icon: Icons.text_fields,
                        label: 'Scalable text',
                      ),
                      _FeatureChip(
                        icon: Icons.visibility_outlined,
                        label: 'High contrast surfaces',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: HandednessLayout.defaultCardSpacing),
          Wrap(
            spacing: HandednessLayout.defaultCardSpacing,
            runSpacing: HandednessLayout.defaultCardSpacing,
            children: const <Widget>[
              _QuickActionCard(
                icon: Icons.calendar_today_outlined,
                title: 'Appointments',
                description: 'Review upcoming visits without leaving the dashboard.',
              ),
              _QuickActionCard(
                icon: Icons.medical_services_outlined,
                title: 'Medication',
                description: 'See reminders and dosing notes in one place.',
              ),
              _QuickActionCard(
                icon: Icons.favorite_border,
                title: 'Wellness check',
                description: 'Monitor your daily check-in status with one tap.',
              ),
              _QuickActionCard(
                icon: Icons.support_agent_outlined,
                title: 'Support',
                description: 'Contact a coordinator through an easy-to-reach shortcut.',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Align(
            alignment: buttonAlignment,
            child: SizedBox(
              width: settings.largerTouchTargets ? 280 : 240,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.emergency_outlined),
                label: const Text('Emergency assistance'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
