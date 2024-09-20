import 'package:flutter/material.dart';

import '../index.dart';

class MyCardTextField extends StatefulWidget {
  const MyCardTextField({
    super.key,
    required this.controller,
    this.label = '',
    this.hintText = '',
    this.maxLines = 1,
    this.maxLength,
    this.onChange,
    this.description = '',
  });

  final String label;
  final String hintText;
  final String description;
  final int maxLines;
  final int? maxLength;
  final Function(String)? onChange;

  final TextEditingController controller;

  @override
  State<MyCardTextField> createState() => _MyCardTextFieldState();
}

class _MyCardTextFieldState extends State<MyCardTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.label.isNotEmpty)
          Text(widget.label,
              style: AppTextStyles.normalBlack.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              )),
        const SizedBox(height: 8.0),
        TextField(
          onChanged: widget.onChange,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            counterText: '',
            filled: true,
            isDense: true,
            hintStyle: AppTextStyles.normalBlack.copyWith(
              fontSize: 16.0,
              color: AppColors.grey,
            ),
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
        ),
        if (widget.description.isNotEmpty) ...[
          const SizedBox(height: 4.0),
          Text(
            widget.description,
            style: AppTextStyles.normalBlack.copyWith(
              fontSize: 14.0,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}
