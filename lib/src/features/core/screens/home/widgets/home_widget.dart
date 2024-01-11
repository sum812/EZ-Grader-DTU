import 'package:ez_grader/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final Size size;
  final String title, subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.width * 0.4,
        width: size.width * 0.4,
        padding:
        const EdgeInsets.all(
            tHomeCardPadding),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey),
          borderRadius:
          const BorderRadius
              .all(
              Radius.circular(
                  10.0)),
          color: Colors.grey[600],
          boxShadow: const [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))],
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                ),
                Icon(icon, size: 40,color: Colors.white70,)
              ],
            ),
            Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,
              mainAxisAlignment:
              MainAxisAlignment
                  .end,
              children: [
                Text(
                  title,
                  style: Theme.of(
                      context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                      fontSize:
                      22,
                      fontWeight:
                      FontWeight
                          .bold,
                  color: Colors.white70),
                ),
                Text(
                  subtitle,
                  style: Theme.of(
                      context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                      fontSize:
                      18, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
