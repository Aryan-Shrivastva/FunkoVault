import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';


class ItemWidget extends StatelessWidget {
  // const ItemWidget({super.key, required this.item});
  
  final Item item;
  const ItemWidget({ super.key, required this.item});


  


  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        // trailing: Text(item.price.toString()),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          ),
      ),
    );
  }
}