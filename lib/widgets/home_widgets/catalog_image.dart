import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image,}) : super(key: key);

final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
              
              // color: MyTheme.creamColor,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).canvasColor,
                child: Image.network(
                  image,
                  ),
              ),
            );
  }
}