import 'package:flutter/material.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class CreateLabelForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback leadingButtonOnPressed;
  final VoidCallback trailingButtonOnPressed;
  final IconData leadingIcon;
  final IconData trailingIcon;

  const CreateLabelForm({
    super.key,
    required this.controller,
    required this.leadingIcon,
    required this.leadingButtonOnPressed,
    required this.trailingButtonOnPressed,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Divider(),
        Row(
          children: [
            IconButton(
              onPressed: leadingButtonOnPressed,
              icon: Icon(leadingIcon),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                controller: controller,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: 'Create new label',
                  hintStyle: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: trailingButtonOnPressed,
              icon: Icon(trailingIcon),
            ),
          ],
        ).padX(10),
        const Divider(),
      ],
    );
  }
}
