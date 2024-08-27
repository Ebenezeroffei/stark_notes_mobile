import 'package:flutter/material.dart';
import 'package:starkeep/core/labels/presentation/utils/labels_utils.dart';

class CreateLabelDialogue extends StatelessWidget {
  CreateLabelDialogue({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Label"),
      content: TextField(
        controller: _controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              LabelsUtils.createLabel(controller: _controller);
              Navigator.pop(context);
            }
          },
          child: const Text("Add"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        )
      ],
    );
  }
}
