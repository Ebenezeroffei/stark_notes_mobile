import 'package:flutter/material.dart';
import 'package:starkeep/core/labels/presentation/utils/labels_utils.dart';
import 'package:starkeep/core/labels/presentation/widgets/labels_page/create_label_form.dart';
import 'package:starkeep/shared/extensions/extensions.dart';

class CreateLabel extends StatefulWidget {
  const CreateLabel({super.key});

  @override
  State<CreateLabel> createState() => _CreateLabelState();
}

class _CreateLabelState extends State<CreateLabel> {
  final TextEditingController _label = TextEditingController();
  bool _isCreatingLabel = false;

  @override
  void dispose() {
    _label.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: _isCreatingLabel
          ? CreateLabelForm(
              leadingIcon: Icons.close,
              leadingButtonOnPressed: () => setState(
                () => _isCreatingLabel = false,
              ),
              controller: _label,
              trailingIcon: Icons.done,
              trailingButtonOnPressed: () async =>
                  await LabelsUtils.createLabel(
                controller: _label,
              ),
            )
          : GestureDetector(
              onTap: () => setState(() => _isCreatingLabel = true),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Create new label",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).padX(10).padY(20),
            ),
    );
  }
}
