import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/advertisement_detailes_provider.dart';
import 'package:semsark/utils/helper.dart';

class AdvertisementDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AdvertisementDetailsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Helper.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('${provider.model?.price} LE'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: height * 0.25,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: provider.model?.photosList.map((image) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      image.imgLink == "" || image.imgLink == "string"
                          ? "assets/images/haha.jpeg"
                          : image.imgLink,
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10,),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                provider.model!.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            createRowWithItems(
                Icons.format_size, true, "Area", width,
                additionalText: "${provider.model?.area}"),
            createRowWithItems(
                Icons.bed, false, "Num Of Rooms", width,
                additionalText: "${provider.model?.numOfRoom}"),
            createRowWithItems(
                Icons.apartment_outlined, true, "Num Of Halls", width,
                additionalText: "${provider.model?.numOfHalls}"),
            createRowWithItems(
                Icons.bathtub_outlined, false, "Num Of Bathrooms", width,
                additionalText: "${provider.model?.numOfBathroom}"),
            if(provider.model!.single)
              createRowWithItems(
                  Icons.person, true, "Accept Singles? ", width),
            if(provider.model!.elevator)
            createRowWithItems(
                Icons.elevator, false, "Found Elevator? ", width),

            if(provider.model!.acceptBusiness)
              createRowWithItems(
                  Icons.business_outlined, true, "Accept Business ?", width),
            if(provider.model!.finished)
              createRowWithItems(
                  Icons.business_outlined, false, "Finished ?", width),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Handle share button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.call),
              color: Colors.green,
              onPressed: () {
                // Handle call button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Handle love button press
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createRowWithItems(
      IconData icon, bool isBlue, String text, double width,
      {String? additionalText, IconData? additionalIcon}) {
    return Container(
      color: isBlue ? Helper.blue : Colors.white,
      padding: const EdgeInsetsDirectional.all(10),
      child: Row(
        children: [
          SizedBox(width: width * 0.1, child: Icon(icon , color: isBlue? Colors.white : Colors.black,)),
          SizedBox(width: width*0.05,),
          SizedBox(width: width * 0.4, child: Text(text,
            style: TextStyle(
              fontSize: 18,
              color: isBlue? Colors.white : Colors.black
            ),

          )),
          SizedBox(width: width*0.05,),
          additionalText != null
              ? Text(additionalText ,
            style: TextStyle(
                fontSize: 18,
                color: isBlue? Colors.white : Colors.black
            ),

          )
              : Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: isBlue ? Colors.white : Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: isBlue ? Colors.green : Colors.white,
                      size: 16.0,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
