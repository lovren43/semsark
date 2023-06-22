import 'package:flutter/material.dart';
import 'package:semsark/models/response/advertisement_response_model.dart';

class MapAdvertisementItem extends StatelessWidget {
  MapAdvertisementItem({Key? key , required this.model}) : super(key: key);

  AdvertisementModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            "${model.price.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Area: ${model.area.toStringAsFixed(2)} m',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${model.city}, ${model.gov}',
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
