import 'package:flutter/material.dart';

import '../home_page/home_page_widget.dart';

class notification extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<notification> {
  int _counter = 0;
  late Future<getmsg> futureAlbum;

  void initState() {
    super.initState();
    //  getalbums();

    //  _model = createModel(context, () => HomePageModel());
    //getmsg();
    futureAlbum = featuredmessage();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Row(children: [
          Text(
            'Notifications',
            style: TextStyle(color: Colors.black),
          )
        ]),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
      ),
      body: Container(
        width: 400,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          FutureBuilder<getmsg>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("has data");
                return Text(
                  "* " + snapshot.data!.notification,
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xFFF15C00),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
