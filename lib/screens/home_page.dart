import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_test/news/news_screen.dart';
import 'package:flutter_ui_test/utils/constants.dart';
import 'package:flutter_ui_test/widgets/list_item_widget.dart';

class Homepage extends StatelessWidget {
  final List<String> images = [
    'assets/images/ic_lamp_one.jpg',
    'assets/images/ic_lamp_one.jpg',
    'assets/images/ic_lamp_two.jpg',
    'assets/images/ic_lamp_two.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: AppTheme.padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Text(
                        'Our Product',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(NewsScreen.routeName);
                        },
                        child: Icon(
                          Icons.menu_book,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 50,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('Your Choice', style: AppTheme.kTitleTextStyle)),
              SizedBox(
                height: 20,
              ),
              _search(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: AppTheme.padding,
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Light',
                                style: AppTheme.kCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Delivery Time',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '3.30',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Our Contact',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _iconData(
                                      Icons.call, Colors.greenAccent.shade200),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  _iconData(Icons.location_on, Colors.orange)
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              iconText(
                                  Icons.cloud_circle, 'Cold', Colors.lightBlue),
                              SizedBox(
                                height: 20,
                              ),
                              iconText(Icons.cloud, 'Warm', Colors.orange),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(top: 30),
                          child: ListView.builder(
                            itemCount: images.length,
                            itemBuilder: (ctx, i) => ListItem(images[i]),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(48.0),
                                  bottomLeft: Radius.circular(48.0)),
                              color: Colors.orange.shade50,
                              shape: BoxShape.rectangle),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconData(IconData icon, Color color) {
    return Container(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: color,
          shape: BoxShape.rectangle),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  Widget iconText(IconData iconData, String text, Color color) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: color,
          shape: BoxShape.rectangle),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffE1E2E4).withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon:
                        Icon(Icons.search_sharp, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
