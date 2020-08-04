import 'package:flutter/material.dart';
import 'package:restaurant_ui_kit/util/db_helper.dart';
import 'package:restaurant_ui_kit/model/CartItems.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  List finalCartItems = List();
  String menuName;
  String defaultValue;
  int quantity;
  String picture;
  String price;

  Cart({
    this.menuName,
    this.defaultValue,
    this.quantity,
    this.price,
    this.picture,
  });

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  DatabaseHelper db = DatabaseHelper();

  List<CartItems> myList;

  Future<int> getMyList() async {
    myList = await db.getCartData();
    print('My List is: ${myList[0]}');
    //print('Length of my List is: ${myList.length}');
    int length = myList.length;
    print('Length of my List is: $length');
    return length;
  }

  getValue() async {
    var value = await getMyList();
    print('This Fucking Vale is: $value');
    return value;
  }

  @override
  void initState() {
    getMyList();
    getValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: FlatButton(
                splashColor: Colors.transparent,
                onPressed: () => {
                  //cartItems.deleteCartDatabase(),
                  print('Ordered....'),
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            "Cart",
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: db.getCartData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 110.0,
                        width: double.infinity,
                        //color: Colors.pink,
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                height: 80.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    //image: AssetImage(widget.picture),
                                    image: AssetImage(
                                        snapshot.data[index].itemPic()),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  //widget.menuName,
                                  snapshot.data[index].itemN(),

                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Row(
                                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Text(
                                            'Size',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            //widget.defaultValue,
                                            snapshot.data[index].itemS(),
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Quantity',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            'x',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          Text(
                                            //quantity(),
                                            snapshot.data[index].itemQ(),
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.only(left: 10.0),
//                    child: Text(
//                      'Special Instructions',
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 20.0,
//                          color: Colors.black),
//                    ),
//                  ),
//                ],
//              ),
//              Container(
//                height: 100.0,
//                width: double.infinity,
//                //color: Colors.yellow,
//                child: Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: TextField(
//                    autocorrect: false,
//                    keyboardType: TextInputType.text,
//                    controller: myController,
//                    decoration: InputDecoration(
//                        hintText: 'Instructions',
//                        hintStyle: TextStyle(color: Colors.black),
//                        border: OutlineInputBorder(
//                            borderRadius: BorderRadius.circular(5.0))),
//                  ),
//                ),
//              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 30.0),
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    onPressed: () => {
                      //cartItems(),
//                      CartItems(
//                          itemName: widget.menuName,
//                          itemQuantity: widget.quantity,
//                          itemPrice: widget.price,
//                          instructions: myController.text),
//
//                      cartItems = CartItems(
//                          itemName: widget.menuName,
//                          itemQuantity: widget.quantity,
//                          itemPrice: widget.price,
//                          instructions: myController.text,
//                          itemSize: widget.defaultValue,
//                          itemPicture: widget.picture),
//                      //db.saveData(cartItems),
//                      db.insertToCart(cartItems),
//                      db.getCartData(),
//                      //CartItems().databaseConnection(),
                      print('Go back to order more...'),
                    },
                    child: Container(
                      child: Text(
                        'Add more items',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  //db.getCartData();
                  db.deleteDB();
                },
                child: Container(
                  child: Text(
                    'Delete DB',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  getCartLength();
                },
                child: Container(
                  child: Text(
                    'Cart Length',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Grand Total =',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Kr',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 2.0,
                      width: 200.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String quantity() {
    int q = widget.quantity;
    String quantity = "$q";
    return quantity;
  }

  Future<int> getCartLength() async {
    int length = await db.getCartLength();
    print(length);
    return length;
  }
}

//Container(
//child: Column(
//children: <Widget>[
//Text(snapshot.data[index].itemN()),
//Text(snapshot.data[index].itemQ()),
//Text(snapshot.data[index].itemP()),
//Text(snapshot.data[index].itemPic()),
//],
//),
//),
