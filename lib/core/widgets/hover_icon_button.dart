import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class HoverIconButton extends StatefulWidget {
  const HoverIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  State<HoverIconButton> createState() => _HoverIconButtonState();
}

class _HoverIconButtonState extends State<HoverIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: IconButton(
        onPressed: widget.onPressed,
        hoverColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        constraints: const BoxConstraints(minHeight: 30, minWidth: 30),
        icon: AnimatedScale(
          scale: _isHovered ? 1.05 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: Icon(widget.icon),
        ),
      ),
    );
  }
}
