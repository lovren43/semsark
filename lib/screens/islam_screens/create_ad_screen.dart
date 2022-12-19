import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAd extends StatefulWidget {
  CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  var defult_val = "ALL";
  var defult_cat = "APARTMENT FOR RENT";
  var type_key = GlobalKey() ;
  var cat_key = GlobalKey() ;

  dynamic types = ["ALL", "APARTMENT", "DUPLEX", "STUDIO"];
  dynamic cat = ["APARTMENT FOR RENT", "APARTMENT FOR SELL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.close),
        title: const Text("Include Some Details"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.cyan,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    height: 100,
                    child: const Text("Add Image"),
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildFormInput("Title", TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                buildFormInput(
                    "Price", const TextInputType.numberWithOptions(decimal: true)),
                const SizedBox(
                  height: 20,
                ),
                buildFormInput("Area", TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                buildFormInput("Description", TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  key: cat_key,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Category"
                    ),
                    value: defult_cat,
                    items: cat.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        defult_cat = newValue.toString();
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                    key: type_key,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Type"
                    ),
                    value: defult_val,
                    items: types.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        defult_val = newValue.toString();
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFormInput(String txt, TextInputType txtInput) {
  return TextFormField(
    keyboardType: txtInput,
    initialValue: "",
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: txt,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $txt';
      }
      return null;
    },
  );
}
