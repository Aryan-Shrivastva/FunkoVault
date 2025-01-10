import "dart:convert";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_application_1/models/catalog.dart";
import "package:flutter_application_1/utils/routes.dart";
import "package:flutter_application_1/widgets/home_widgets/catalog_header.dart";
import "package:flutter_application_1/widgets/home_widgets/catalog_list.dart";
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final int days = 30;

   final String name = "Hell Yeah";

   final url = "";

   @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => 
    Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context, MyRoutes.cartRoute),
      backgroundColor: Theme.of(context).canvasColor,
      child: Icon(CupertinoIcons.cart, 
      color: Colors.white,
      ),
      ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                Expanded(            
                  child: CatalogList(),
                )
                else
                Center(
                  child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        )
      );
  }
}










