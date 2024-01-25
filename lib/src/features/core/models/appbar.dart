import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({
    super.key,
    required this.title,
    this.isAction = false,
    this.leadingIcon = true,
  });

  final String title;
  final bool isAction, leadingIcon;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context)
        .platformBrightness ==
        Brightness.dark;
    return AppBar(
      backgroundColor: Colors.red[300],
      elevation: 10,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      leading: leadingIcon ? IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : null,
      actions: isAction ? [
        IconButton(
            onPressed: () {},
            icon: Icon(
              isDark
                  ? LineAwesomeIcons.sun
                  : LineAwesomeIcons.moon,
              color: Colors.white,
            )),
      ] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
