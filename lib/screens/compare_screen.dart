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

class compareScreen extends StatelessWidget {
  static const String routeName = '/compare';
  List properties1 = ["500", "6 sec", "9"];
  List properties2 = ["650", "5 sec", "7"];
  String car1 = "GLE";
  String car2 = "Charger";
  String carName1 = "Mercedes GLE 2022";
  String carName2 = "Dodge Charger 2022";

//route dih fl nav bar makan el cart ya abbbaaaaaaaaaaaaaas

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => compareScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparison'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    radius: 50.0,
                    child: ClipRRect(
                      child: Image.asset('assets/compare2.jpg'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    radius: 50.0,
                    child: ClipRRect(
                      child: Image.asset('assets/compare1.jpg'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text(
                    carName1,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    carName2,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            DataTable(columns: [
              DataColumn(label: Text('Spec')),
              DataColumn(label: Text(car1)),
              DataColumn(label: Text(car2)),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('Horsepower')),
                DataCell(Text(properties1[0])),
                DataCell(Text(properties2[0])),
              ]),
              DataRow(cells: [
                DataCell(Text('0 to 60')),
                DataCell(Text(properties1[1])),
                DataCell(Text(properties2[1])),
              ]),
              DataRow(cells: [
                DataCell(Text('Miles per gallon')),
                DataCell(Text(properties1[2])),
                DataCell(Text(properties2[2])),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
