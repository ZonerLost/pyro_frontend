import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pyroapp/core/constants/app_colors.dart';
import 'package:pyroapp/core/utils/navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final IconThemeData? iconTheme;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Brightness? brightness;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.bottom,
    this.centerTitle,
    this.backgroundColor,
    this.elevation,
    this.iconTheme,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.brightness,
    this.onBack,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final height = Get.height;

    return AppBar(
      titleSpacing: 0,
      title:
          titleWidget ??
          (title != null
              ? Text(title!, style: Theme.of(context).textTheme.headlineSmall)
              : null),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? AppColors.white,
      elevation: elevation ?? 0,
      iconTheme: iconTheme ?? IconThemeData(color: AppColors.black),
      actions: actions,
      leading:
          leading ??
          (automaticallyImplyLeading
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: height * 0.02,
                  ),
                  onPressed: onBack ?? () => navigateBack(),
                )
              : null),
      automaticallyImplyLeading: automaticallyImplyLeading,
      bottom: bottom,
    );
  }
}
