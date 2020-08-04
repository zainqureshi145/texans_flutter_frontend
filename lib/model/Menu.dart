class Menu {
  String tag;
  String name;
  String description;
  int price;
  String size;
  String spice;
  String meat;

  Menu(this.tag, this.name, this.description, this.price, this.size, this.spice,
      this.meat);

  Menu.fromJson(Map json)
      : tag = json['tag'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        size = json['size'],
        spice = json['spice'],
        meat = json['meat'];

  Map toJson() {
    return {
      'tag': tag,
      'name': name,
      'description': description,
      'price': price,
      'size': size,
      'spice': spice,
      'meat': meat
    };
  }
}
