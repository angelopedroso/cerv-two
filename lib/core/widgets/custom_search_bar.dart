// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:flutter/services.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    this.placeholder,
  });

  final TextEditingController controller;
  final Function(String value) onSearch;
  final String? placeholder;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _inputFocus = FocusNode();

  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(99),
    borderSide: const BorderSide(color: AppColors.border, width: 1),
  );

  void _handleKeyEventEsc(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      widget.controller.clear();
    }
  }

  @override
  void dispose() {
    _inputFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: (node, event) {
        _handleKeyEventEsc(event);

        return KeyEventResult.ignored;
      },
      child: TextFormField(
        controller: widget.controller,
        focusNode: _inputFocus,
        onChanged: widget.onSearch,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {
              _inputFocus.requestFocus();
            },
            icon: const Icon(Icons.search_rounded),
          ),
          filled: false,
          border: borderStyle,
          enabledBorder: borderStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(99),
            borderSide: const BorderSide(color: AppColors.primary, width: 1),
          ),
          hintText: widget.placeholder,
          hintStyle: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.mutedForeground),
        ),
        cursorColor: AppColors.primary,
      ),
    );
  }
}
