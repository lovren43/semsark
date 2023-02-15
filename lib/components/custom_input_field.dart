import 'package:flutter/material.dart';
import 'package:semsark/screens/islam_screens/helper.dart';

class CustomFieldInput extends StatelessWidget {
  CustomFieldInput({
    Key? key,
    required this.txt,
    TextInputType? inputType,
    Color? color,
    int? maxLine,
    int? maxLen
  }) : super(key: key);
  String txt ;
  TextInputType? inputType;
  Color? color ;
  int? maxLine, maxLen ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType ?? TextInputType.text,
      initialValue: "",
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: txt,
        filled: true,
        fillColor: color ?? Helper.input_field_color,
      ),
      maxLines: maxLine ?? 1,
      maxLength: maxLen ?? 50,
      minLines: 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $txt';
        }
        return null;
      },
    );
  }
}
