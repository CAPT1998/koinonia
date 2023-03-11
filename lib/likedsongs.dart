import 'dart:convert';

import 'package:koinonia/likedsongs.dart';
import '../ministers/ministers_widget.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../model/musics.dart';
//import 'albums_model.dart';
//export 'albums_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'Api/Networkutils.dart';

class likedwidget extends StatefulWidget {
  const likedwidget({Key? key}) : super(key: key);

  @override
  _AlbumsWidgetState createState() => _AlbumsWidgetState();
}

class getuserlikedmusicApi {
  static Future<List<Musics>> getalluserlikedmusic(String userid) async {
    final url =
        Uri.parse('https://adminpanel.mediahype.site/API/getuserlikedmusic');
    final response = await http.post(url, body: {
      'user_id': userid,
    });

    if (response.statusCode == 200) {
      final List likedmusic = json.decode(response.body);

      return likedmusic.map((json) => Musics.fromJson(json)).toList();
    }
    throw Exception();
  }
}

class _AlbumsWidgetState extends State<likedwidget> {
  List<Musics> music = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  Future init1() async {
    final music = await getuserlikedmusicApi.getalluserlikedmusic('1');
    setState(() => this.music = music);
    print("hello world");

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void initState() {
    init1();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Widget buildAlbum(Musics music) => Container(
        child: GestureDetector(
          onTap: () {
            /*  
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MinistersWidget(
                  album.albumId,
                  album.albumName,
                  album.albumImage,
                  '',
                  album.isLiked,
                  "Album",
                ),
              ),
            );*/
          },
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.15, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.network(
                    // ignore: prefer_interpolation_to_compose_strings
                    "https://adminpanel.mediahype.site/" + music.musicImage,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        music.musicTitle,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      )),
                ),
              ),
              Container(
                  child: Text(
                music.albumName,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Urbanist',
                      color: Color(0xFFA7A7A7),
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
              ))
            ],
          ),
        ),
      );

  @override
  Widget build(
    BuildContext context,
  ) {
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
          onPressed: () => {Navigator.pop(context)},
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.2, 0),
          child: Text(
            'Liked Tracks',
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: music.length,
                itemBuilder: (context, index) {
                  final Musics = music[index];

                  return buildAlbum(Musics);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
