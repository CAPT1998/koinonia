import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:koinonia/playlist/playlist_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../Api/Networkutils.dart';
import '../flutter_flow/flutter_flow_ad_banner.dart';
import '../flutter_flow/flutter_flow_audio_player.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class homepageplaylistwidget extends StatefulWidget {
  const homepageplaylistwidget({Key? key}) : super(key: key);

  @override
  _PlaylistWidgetState createState() => _PlaylistWidgetState();
}

class getAllplaylistsAPI {
  static Future<List<Getplaylistmodel>> getallplaylist() async {
    //print("HElloworld");

    final url = Uri.parse('https://adminpanel.mediahype.site/API/getPlaylists');
    final response = await http.post(url, body: {
      'user_id': '1',
    });

    if (response.statusCode == 200) {
      final List playlist = json.decode(response.body);
      final List artistinfo = json.decode(response.body);

      return playlist.map((json) => Getplaylistmodel.fromJson(json)).toList();
      //artistinfo.map((json) => Artists.fromJson(json)).toList();
    }
    throw Exception();
  }
}

class _PlaylistWidgetState extends State<homepageplaylistwidget> {
  List<Getplaylistmodel> playlist = [];
  final textcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late Networkutils networkutils;
  late XFile pickedImage;

  @override
  void initState() {
    super.initState();
    init1();
    networkutils = Networkutils();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  Future init1() async {
    final playlist = await getAllplaylistsAPI.getallplaylist();
    setState(() => this.playlist = playlist);
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Widget buildAlbum(Getplaylistmodel model) => Container(
        child: GestureDetector(
          onTap: () {
            print("pressed");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaylistWidget(
                  model.imagesslist,
                  model.userPlaylistName,
                  model.userPlaylistId,
                ),
              ),
            );
          },
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://adminpanel.mediahype.site/uploads/movie/" +
                            model.userPlaylistImage,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        model.userPlaylistName,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      )),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: playlist.length,
                itemBuilder: (context, index) {
                  final playlist1 = playlist[index];

                  return buildAlbum(playlist1);
                },
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
