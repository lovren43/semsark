import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

import '../utils/helper.dart';

class AdItem extends StatelessWidget {

  AdItem({Key? key , required this.model}) : super(key: key);
  AdvertisementModel? model;
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
                  child: model!.photosList==null || model!.photosList.isEmpty ?
                  Image.asset(
                    "assets/images/haha.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ) : Image.network("${model!.photosList[0]}",
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
                    "${model?.price} EGP",
                    style: Helper.textStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${model!.city}, ${model!.gov}",
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
                        "${model?.numOfRoom}",
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
                        "${model?.area}",
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
                        "${model?.numOfBathroom}",
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
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
