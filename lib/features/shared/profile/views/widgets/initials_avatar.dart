import 'package:flutter/material.dart';
import 'package:pyroapp/core/constants/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final double size;

  const InitialsAvatar({
    super.key,
    required this.name,
    required this.avatarUrl,
    this.size = 56,
  });

  String _initials(String n) {
    final parts = n.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    final a = parts[0].isNotEmpty ? parts[0][0] : '';
    final b = parts.length > 1 && parts[1].isNotEmpty ? parts[1][0] : '';
    return (a + b).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    const borderWidth = 2.0;
    final innerSize = size - (borderWidth * 2);

    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary, // ✅ border color
      ),
      padding: const EdgeInsets.all(borderWidth),
      child: ClipOval(
        child: avatarUrl.trim().isNotEmpty
            ? Image.network(
                avatarUrl,
                width: innerSize,
                height: innerSize,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _fallback(),
              )
            : _fallback(),
      ),
    );
  }

  Widget _fallback() {
    return Container(
      color: AppColors.muted,
      alignment: Alignment.center,
      child: Text(
        _initials(name),
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.maincolor3,
        ),
      ),
    );
  }
}
