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
import '../model/viewAlbum.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class homepagealbumwidget extends StatefulWidget {
  const homepagealbumwidget({Key? key}) : super(key: key);

  @override
  _homepagealbumwidgetState createState() => _homepagealbumwidgetState();
}

class getAllMusicsApi {
  static Future<List<Albummodel>> getallalbums() async {
    //print("HElloworld");

    final url = Uri.parse('https://adminpanel.mediahype.site/API/getAllAlbums');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List music = json.decode(response.body);
      final List artistinfo = json.decode(response.body);

      return music.map((json) => Albummodel.fromJson(json)).toList();
      //artistinfo.map((json) => Artists.fromJson(json)).toList();
    }
    throw Exception();
  }
}

class _homepagealbumwidgetState extends State {
  List<Albummodel> music = [];
  List<Artists> artistinfo = [];
  List allalbumimage = [];
  List allMusicsinfo = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List AllArtistsinfo = [];

  Future init1() async {
    final music = await getAllMusicsApi.getallalbums();
    setState(() => this.music = music);
    setState(() {
      this.artistinfo = artistinfo;
    });
    print("hello world");
    //  _model = createModel(context, () => AlbumsModel());

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

  Widget buildAlbum(
    Albummodel music,
  ) =>
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Container(
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
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      // ignore: prefer_interpolation_to_compose_strings
                      "https://adminpanel.mediahype.site/" + music.albumImage,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: AlignmentDirectional(0, -0.15),
                    child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                        child: Text(
                          music.albumartistname,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )),
                  ),
                ),
                Container(
                    child: Text(
                  music.albumName,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        color: Color(0xFFA7A7A7),
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                ))
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: music.length,
                itemBuilder: (context, index) {
                  final Musics = music[index];

                  //final Artists = artistinfo[index];

                  return buildAlbum(Musics);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
