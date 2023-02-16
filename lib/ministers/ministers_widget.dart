import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ministers_model.dart';
export 'ministers_model.dart';

class MinistersWidget extends StatefulWidget {
  const MinistersWidget({Key? key}) : super(key: key);

  @override
  _MinistersWidgetState createState() => _MinistersWidgetState();
}

class _MinistersWidgetState extends State<MinistersWidget> {
  late MinistersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MinistersModel());

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
        automaticallyImplyLeading: false,
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
        title: Align(
          alignment: AlignmentDirectional(-0.2, 0),
          child: Text(
            'Ministers',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF090F13),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowAdBanner(
                width: MediaQuery.of(context).size.width,
                height: 50,
                showsTestAd: true,
              ),
              Container(
                width: 375,
                height: 375,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Group_8_Copy.png',
                    ).image,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.1, -0.4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(33),
                        child: Image.asset(
                          'assets/images/2500202bf5f45b615037091cf3c441db.png',
                          width: 110,
                          height: 126.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.95, 0.49),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Play',
                        options: FFButtonOptions(
                          width: 120,
                          height: 65,
                          color: Color(0xFFF15C00),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.89, 0.49),
                      child: Text(
                        'Lorem epsum',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.93, 0.66),
                      child: Text(
                        '12 Following',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.18, 0.67),
                      child: Text(
                        '232 Followers',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0.8, 0.95),
                        child: Text(
                          'Computer users and programmers have become so accustomed to using Windows, even for the changing capabilities and the appearances',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF909090),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 466.2,
                height: 304.7,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.92, -0.92),
                      child: Text(
                        'Top Tracks',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Align(
                        // alignment: AlignmentDirectional(0, 0),
                        child: GestureDetector(
                          onTap: () => context.go('/playing'),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 190.7,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.05, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 0, 0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            child: Image.network(
                                              'https://picsum.photos/seed/409/600',
                                              width: 60,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 30, 0, 0),
                                            child: Text(
                                              'Broken Heart',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            '212 Songs',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ],
                                      ),
                                      new Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.38,
                                                  0,
                                                  0,
                                                  0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: Color(0xFFF15C00),
                                              size: 25,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.05, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(22),
                                          child: Image.asset(
                                            'assets/images/d8fd7d55db13846c1ac81dd8306378da.png',
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Georgius',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            '29 Song',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Open Sans',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    new Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                            0,
                                            0,
                                            0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.play_arrow_rounded,
                                            color: Color(0xFFF15C00),
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
