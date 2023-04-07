import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/bloc/product/product_bloc.dart';
import 'package:gradproj6/widgets/custom_appbar.dart';
import 'package:gradproj6/widgets/custom_navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gradproj6/widgets/custom_carouselcard.dart';
import 'package:gradproj6/bloc/category/category_bloc.dart';
import '../Model/category.dart';
import '../Model/product.dart';
import '../widgets/custom_productcard.dart';
import '../widgets/custom_sectiontitle.dart';

class profileScreen extends StatelessWidget {
  static const String routeName = '/Profile';


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => profileScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/back.jpg",
                      height: 30,
                      width: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/', arguments: {});
                    },
                  ),
                  Column(children: [
                    Text('Profile',
                        style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22)),
                  ]),
                  IconButton(
                    icon: Image.asset(
                      "assets/wish.jpg",
                      height: 40,
                      width: 40,
                    ),
                    onPressed: () {
                      // Add to wish List
                    },
                  ),
                ],
              ),
            ),
            // User card
            BigUserCard(
              cardColor: Colors.blueGrey,
              userName: "Nadim Nassar",//name from database
              userProfilePic: AssetImage("assets/user.jpg"),
              cardActionWidget: SettingsItem(
                icons: CupertinoIcons.pencil,
                iconStyle: IconStyle(
                  withBackground: true,
                  borderRadius: 50,
                  backgroundColor: Colors.yellow[600],
                ),
                title: "Edit name",
                subtitle: "Edit Profile Name",
                onTap: () {
                  Navigator.pushNamed(context, '/changename');
                },

              ),
            ),


            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, '/changeemail');
                  },
                  icons: CupertinoIcons.mail_solid,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'nadim_nassar@yahoo.com',
                  //string from data base
                  subtitle: "Edit E-mail Adress",

                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, '/changemobile');
                  },
                  icons: CupertinoIcons.phone_down,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: '01558044619',
                  //get from database
                  subtitle: "Edit your phone number",
                ),
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, '/changepassword');
                  },
                  icons: CupertinoIcons.lock_shield_fill,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.black,
                  ),
                  title: '*********',
                  //get from database
                  subtitle: "Change Password",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Navigation and Termination",
              items: [
                SettingsItem(
                  onTap: () {
                    Navigator.pushNamed(context, '/wishlist');
                    //wadini page el wishlist
                  },
                  icons: CupertinoIcons.star_slash,
                  iconStyle: IconStyle(),
                  title: 'Wish list',
                  subtitle: "Browse Your Saved Cars",
                ),

                SettingsItem(
                  onTap: () {
                    // sign out
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {
                    //delete acc from data base then logout
                    Navigator.pushNamed(context, '/', arguments: {
                    });
                  },
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




}

