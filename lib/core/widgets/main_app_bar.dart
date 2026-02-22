import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.hasBackButton = false,
  });

  final Widget? title;
  final Widget? leading;
  final bool hasBackButton;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.foreground)),
      ),
      padding: const EdgeInsets.only(right: 8),
      child: AppBar(
        title: title,
        actions: actions,
        leading:
            leading ??
            (hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.foreground,
                    ),
                  )
                : null),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
