import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui_kit/providers/app_provider.dart';
import 'package:restaurant_ui_kit/screens/join.dart';
import 'package:restaurant_ui_kit/util/const.dart';
import 'package:restaurant_ui_kit/screens/categories_screen.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List pageInfos = [
    {
      "title": "Fresh Food",
      "body":
          "At Texans Burger, we make sure the ingredients are fresh and tasty.",
      "img": "assets/on1.png",
    },
    {
      "title": "Fast Delivery",
      "body":
          "We deliver right at your doorsteps if you are living in Kongsberg. \n \n \n Leveringspris: kr 79 \n Minimum Order: kr 150",
      "img": "assets/on2.png",
    },
    {
      "title": "Easy Payment",
      "body": "Pay via card or pay cash on delivery.",
      "img": "assets/on3.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages = [
      for (int i = 0; i < pageInfos.length; i++) _buildPageModel(pageInfos[i]),
//      PageViewModel(
//        title: "Theme Selector",
//        bodyWidget: Column(
//          children: <Widget>[
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: <Widget>[
//                Text('Light Theme'),
//                Container(
//                  child: Switch(
//                    value: Provider.of<AppProvider>(context).theme ==
//                            Constants.lightTheme
//                        ? false
//                        : true,
//                    onChanged: (v) async {
//                      if (v) {
//                        Provider.of<AppProvider>(context, listen: false)
//                            .setTheme(Constants.darkTheme, "dark");
//                      } else {
//                        Provider.of<AppProvider>(context, listen: false)
//                            .setTheme(Constants.lightTheme, "light");
//                      }
//                    },
//                    activeColor: Theme.of(context).accentColor,
//                  ),
//                ),
//                Text('Dark Theme'),
//              ],
//            ),
//            Text('Theme can also be selected in the profile settings'),
//          ],
//        ),
//        decoration: PageDecoration(
//          titleTextStyle: TextStyle(
//            fontSize: 28.0,
//            fontWeight: FontWeight.w600,
//            color: Theme.of(context).accentColor,
//          ),
//        ),
//      ),
    ];

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    //return JoinApp();
                    return CategoriesScreen();
                  },
                ),
              );
            },
            onSkip: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    //return JoinApp();
                    return CategoriesScreen();
                  },
                ),
              );
            },
            showSkipButton: true,
            skip: Text("Skip"),
            next: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
            done: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPageModel(Map item) {
    return PageViewModel(
      title: item['title'],
      body: item['body'],
      image: Image.asset(
        item['img'],
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).accentColor,
        ),
        bodyTextStyle: TextStyle(fontSize: 15.0),
//        dotsDecorator: DotsDecorator(
//          activeColor: Theme.of(context).accentColor,
//          activeSize: Size.fromRadius(8),
//        ),
        pageColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
