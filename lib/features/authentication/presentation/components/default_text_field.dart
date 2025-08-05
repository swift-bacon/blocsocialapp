import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {

    final TextEditingController controller;
    final String placeholder;
    final bool obscureText;

    const DefaultTextField({
        super.key,
        required this.controller,
        required this.placeholder,
        required this.obscureText
    });

    @override
    Widget build(BuildContext context) {
        return TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(12),
                ),
                hintText: placeholder,
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                ),
                fillColor: Theme.of(context).colorScheme.secondary,
                filled: true,
            ),
        );
    }
}
