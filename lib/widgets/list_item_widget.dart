import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imagePath;

  ListItem(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.all(16),
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath))),
    );
  }
}
