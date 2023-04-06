import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../styles/text_styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool? hasTitle, showBackButton;
  final String? title;
  final IconData? iconData;
  final VoidCallback? onIconPressed;
  final Widget? leadingIcon;
  final double? elevation;
  final Widget? dropdownMenu;
  final Widget? titleWidget;
  final Color? primaryColor;
  final TextStyle? titleStyle;
  final bool? centerTitle;

  CustomAppBar({
    super.key,
    this.onIconPressed,
    this.hasTitle = false,
    this.title,
    this.showBackButton = true,
    this.iconData,
    this.leadingIcon,
    this.elevation,
    this.dropdownMenu,
    this.titleWidget,
    this.primaryColor,
    this.titleStyle,
    this.centerTitle = true,
  });

  Widget _buildTitleText(BuildContext context) => Text(
        title ?? "",
        style: titleStyle ??
            AppTextStyles.heading6.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: primaryColor ?? context.theme.primaryColorDark),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? _buildTitleText(context),
      centerTitle: centerTitle,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: showBackButton!,
      leading: leadingIcon,
      iconTheme:
          context.theme.iconTheme.copyWith(color: primaryColor ?? Colors.black),
      elevation: elevation ?? 0,
      actions: [
        dropdownMenu ?? const SizedBox(),
        if (onIconPressed != null)
          iconData != null
              ? IconButton(
                  onPressed: onIconPressed,
                  splashColor: Colors.transparent,
                  splashRadius: 0.1,
                  icon: Icon(
                    iconData,
                    color: Colors.black87,
                    size: 20,
                  ))
              : const SizedBox()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
