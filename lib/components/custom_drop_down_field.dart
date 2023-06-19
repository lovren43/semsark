import 'package:flutter/material.dart';

import '../utils/helper.dart';

class CustomDropDownField extends StatelessWidget {
   CustomDropDownField({
     required this.key,
     required this.value,
     required this.list,
     required this.onChange,
     required this.labelText,
   }) : super(key: key);
  var value , key , list , onChange , labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Helper.input_field_color,
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          value: value,
          items: list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChange,
    ));
  }
}
