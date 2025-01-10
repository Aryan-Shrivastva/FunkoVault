import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/home_details_page.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_1/widgets/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=>HomeDetailsPage(
                catalog: catalog,
                )
                ),
                ),
          child: CatalogItem(catalog: catalog),
          );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  
  final Item catalog;

  const CatalogItem({ Key? key, required this.catalog}) 
  : assert(catalog!=null),
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0) ,
      width: 150,
      height: 150,
      
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image
                ),
            ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [            
                  Text(
                    catalog.name, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      catalog.desc,
                       style: Theme.of(context).textTheme.bodySmall,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        Text(
                          '\$${catalog.price.toString()}',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                        AddToCart(catalog: catalog),
                      ],
                    ),
                ],
              ))
          ],
        ),
      ),
    );
  }
}

