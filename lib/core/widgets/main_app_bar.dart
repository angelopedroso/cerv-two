import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/material.dart';

class MainAppBar<T> extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.leading,
    this.leadingWidth,
    this.actions,
    this.hasBackButton = false,
    this.navigationReturn,
  });

  final Widget? title;
  final Widget? leading;
  final double? leadingWidth;
  final bool hasBackButton;
  final T? navigationReturn;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.foreground)),
      ),
      padding: const EdgeInsets.all(8),
      child: AppBar(
        title: title,
        actions: actions,
        leadingWidth: leadingWidth,
        automaticallyImplyLeading: false,
        leading:
            leading ??
            (hasBackButton
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context, navigationReturn);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.foreground,
                        size: 18,
                      ),
                    ),
                  )
                : null),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
