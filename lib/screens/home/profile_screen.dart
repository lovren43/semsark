import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semsark/components/loading_screen.dart';
import 'package:semsark/models/response/user_details.dart';
import 'package:semsark/provider/home_provider.dart';
import 'package:semsark/provider/profile_provider.dart';
import 'package:semsark/screens/auth/sign_in_screen.dart';
import 'package:semsark/utils/helper.dart';

import '../../components/button.dart';
import '../../components/my_ad_item.dart';
import '../../models/response/advertisement_response_model.dart';
import '../../provider/advertisement_detailes_provider.dart';
import '../advertisementDetails/advertisement_details_screen.dart';
import '../auth/personal_info_screen.dart';

class ProfileScreen extends StatelessWidget {

   ProfileScreen({super.key});

  final double profileHeight = 144;
  double height = 0 ;
  @override
  Widget build(BuildContext context) {
    return _ui(context);
  }

  _ui(context) {
    var provider = Provider.of<ProfileProvider>(context);
    List<AdvertisementModel> fav = provider.fav.buildings;
    List<AdvertisementModel> ads = provider.myAds;
    List<AdvertisementModel> cur = provider.adClick ? ads : fav;
    height = MediaQuery.of(context).size.height;

    if (provider.loading) return const LoadingScreen();
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              buildTop(provider, context),
              buildContent(provider, cur),
            ],
          )),
    );
  }

  Widget buildContent(ProfileProvider provider, cur) {

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          provider.user.username ==null || provider.user.username==  "" ? "User Name" : provider.user.username!,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(129, 137, 176, 1)),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          provider.user!.email == "" ? "user@email.com" : provider.user!.email,
          style: const TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(129, 137, 176, 1),
              letterSpacing: 5),
        ),
        const SizedBox(
          height: 30,
        ),
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
                onPressed: () {
                  provider.setAd(true);
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
                onPressed: () {
                  provider.setAd(false);
                },
                autofocus: true,
                child: const Text(
                  'Favorites',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        // const SizedBox(height: 0,),
        SizedBox(
          height: height*0.5,
          child: cur.isNotEmpty
              ? ListView.builder(
                  itemCount: cur.length,
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Provider.of<AdvertisementDetailsProvider>(context, listen: false).setModel(cur[index]) ;
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>
                            AdvertisementDetailsScreen()
                        )) ;
                      },
                      child: MyAdvertisementItem(
                        model: cur[index],
                      )))
              : const Text("No Ads Yet"),
        ),
      ],
    );
  }

  Widget buildTop(ProfileProvider provider, context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        topContainer(context),
        profileImage(provider),
      ],
    );
  }

  Widget topContainer(context) {
    double width = MediaQuery.of(context).size.width;
    return
   Column(
      children: [
          Container(
              height: 160,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(241, 246, 251, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(90.0),
                    bottomLeft: Radius.circular(90.0),
                  )),
              padding: const EdgeInsets.only(left: 50, right: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                        alignment: Alignment.topRight,
                        onPressed: () {



                          showMenu(
                            context: context,
                              position: const RelativeRect.fromLTRB(kToolbarHeight, 80, 20, 0),

                            items: [
                              const PopupMenuItem<String>(
                                value: 'Edit Profile',
                                child: Text('Edit Profile'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'Logout',
                                child: Text('Logout'),
                              ),
                            ],
                          ).then((selectedValue) {
                            if (selectedValue == 'Edit Profile') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PersonalInfoScreen()),
                              );
                              // Handle Option 1 selection
                            } else if (selectedValue == 'Logout') {
                              return showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      Stack(alignment: Alignment.center, children: <Widget>[
                                        Column(
                                          children: [
                                            ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(150),
                                                    bottomRight: Radius.circular(150)),
                                                child: ImageFiltered(
                                                  imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                                  child: SizedBox(
                                                      height: 100,
                                                      width: double.infinity,
                                                      child: Image.asset(
                                                        'assets/images/back.png',
                                                        fit: BoxFit.fill,
                                                      )),
                                                )),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            height: 70,
                                            right:110,
                                            child: Image.asset(
                                              'assets/images/logout.png',
                                            )),
                                      ]),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          "Are you sure you want to logout?",
                                          style: TextStyle(color: Helper.blue, fontSize: 17),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: SizedBox(
                                              width: 0.3 * width,
                                              height: 50,
                                              child: CustomButon(
                                                text: "BACK",
                                                onTap: () => Navigator.pop(context, 'BACK'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: SizedBox(
                                              width: 0.3 * width,
                                              height: 50,
                                              child: CustomButon(
                                                text: "LOGOUT",
                                                onTap: () async {
                                                  // SignUpServices().sendOTP(email!);
                                                  await Provider.of<ProfileProvider>(context,listen: false).logout();
                                                  Provider.of<HomeProvider>(context,listen: false).changePosition(0);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return LoginScreen();
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ));
                              // Handle Option 2 selection
                            }
                          });


                        },
                        icon: const Icon(
                          Icons.settings,
                          color: Color.fromRGBO(129, 137, 176, 1),
                        )),
                  ],
                ),
              )),
          const SizedBox(
            height: 70,
          )
        ],
      );}

  Widget profileImage(ProfileProvider provider) => Stack(
    alignment: Alignment.bottomRight,
    children: [
      CircleAvatar(
        radius: profileHeight / 2.4,
        backgroundColor: const Color.fromRGBO(241, 246, 251, 1),
        backgroundImage:
        provider.user.img == null ||
            provider.user.img == "string" || provider.user.img == ""
            ?
         null: NetworkImage(provider.user.img!,),
        foregroundImage: provider.user.img == null ||
            provider.user.img == "string" || provider.user.img == ""
            ?
        const AssetImage("assets/images/Mask.png") : null,
      ),
      Icon(
        provider.user.verifyId == null || !provider.user.verifyId! ? Icons.warning : Icons.check_circle,
        color: provider.user.verifyId == null || !provider.user.verifyId! ? Colors.orange : Helper.blue,
      ),
    ],
  );

}
