import 'package:flutter/material.dart';

import 'modalsheet.dart';

class ProfileCard extends StatefulWidget {
  final String label;
  final String value;
  final String modalTitle;
  final String modalMessage;
  final String modalValidationMessage;
  final String modalFieldLabel;
  final bool modalValidationCriteria;
  final String modalButtonText;
  final Function onPressed;
  final String currentInputValue;

  const ProfileCard({
    required this.label,
    required this.value,
    required this.modalTitle,
    required this.modalMessage,
    this.modalValidationMessage = 'please enter some text',
    required this.modalFieldLabel,
    this.modalValidationCriteria = true,
    this.modalButtonText = 'Save',
    required this.onPressed,
    required this.currentInputValue,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Theme.of(context).backgroundColor,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ModalSheet(
                        title: widget.modalTitle,
                        fieldLabel: widget.modalFieldLabel,
                        modalMessage: widget.modalMessage,
                        validationCriteria: widget.modalValidationCriteria,
                        validationMessage: widget.modalValidationMessage,
                        onPressed: widget.onPressed,
                        currentInputValue: widget.currentInputValue
                      );
                    },
                  );
                },
                child: Text('Edit',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(widget.value,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: const Color(0xFFA1A1A1))),
        ),
      ],
    );
  }
}
