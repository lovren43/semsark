import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CreateAd extends StatefulWidget {
  CreateAd({Key? key}) : super(key: key);

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  var defult_val = "ALL";
  bool isChecked = false;
  final TextStyle _textStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white.withRed(93).withGreen(109).withBlue(129),
  );
  var _value, fin_value;
  var num_of_rooms = 1 , num_of_bath_rooms = 1 ,
      num_of_halls = 1 , num_of_level = 1 ;
  var _color = Colors.white.withBlue(251).withGreen(246).withRed(241);
  var defult_sinal = "ALL";
  var defult_cat = "APARTMENT FOR RENT";
  var type_key = GlobalKey();
  var signal_key = GlobalKey();
  var cat_key = GlobalKey();

  dynamic types = ["ALL", "APARTMENT", "DUPLEX", "STUDIO"];
  dynamic signals = ["ALL", "Vodafone", "Orange", "Etisalat", "WE"];
  dynamic cat = ["APARTMENT FOR RENT", "APARTMENT FOR SELL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.close),
        title: const Text("Include Some Details"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "ENTER THE HOUSE DETAILS",
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFormInput("Title", TextInputType.text, 1, 50),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFormInput(
                          "Price",
                          const TextInputType.numberWithOptions(decimal: true),
                          1,
                          10),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFormInput("Area", TextInputType.number, 1, 10),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: _color,
                        child: DropdownButtonFormField(
                            key: type_key,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Type",
                            ),
                            value: defult_val,
                            items: types
                                .map<DropdownMenuItem<String>>((String value) {
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: _color,
                        child: DropdownButtonFormField(
                            key: signal_key,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Signal Power"),
                            value: defult_sinal,
                            items: signals
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                defult_sinal = newValue.toString();
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: _color,
                        child: DropdownButtonFormField(
                            key: cat_key,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Category"),
                            value: defult_cat,
                            items: cat
                                .map<DropdownMenuItem<String>>((String value) {
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildFormInput("Details", TextInputType.text, 10, 500),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "CATEGORY",
                                    style: _textStyle,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: "RENT",
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    ),
                                    Text("RENT"),
                                    Radio(
                                      value: "SELL",
                                      groupValue: _value,
                                      onChanged: (value) {
                                        setState(() {
                                          _value = value;
                                        });
                                      },
                                    ),
                                    Text("SELL"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text(
                                    "FINISHED",
                                    style: _textStyle,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: "YES",
                                      groupValue: fin_value,
                                      onChanged: (value) {
                                        setState(() {
                                          fin_value = value;
                                        });
                                      },
                                    ),
                                    const Text("YES"),
                                    Radio(
                                      value: "NO",
                                      groupValue: fin_value,
                                      onChanged: (value) {
                                        setState(() {
                                          fin_value = value;
                                        });
                                      },
                                    ),
                                    const Text("NO"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ROOM",
                                      style: _textStyle,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadiusDirectional.circular(10),
                                      ) ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                                onPressed: (){},
                                              color: Colors.white.withRed(230).withGreen(236).withBlue(242),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(151).withGreen(162).withBlue(175),
                                              child: const Text(
                                                  "-",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                            Text("$num_of_rooms",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(227).withGreen(244).withBlue(255),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(76).withGreen(172).withBlue(232),
                                              child: const Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 25,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BATHROOM",
                                      style: _textStyle,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadiusDirectional.circular(10),
                                      ) ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(230).withGreen(236).withBlue(242),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(151).withGreen(162).withBlue(175),
                                              child: const Text(
                                                "-",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                            Text("$num_of_bath_rooms",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(227).withGreen(244).withBlue(255),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(76).withGreen(172).withBlue(232),
                                              child: const Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25,),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HOUSE LEVEL",
                                      style: _textStyle,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadiusDirectional.circular(10),
                                      ) ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(230).withGreen(236).withBlue(242),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(151).withGreen(162).withBlue(175),
                                              child: const Text(
                                                "-",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                            Text("$num_of_level",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(227).withGreen(244).withBlue(255),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(76).withGreen(172).withBlue(232),
                                              child: const Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 25,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "HALLS",
                                      style: _textStyle,
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      decoration:BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadiusDirectional.circular(10),
                                      ) ,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                                        child: Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(230).withGreen(236).withBlue(242),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(151).withGreen(162).withBlue(175),
                                              child: const Text(
                                                "-",
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                            ),
                                            Text("$num_of_halls",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: (){},
                                              color: Colors.white.withRed(227).withGreen(244).withBlue(255),
                                              shape: CircleBorder(),
                                              textColor: Colors.white.withRed(76).withGreen(172).withBlue(232),
                                              child: const Text(
                                                "+",
                                                style: TextStyle(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25,),
                        ],
                      ),
                      Container(
                        decoration:BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ) ,
                        width: double.infinity,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top:20.0, bottom: 20),
                            child: Column(
                              children: const [
                                Icon(
                                    Icons.camera_alt_outlined,
                                  size: 70,
                                ),
                                Text("Take a pictur for a house",
                                  style: TextStyle(
                                    fontSize: 16,
                                    //rgba(28, 45, 87, 1)
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                        child: MaterialButton(onPressed: (){},
                          //rgba(69, 166, 221, 1)
                          color: Colors.white.withRed(69).withGreen(166).withBlue(221),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                                "Complete your adding",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 85,),
        ],
      ),
    );
  }
}

Widget buildFormInput(
    String txt, TextInputType txtInput, int maxLine, int maxLength) {
  var color = Colors.white.withBlue(251).withGreen(246).withRed(241);
  return TextFormField(
    keyboardType: txtInput,
    initialValue: "",
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: txt,
      filled: true,
      fillColor: color,
    ),
    maxLines: maxLine,
    maxLength: maxLength,
    minLines: 1,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $txt';
      }
      return null;
    },
  );
}
