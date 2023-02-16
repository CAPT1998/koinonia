import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'playing_model.dart';
export 'playing_model.dart';

class PlayingWidget extends StatefulWidget {
  const PlayingWidget({Key? key}) : super(key: key);

  @override
  _PlayingWidgetState createState() => _PlayingWidgetState();
}

class _PlayingWidgetState extends State<PlayingWidget> {
  late PlayingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => context.go('/library'),
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.3, 0),
              child: Text(
                'Played From',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF150734),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.3, 0),
              child: Text(
                'Lorem Epsum Album',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      //resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: FlutterFlowAdBanner(
                            width: MediaQuery.of(context).size.width,
                            height: 179,
                            showsTestAd: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 568.3,
                    height: 556.9,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.asset(
                          'assets/images/Group_8_Copy_(1).png',
                        ).image,
                      ),
                    ),
                    child: Stack(
                      children: [
                        ListView(
                          children: [
                            CarouselSlider(
                              items: [
                                //1st Image of Slider
                                Container(
                                  width: 151,
                                  height: 151,
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.ytimg.com/vi/esfTzCkJGlY/maxresdefault.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //2nd Image of Slider
                                Container(
                                  width: 151,
                                  height: 151,
                                  margin: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTg1ODQ2NjYxNzQ0OTYwNjQx/popular-english-songs-top-300-best-songs-of-all-time.webp"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                //3rd Image of Slider
                                Container(
                                  width: 151,
                                  height: 151,
                                  margin: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.0),
                                    image: DecorationImage(
                                      image: Image.asset(
                                        'assets/images/455ae48a81e56c1d908f971b50d0f823.png',
                                      ).image,
                                    ),
                                  ),
                                ),

                                //4th Image of Slider

                                //5th Image of Slider
                              ],

                              //Slider Container properties
                              options: CarouselOptions(
                                height: 180.0,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                viewportFraction: 0.5,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.15, 0),
                                    child: Text(
                                      'Lorem epsum',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Lorem epsum',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Source Serif Pro',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: Icon(
                                    Icons.download_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    var snackBar = SnackBar(
                                      content: Text(
                                        'Download Started',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF15C00),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      shape: StadiumBorder(),
                                      width: 200,
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: Icon(
                                    Icons.repeat,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    var snackBar = SnackBar(
                                      content: Text(
                                        'Repeat song',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF15C00),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      shape: StadiumBorder(),
                                      width: 200,
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: Icon(
                                    Icons.list,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 30,
                                  icon: Icon(
                                    Icons.shuffle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    var snackBar = SnackBar(
                                      content: Text(
                                        'Shuffle songs',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFFF15C00),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      shape: StadiumBorder(),
                                      width: 200,
                                      duration: Duration(seconds: 1),
                                      behavior: SnackBarBehavior.floating,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                ),
                              ],
                            ),
                            Container(
                              width: 300,
                              height: 170,
                              child: custom_widgets.AudioPlayerWidget(
                                width: 300,
                                height: 100,
                              ),
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
        ),
      ),
    );
  }
}
