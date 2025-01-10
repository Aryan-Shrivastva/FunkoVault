import 'dart:convert';

class CatalogModel{

  static final catModel = CatalogModel._internal();

  CatalogModel._internal(); 
  
  factory CatalogModel() => catModel;


  static List<Item> items = [];

  Item getById(int id) => 
  items.firstWhere((element) => element.id == id, orElse: null);


  Item getByPosition(int pos) => items[pos];
}



class Item {
  final int id;
  final String name;
  final String desc;
  final String desc2;
  final String color;
  final num price;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.desc2,
    required this.color,
    required this.price,
    required this.image,
  });


  

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? desc2,
    String? color,
    num? price,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      desc2: desc2 ?? this.desc2,
      color: color ?? this.color,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'desc2': desc2,
      'color': color,
      'price': price,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      desc2: map['desc2'] ?? '',
      color: map['color'] ?? '',
      price: map['price'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, desc: $desc2, color: $color, price: $price, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.name == name &&
      other.desc == desc &&
      other.desc2 == desc2 &&
      other.color == color &&
      other.price == price &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      desc.hashCode ^
      desc2.hashCode ^
      color.hashCode ^
      price.hashCode ^
      image.hashCode;
  }






  // factory Item.fromMap(Map<String,dynamic> map){
  //   return Item(
  //     id: map["id"],
  //     name: map["name"],
  //     desc: map["desc"],
  //     price: map["price"],
  //     color: map["color"],
  //     image: map["image"],
  //   );
  // }

  // toMap() =>{
  //   "id" : id,
  //   "name" : name,
  //   "desc" : desc,
  //   "price": price,
  //   "color" : color,
  //   "image" : image,
  // };
}

