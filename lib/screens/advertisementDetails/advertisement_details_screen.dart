import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:semsark/components/loading_screen.dart';
import 'package:semsark/provider/advertisement_detailes_provider.dart';
import 'package:semsark/utils/helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class AdvertisementDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _ui(context) ;

  _ui(context){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var provider = Provider.of<AdvertisementDetailsProvider>(context);
    if(provider.isLoading) return const LoadingScreen() ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Details',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
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
            const SizedBox(
              height: 10,
            ),
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
            createRowWithItems(Icons.format_size, true, "Area", width,
                additionalText: "${provider.model?.area}"),
            createRowWithItems(Icons.bed, false, "Num Of Rooms", width,
                additionalText: "${provider.model?.numOfRoom}"),
            createRowWithItems(
                Icons.apartment_outlined, true, "Num Of Halls", width,
                additionalText: "${provider.model?.numOfHalls}"),
            createRowWithItems(
                Icons.bathtub_outlined, false, "Num Of Bathrooms", width,
                additionalText: "${provider.model?.numOfBathroom}"),
            if (provider.model!.single)
              createRowWithItems(Icons.person, true, "Accept Singles? ", width),
            if (provider.model!.elevator)
              createRowWithItems(
                  Icons.elevator, false, "Found Elevator? ", width),
            if (provider.model!.acceptBusiness)
              createRowWithItems(
                  Icons.business_outlined, true, "Accept Business ?", width),
            if (provider.model!.finished)
              createRowWithItems(
                  Icons.business_outlined, false, "Finished ?", width),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.only(
                  left: 10
              ),
              child: const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: width*0.99,
              margin: const EdgeInsetsDirectional.all(10),
              padding: const EdgeInsetsDirectional.all(10),// Set the desired width for the square container
              color: Colors.grey[200],
              child: Text(
                provider.model!.apartmentDetails,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.only(
                  left: 10
              ),
              child: const Text(
                'User Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: width*0.98,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage(

                            provider.model!.user!.img == "" || provider.model!.user!.img== "string"?
                            "assets/images/Mask.png" : provider.model!.user!.img
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        provider.model!.user!.username,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        provider.model!.user!.email,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      RatingBar(
                        initialRating: provider.model!.user!.rate,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20.0,
                        onRatingUpdate: (rating) {
                          // Handle rating update if needed
                        }, ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          empty: const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          )
                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              alignment: AlignmentDirectional.centerStart,
              padding: const EdgeInsets.only(
                  left: 10
              ),
              child: const Text(
                'Recommended ADs',
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
              icon: const Icon(Icons.share , color: Colors.black,),
              onPressed: () {
                String textToShare = "A7la Mesa 3la a5oya mo3edo";
                Share.share(textToShare);
              },
            ),
            IconButton(
              icon: const Icon(Icons.call),
              color: Colors.green,
              onPressed: () {
                _makePhoneCall(provider.model!.user!.phone);
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat_outlined),
              color: Colors.green,
              onPressed: () {
                // Handle call button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border , color: Colors.red,),
              onPressed: () {
                // Handle love button press
              },
            ),
          ],
        ),
      ),
    );
  }
  void _makePhoneCall(String phoneNumber) async {
    final url = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget createRowWithItems(
      IconData icon, bool isBlue, String text, double width,
      {String? additionalText, IconData? additionalIcon}) {
    return Container(
      color: isBlue ? Helper.light_blue : Colors.white,
      padding: const EdgeInsetsDirectional.all(10),
      child: Row(
        children: [
          SizedBox(
              width: width * 0.1,
              child: Icon(
                icon,
                color: isBlue ? Colors.white : Colors.black,
              )),
          SizedBox(
            width: width * 0.05,
          ),
          SizedBox(
              width: width * 0.4,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 18, color: isBlue ? Colors.white : Colors.black),
              )),
          SizedBox(
            width: width * 0.05,
          ),
          additionalText != null
              ? Text(
                  additionalText,
                  style: TextStyle(
                      fontSize: 18,
                      color: isBlue ? Colors.white : Colors.black),
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
