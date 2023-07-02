import 'package:flutter/material.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class MyAdvertisementItem extends StatelessWidget {
  MyAdvertisementItem({Key? key , required this.model}) : super(key: key);

  AdvertisementModel model ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(

          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(model.photosList[0].imgLink=="string" ||
                  model.photosList[0].imgLink=="" ? "assets/images/c.png" : model.photosList[0].imgLink
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${model.numOfBathroom}"),
                    Text("${model.numOfRoom}"),
                    Text("${model.area} m^2"),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.bathtub_sharp),
                    Icon(Icons.bed_sharp),
                    Icon(Icons.area_chart_sharp)
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
