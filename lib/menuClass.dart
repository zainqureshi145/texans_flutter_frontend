import 'package:flutter/material.dart';

class MenuItems {
  String decision = 'Burgers';

  MenuItems({this.decision});

  Widget makeDecision(String decision) {
    if (decision == 'Burgers') {
      return GridView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
//      childAspectRatio: MediaQuery.of(context).size.width /
//          (MediaQuery.of(context).size.height / 1.25),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 200.0,
                width: 150,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  //color: Colors.white30,
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/food/burger-1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Hamburger',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Text('Failed...');
  }

//  Widget burgerWidget() {
//    return GridView(
//      shrinkWrap: true,
//      physics: ScrollPhysics(),
//      scrollDirection: Axis.vertical,
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
////      childAspectRatio: MediaQuery.of(context).size.width /
////          (MediaQuery.of(context).size.height / 1.25),
//      ),
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: GestureDetector(
//            onTap: () {},
//            child: Container(
//              height: 200.0,
//              width: 150,
//              decoration: BoxDecoration(
//                boxShadow: [
//                  BoxShadow(
//                    color: Colors.grey.withOpacity(0.5),
//                    spreadRadius: 5,
//                    blurRadius: 7,
//                    offset: Offset(0, 3), // changes position of shadow
//                  ),
//                ],
//                borderRadius: BorderRadius.circular(20.0),
//                //color: Colors.white30,
//                image: new DecorationImage(
//                  image: new ExactAssetImage('assets/food/burger-1.png'),
//                  fit: BoxFit.contain,
//                ),
//              ),
//              child: Align(
//                alignment: Alignment.bottomCenter,
//                child: Padding(
//                  padding: const EdgeInsets.only(bottom: 10),
//                  child: Text(
//                    'Hamburger',
//                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ],
//    );
//  }
}
