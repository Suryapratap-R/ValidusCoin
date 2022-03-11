import 'package:flutter/material.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ModalSheet extends StatefulWidget {
  final String title;
  final String modalMessage;
  final String validationMessage;
  final String fieldLabel;
  final bool validationCriteria;
  final String buttonText;
  final String currentInputValue;
  final Function onPressed;
  const ModalSheet({
    required this.title,
    required this.modalMessage,
    required this.validationMessage,
    required this.fieldLabel,
    required this.validationCriteria,
    this.buttonText = 'Save',
    required this.onPressed,
    required this.currentInputValue,
    Key? key,
  }) : super(key: key);

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final textfieldController = TextEditingController();

  @override
  void initState() {
    textfieldController.text = widget.currentInputValue;
    super.initState();
  }

  @override
  void dispose() {
    textfieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding:
                const EdgeInsets.only(top: 24, bottom: 32, left: 24, right: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ModalSheetBar(
                        title: widget.title,
                      ),
                      ModalForm(
                        fieldLabel: widget.fieldLabel,
                        modalMessage: widget.modalMessage,
                        validationCriteria: widget.validationCriteria,
                        validationMessage: widget.validationMessage,
                        textEditingController: textfieldController,
                      ),
                    ],
                  ),
                  Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            widget.onPressed(textfieldController.text);
                            Navigator.pop(context);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                        child: Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class ModalForm extends StatelessWidget {
  final String modalMessage;
  final String validationMessage;
  final String fieldLabel;
  final bool validationCriteria;
  final TextEditingController textEditingController;
  const ModalForm({
    required this.modalMessage,
    required this.validationMessage,
    required this.fieldLabel,
    required this.validationCriteria,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child:
              Text(modalMessage, style: Theme.of(context).textTheme.bodySmall),
        ),
        TextFormField(
          autofocus: true,
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: fieldLabel,
            border: InputBorder.none,
            fillColor: const Color(0xFF2F3444),
            filled: true,
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty || !validationCriteria) {
              return validationMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}

class ModalSheetBar extends StatelessWidget {
  final String title;
  const ModalSheetBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
          Flexible(
            child: Container(),
            flex: 4,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Flexible(
            child: Container(),
            flex: 6,
          )
        ],
      ),
    );
  }
}
