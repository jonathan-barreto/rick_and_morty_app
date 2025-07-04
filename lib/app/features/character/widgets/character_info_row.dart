import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app/core/theme/app_colors.dart';

class CharacterInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final Color? valueColor;
  final Color? labelColor;

  const CharacterInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.icon,
    this.valueColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: labelColor ?? AppColors.secondary, size: 20),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: labelColor ?? AppColors.secondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: valueColor ?? AppColors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
