import 'package:flutter/material.dart';
import 'package:koinonia/Api/Networkutils.dart';
import 'package:koinonia/appconfi.dart';
import 'package:koinonia/model/package.dart';
import 'package:koinonia/payment/paymentscreen.dart';

class ChoosePlanScreen extends StatefulWidget {
  @override
  _ChoosePlanScreenState createState() => _ChoosePlanScreenState();
}

class _ChoosePlanScreenState extends State<ChoosePlanScreen> {
  late AppConfig _appConfig;
  bool isone = false, istwo = false, isthre = false, isfour = true;

  int i = 3;

  String rate = "\$ 4.99";
  String mrate = "\$ 4.99";
  void selection(int i) {
    if (i == 1) {
      isone = true;
      isthre = false;
      istwo = false;
      isfour = false;
      rate = pckglist[0].packageprice;
      mrate = pckglist[0].totalpackageprice;
    } else if (i == 2) {
      isone = false;
      isthre = false;
      istwo = true;
      isfour = false;
      rate = pckglist[1].packageprice;
      mrate = pckglist[1].totalpackageprice;
    } else if (i == 3) {
      isone = false;
      isthre = true;
      istwo = false;
      isfour = false;
      rate = pckglist[2].packageprice;
      mrate = pckglist[2].totalpackageprice;
    } else if (i == 4) {
      isone = false;
      isthre = false;
      istwo = false;
      isfour = true;
      rate = pckglist[3].packageprice;
      mrate = pckglist[3].totalpackageprice;
    }
    setState(() {});
  }

  late Networkutils networkutils;
  @override
  void initState() {
    super.initState();
    networkutils = Networkutils();
    getpackage();
  }

// ignore: deprecated_member_use
  List<PackagesItem> pckglist = [];

  void getpackage() async {
    await networkutils.getpackage();
    pckglist = Packages.myPackgelist;
    setState(() {
      rate = pckglist[3].packageprice;
      mrate = pckglist[3].totalpackageprice;
    });
  }

  @override
  Widget build(BuildContext context) {
    _appConfig = AppConfig(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Choice Plan',
                style: TextStyle(
                  fontSize: _appConfig.rHP(3),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: _appConfig.rHP(47),
                ),
                Container(
                  height: _appConfig.rHP(38),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              selection(1);
                              i = 0;
                            },
                            child: Container(
                              child: !isone
                                  ? Image.asset(
                                      "assets/images/month_1.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/month_1_pressed.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selection(2);
                              i = 1;
                            },
                            child: Container(
                              child: !istwo
                                  ? Image.asset(
                                      "assets/images/month_3.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/month_3_pressed.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              selection(3);
                              i = 2;
                            },
                            child: Container(
                              child: !isthre
                                  ? Image.asset(
                                      "assets/images/month_6.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/pressed6.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              selection(4);
                              i = 3;
                            },
                            child: Container(
                              child: !isfour
                                  ? Image.asset(
                                      "assets/images/year_1.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/year_1_pressed.png",
                                      height: _appConfig.rHP(10),
                                      width: _appConfig.rWP(40),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Your Total Cost is " + rate,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Your Monthly Cost is " + mrate,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(pckglist, i),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.072,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 239, 215, 1),
                        Color.fromRGBO(241, 92, 0, 1),
                      ],
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
