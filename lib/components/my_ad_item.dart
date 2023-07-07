import 'package:flutter/material.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';
import '../utils/helper.dart';

class MyAdvertisementItem extends StatelessWidget {
  MyAdvertisementItem({Key? key , required this.model}) : super(key: key);

  AdvertisementModel model ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            model.photosList.isEmpty||
            model.photosList[0]=="" ||
            model.photosList[0] == "string"?
              Image.asset(
                "assets/images/haha.jpeg",
                fit: BoxFit.fill,
                width: 150,
                height: 110,
              ) :
              Image.network(
                model.photosList[0],
                fit: BoxFit.fill,
                width: 150,
                height: 110,
              ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsetsDirectional.only(start: 12, top: 10, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${model.price} EGP",
                    style: Helper.textStyle,
                  ),
                  const SizedBox(
                    height: 15,
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
                        "${model.numOfRoom}",
                        style: Helper.textStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.format_size, color: Helper.blue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${model.area}",
                        style: Helper.textStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.bathtub_outlined, color: Helper.blue),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${model.numOfBathroom}",
                        style: Helper.textStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${model.city}, ${model.gov}',
                    style: Helper.stlye,

                  ),
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}
