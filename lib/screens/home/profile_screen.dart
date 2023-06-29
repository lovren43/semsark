import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/profile_provider.dart';

import '../../components/show_ads_item.dart';
import '../../models/response/advertisement_response_model.dart';


class Profile extends StatelessWidget{
  const Profile({super.key});

  final double profileHeight = 144;



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileProvider>(context);
    List<AdvertisementModel> fav = provider.fav.buildings;
    List<AdvertisementModel> ads=provider.myAds;
    double height = MediaQuery.of(context).size.height ;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child:Column(
          children: [
            buildTop(provider),
            buildContent(provider,fav,ads),
          ],
        )
      ),
    );
  }

  Widget buildContent(ProfileProvider provider,fav,ads){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Text(
            provider.user.username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          provider.user.email,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
            letterSpacing: 5
          ),
        ),
        const SizedBox(height: 70,),
        Container(
          width: 400,
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(241, 246, 251, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const Padding(padding: EdgeInsets.only(left: 5)),
              TextButton(
                  onPressed:(){
                    provider.setAd();
                  },
                  child: const Text(
                      'YOUR ADS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),

              // const Padding(padding: EdgeInsets.only(right: 50)),
              TextButton(
                  onPressed:(){
                    provider.setAd();
                  },
                  child: const Text(
                    'Favorites',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          height: 250,
          child: (provider.adClick?ads:fav).isNotEmpty ?
          ListView.builder(
            itemCount: (provider.adClick?ads:fav).length,
            itemBuilder: (context, index) =>
            Card(
              child: ListTile(

                leading: Image.network(provider.adClick ?ads[index].photosList[0].imgLink: fav[index].photosList[0].imgLink),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(provider.adClick ?ads[index].title:fav[index].title),
                  ],
                  ),

                subtitle: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(provider.adClick ?"${ads[index].numOfBathroom}":"${fav[index].numOfBathroom}"),
                        Text(provider.adClick ?"${ads[index].numOfRoom}":"${fav[index].numOfRoom}"),
                        Text(provider.adClick ?"${ads[index].area} m^2":"${fav[index].area} m^2"),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.bathtub_sharp),
                        Icon(Icons.bed_sharp),
                        Icon(Icons.area_chart_sharp)
                      ],
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),

                onTap: () {

                },
              ),
            )) :const Text("No Ads Yet"),
        ),
      ],
    );
  }

  Widget buildTop(ProfileProvider provider) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          topContainer(),
          profileImage(provider),
        ],
    );
  }

  Widget topContainer() => Column(
    children: [
      Container  (
        height: 270,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(241, 246, 251, 1),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(90.0),
              bottomLeft: Radius.circular(90.0),
            )
        ),
        padding: const EdgeInsets.only(left: 10 , right: 10),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.settings,
                    color: Color.fromRGBO(241, 246, 251, 1),
                  )
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'PROFILE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(129, 137, 176, 1),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.settings,
                    color: Color.fromRGBO(129, 137, 176, 1),
                  )
              ),
            ],
          ),
        )
      ),
      const SizedBox(height: 70,)
    ],
  );

  Widget profileImage(ProfileProvider provider) => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: const Color.fromRGBO(241, 246, 251, 1),
    backgroundImage: NetworkImage(provider.user.img == "string" || provider.user.img == ""?"assets/images/Mask.png":provider.user.img)

  );
}