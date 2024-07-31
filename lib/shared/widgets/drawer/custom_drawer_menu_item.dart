import 'package:flutter/material.dart';

class CustomDrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const CustomDrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
    );
  }
}
