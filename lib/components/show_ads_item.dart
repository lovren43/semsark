import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/helper.dart';

class AdItem extends StatelessWidget {
  const AdItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    "assets/images/haha.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {},
                      shape: const CircleBorder(),
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      minWidth: 50,
                      child: const Icon(Icons.favorite_outline),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  start: 12, top: 10, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "5000 EGP",
                    style: Helper.textStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Adress",
                    style: Helper.stlye,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bed,
                        color: Helper.blue,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "3",
                        style: Helper.stlye,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.format_size, color: Helper.blue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "185",
                        style: Helper.stlye,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.bathtub_outlined, color: Helper.blue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "1",
                        style: Helper.stlye,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.bed, color: Helper.blue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "1",
                        style: Helper.stlye,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.call,
                      color: Helper.blue,
                      size: 30,
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.chat_outlined,
                      color: Helper.blue,
                      size: 30,
                    ),
                  ),
                )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.message,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
