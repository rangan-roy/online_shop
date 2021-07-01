import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String Function(String) validator;
  final void Function(String) onChanged;
  final void Function(String) onSaved;

  FormTextField({ this.label, this.validator, this.onChanged, this.onSaved });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label, 
      ),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
