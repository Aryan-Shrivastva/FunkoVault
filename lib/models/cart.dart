import 'package:flutter_application_1/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();

  CartModel._internal(); 

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //geting items in the cart

  List<Item> get items => _itemIds.map((id) =>
   _catalog.getById(id)).toList();

   //total price
   num get totalPrice => 
   items.fold(0, (total, current) => total + current.price);

   //Add item
   void add(Item item){
    _itemIds.add(item.id);
   } // not working as in the cart page only minus options is there


   void remove(Item item){
    _itemIds.remove(item.id);
   }

}