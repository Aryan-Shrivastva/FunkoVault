import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/home_widgets/add_to_cart.dart';

class HomeDetailsPage extends StatelessWidget {
  

  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog,}) 
  :assert(catalog!=null), 
  super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Theme.of(context).indicatorColor,
        bottomNavigationBar: Container(
          color: Theme.of(context).cardColor,
          // color: Colors.white,
          child: ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          buttonPadding: EdgeInsets.symmetric(horizontal: 30),
                          children: [
                            Text(
                              '\$${catalog.price.toString()}',
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 202, 37, 25),
                              fontSize: 28,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 60,
                              child: AddToCart(catalog: catalog),
                            ),
                          ],
                        ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image)
                  ),
              ),
                Expanded(
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.symmetric(vertical: 2),
                  color: Theme.of(context).cardColor,
                  child: Column(
                   children: [
                    Text(
                      catalog.name, 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        ),
                      ),
                      Text(
                        catalog.desc,
                         style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical:10, horizontal: 10),
                        child: Text(
                          catalog.desc2,
                          
                          ),
                      ),
                   ],
                  ),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}
