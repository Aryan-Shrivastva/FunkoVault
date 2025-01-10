import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

   final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: (){
      setState(() {
        
        if(!isInCart){
          isInCart = !isInCart;
        final _catalog = CatalogModel();
        
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
        }
      });
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(MyTheme.lightBluishColor)
    ),
     child: Row(
       children: [
        isInCart? Icon(Icons.done, color: Colors.white,):
         Icon(CupertinoIcons.cart_badge_plus, color: Colors.white,),
       ],
     ),
    );
  }
}