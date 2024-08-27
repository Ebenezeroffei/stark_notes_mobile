import 'package:flutter/material.dart';

class CustomDrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;

  const CustomDrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
