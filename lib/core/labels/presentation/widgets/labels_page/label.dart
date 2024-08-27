import 'package:flutter/material.dart';
import 'package:starkeep/core/labels/domain/entities/label.dart';
import 'package:starkeep/core/labels/presentation/utils/labels_utils.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/create_label_form.dart';
import 'package:starkeep/shared/extensions/extensions.dart';
import 'package:starkeep/shared/widgets/alert/confirm_dialogue.dart';

class LabelWidget extends StatefulWidget {
  final Label label;

  const LabelWidget({super.key, required this.label});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  final TextEditingController _labelController = TextEditingController();
  bool _isEditingLabel = false;

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    final theme = Theme.of(context);
    _labelController.text = widget.label.name;

    return _isEditingLabel
        ? CreateLabelForm(
            leadingIcon: Icons.delete,
            leadingButtonOnPressed: () async => await showAdaptiveDialog(
              context: context,
              builder: (context) => ConfirmDialogue(
                title: "Delete Label",
                content: "Are you sure you want to delete this label?",
                onYesResponse: () async {
                  setState(() {
                    _isEditingLabel = false;
                  });
                  LabelsUtils.deleteLabel(widget.label.id);
                  Navigator.pop(context);
                },
              ),
            ),
            controller: _labelController,
            trailingIcon: Icons.done,
            trailingButtonOnPressed: () => LabelsUtils.updateLabel(
              id: widget.label.id,
              newName: _labelController.text,
              onComplete: () => setState(() {
                _isEditingLabel = false;
              }),
            ),
          )
        : GestureDetector(
            onTap: () => setState(() => _isEditingLabel = true),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(Icons.label_outline),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.label.name,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ).padX(10).padY(20),
          );
  }
}
