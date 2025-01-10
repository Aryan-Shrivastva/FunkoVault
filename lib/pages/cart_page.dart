import "package:flutter/material.dart";
import "package:flutter_application_1/models/cart.dart";
import "package:flutter_application_1/widgets/themes.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20)),
          Expanded(
            child: _CartList(),
            ),
            Divider(),
            _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Material(
      color: Theme.of(context).canvasColor,
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("\$${_cart.totalPrice}",
            style: TextStyle(
              fontSize: 40,
            ),
            ),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Buying not supported yet."),
                ),
              );
            },
            style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(MyTheme.lightBluishColor)
                        ),
               child: Text(
                "Buy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
               ),
             )
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);
  @override
  _CartListState createState()=> _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? Center(child: Text("Nothing to Show")): ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
        onPressed: () {
          _cart.remove(_cart.items[index]);
          setState(() {});
        },
        icon: Icon(Icons.remove_circle_outline),
       ),
       title: Row(
         children:[ Text(""),
         Text(_cart.items[index].name)
         ],
       ),
       
      ),
    );
  }
}