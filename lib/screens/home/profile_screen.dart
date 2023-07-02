import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semsark/provider/profile_provider.dart';

import '../../components/my_ad_item.dart';
import '../../models/response/advertisement_response_model.dart';


class Profile extends StatelessWidget{
  const Profile({super.key});

  final double profileHeight = 144;



  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileProvider>(context);
    List<AdvertisementModel> fav = provider.fav.buildings;
    List<AdvertisementModel> ads = provider.myAds;
    List<AdvertisementModel> cur = provider.adClick ? ads : fav;
    //double height = MediaQuery.of(context).size.height ;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child:Column(
          children: [
            buildTop(provider),
            buildContent(provider,cur),
          ],
        )
      ),
    );
  }

  Widget buildContent(ProfileProvider provider,cur){
    return Column(
      children: [
        const SizedBox(height: 10,),
        Text(
            provider.user.username == "" ? "User Name" : provider.user.username,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(129, 137, 176, 1)
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          provider.user.email == "" ? "user@email.com" : provider.user.email,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
            letterSpacing: 5
          ),
        ),
        const SizedBox(height: 30,),
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
        SizedBox(
          height: 250,
          child: cur.isNotEmpty ?
          ListView.builder(
            itemCount: cur.length,
            itemBuilder: (context, index) =>
            InkWell(
              onTap: (){

              },
                child: MyAdvertisementItem(model: cur[index],)
            )
          ) :const Text("No Ads Yet"),
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
        height: 150,
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
    backgroundImage: AssetImage(provider.user.img == "string" || provider.user.img == ""?"assets/images/Mask.png":provider.user.img)

  );
}