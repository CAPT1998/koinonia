import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

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
import '../model/categorymusicmodel.dart';
import '../model/musics.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class categorymusic extends StatefulWidget {
  final String catid;
  final String catname;
  categorymusic({Key? key, required this.catid, required this.catname})
      : super(key: key);

  @override
  _AlbumsWidgetState createState() => _AlbumsWidgetState();
}

class getAllMusicsApi {
  static Future<List<Categorymusicmodel>> getallalbums(String id) async {
    print("HElloworld");

    final url =
        Uri.parse('https://adminpanel.mediahype.site/API/getCategoryMusic');
    final response = await http.post(url, body: {
      'user_id': '1',
      'category_id': id,
    });

    if (response.statusCode == 200) {
      final List music = json.decode(response.body);
      final List artistinfo = json.decode(response.body);

      return music.map((json) => Categorymusicmodel.fromJson(json)).toList();
      //artistinfo.map((json) => Artists.fromJson(json)).toList();
    }
    throw Exception();
  }
}

class _AlbumsWidgetState extends State<categorymusic> {
  List<Categorymusicmodel> music = [];
  List<Artists> artistinfo = [];
  List allalbumimage = [];
  List allMusicsinfo = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List AllArtistsinfo = [];

  Future init1() async {
    final music = await getAllMusicsApi.getallalbums(widget.catid);
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
    Categorymusicmodel music,
  ) =>
      Container(
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
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://adminpanel.mediahype.site/" + music.musicImage,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                child: Align(
                  alignment: AlignmentDirectional(0, -0.15),
                  child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Text(
                        music.musicTitle,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                      )),
                ),
              ),
              Container(
                  child: Text(
                music.musicTitle,
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
            onPressed: () => Navigator.of(context).pop()),
        title: Align(
          alignment: AlignmentDirectional(-0.2, 0),
          child: Text(
            widget.catname + ' Music',
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
            Padding(
              padding: EdgeInsetsDirectional.all(8.0),
              child: Text(
                'Musics',
                textAlign: TextAlign.end,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: music.length,
                itemBuilder: (context, index) {
                  final Musics = music[index];

                  //final Artists = artistinfo[index];

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
