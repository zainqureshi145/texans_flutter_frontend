class CartItems {
  String itemName;
  int itemQuantity;
  String itemSize;
  String itemPrice;
  String instructions;
  String itemPicture;

  CartItems(
      {this.itemName,
      this.itemQuantity,
      this.itemSize,
      this.itemPrice,
      this.instructions,
      this.itemPicture});

  CartItems.fromJson(Map json)
      : itemName = json['itemName'],
        itemQuantity = json['itemQuantity'],
        itemPrice = json['itemPrice'],
        instructions = json['instructions'],
        itemSize = json['itemSize'],
        itemPicture = json['itemPicture'];

  CartItems.fromMap(dynamic obj) {
    this.itemName = obj['itemName'];
    this.itemQuantity = obj['itemQuantity'];
    this.itemPrice = obj['itemPrice'];
    this.instructions = obj['instructions'];
    this.itemSize = obj['itemSize'];
    this.itemPicture = obj['itemPicture'];
  }

  Map toJson() {
    return {
      'itemName': itemName,
      'itemQuantity': itemQuantity,
      'itemPrice': itemPrice,
      'instructions': instructions,
      'itemSize': itemSize,
      'itemPicture': itemPicture
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'itemName': itemName,
      'itemQuantity': itemQuantity,
      'itemPrice': itemPrice,
      'instructions': instructions,
      'itemSize': itemSize,
      'itemPicture': itemPicture
    };
  }

  String get getItemName => itemName;
  int get getItemQuantity => itemQuantity;
  String get getItemPrice => itemPrice;
  String get getInstructions => instructions;
  String get getItemSize => itemSize;
  String get getItemPicture => itemPicture;

//  @override
//  String toString() {
//    return '$itemName, $itemQuantity, $itemPrice, $instructions, $itemSize, $itemPicture';
//  }

  String itemN() {
    return '$itemName';
  }

  String itemQ() {
    return '$itemQuantity';
  }

  String itemP() {
    return '$itemPrice';
  }

  String itemPic() {
    return '$itemPicture';
  }

  String itemS() {
    return '$itemSize';
  }
}
