import 'package:flutter/material.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class MapAdvertisementItem extends StatelessWidget {
  MapAdvertisementItem({Key? key, required this.model}) : super(key: key);
  AdvertisementModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Image(
                            image: AssetImage(model.photosList[0] == "string" ||
                                    model.photosList[0].isEmpty
                                ? "assets/images/haha.webp"
                                : model.photosList[
                                    0]), // Replace with your image path
                            fit: BoxFit.cover,
                            height: 100,
                            width: 150,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(model.apartmentDetails),
                      const SizedBox(height: 5,),
                      Text(model.price.toString()),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Text(model.numOfBathroom.toString()),
                          const SizedBox(width: 5,),
                          Container(width:40, child: const Image(image: AssetImage("assets/images/bath.png"))),
                          const SizedBox(width: 5,),
                          Text(model.numOfRoom.toString()),
                          const SizedBox(width: 5,),
                          Container(width:40, child: const Image(image: AssetImage("assets/images/bed.png"))),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        // Triangle.isosceles(
        //   edge: Edge.BOTTOM,
        //   child: Container(
        //     color: Colors.blue,
        //     width: 20.0,
        //     height: 10.0,
        //   ),
        // ),
      ],
    );
  }
}
