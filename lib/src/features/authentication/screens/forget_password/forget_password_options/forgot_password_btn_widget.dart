import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBtnWidget
    extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    super.key,
    required this.onTap,
    required this.btnIcon,
    required this.title,
    required this.subTitle,
  });

  final VoidCallback onTap;
  final IconData btnIcon;
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
            tDefaultSize - 15.0),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(8.0),
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 50.0,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
