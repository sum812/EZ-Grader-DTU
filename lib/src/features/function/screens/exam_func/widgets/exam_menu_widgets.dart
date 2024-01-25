import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ExamMenuWidget extends StatelessWidget {
  const ExamMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
    this.endIcon = true,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.yellowAccent : Colors.blueAccent;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: iconColor.withOpacity(0.1),),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: textColor, fontSize: 24),
      ),
      trailing: endIcon ? Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 30,
                color: Colors.grey,
              ),
            ) : null,
    );
  }
}
