import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.label,
    this.tooltip = '',
    this.hint = '',
    this.isObscure = false,
    this.formatter = const [],
    this.controller,
    this.onTap,
    this.keyboardType,
    this.onSubmit,
    this.textInputAction,
    this.maxLength,
    this.onChanged,
  });

  final VoidCallback? onTap;

  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;

  final String label;
  final String tooltip;
  final String hint;
  final bool isObscure;
  final List<TextInputFormatter> formatter;
  final TextEditingController? controller;
  final Function(String?)? onSubmit;

  final TextInputAction? textInputAction;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.label,
          textAlign: TextAlign.start,
        ),
        TextFormField(
          inputFormatters: [...widget.formatter],
          onChanged: widget.onChanged,
          style: AppTextStyles.textField,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: widget.onSubmit,
          keyboardType: widget.keyboardType,
          obscureText: widget.isObscure ? _obscure : false,
          onTap: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            widget.onTap?.call();
          },
          maxLength: widget.maxLength,
          controller: widget.controller ?? TextEditingController(),
          decoration: InputDecoration(
            isDense: true,
            hintStyle: AppTextStyles.textFieldHint,
            focusColor: Colors.white,
            label: Text(widget.hint),
            labelStyle: AppTextStyles.textFieldHint,
            counter: const SizedBox(),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: widget.tooltip.isEmpty
                ? const SizedBox()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 8.0),
                      if (widget.isObscure)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscure = !_obscure;
                            });
                          },
                          child: Icon(
                            _obscure
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 23.0,
                            color: Colors.white,
                          ),
                        ),
                      const SizedBox(width: 8.0),
                      Tooltip(
                        message: widget.tooltip,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textAlign: TextAlign.end,
                        showDuration: const Duration(seconds: 3),
                        triggerMode: TooltipTriggerMode.tap,
                        child: const Icon(
                          Icons.info_outline,
                          size: 23.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
