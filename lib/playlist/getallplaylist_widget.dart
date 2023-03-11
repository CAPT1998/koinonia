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
import 'playlist_model.dart';
export 'playlist_model.dart';

class getallPlaylistWidget extends StatefulWidget {
  const getallPlaylistWidget({Key? key}) : super(key: key);

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

class _PlaylistWidgetState extends State<getallPlaylistWidget> {
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void toast() {
    SnackBar(
      content: Text(
        'Name and image cannot be empty',
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
          child: Row(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://adminpanel.mediahype.site/uploads/movie/" +
                            model.userPlaylistImage,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            model.userPlaylistName,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          )),
                      Text(
                        model.musicCount.toString() + " songs",
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Urbanist',
                              color: Color(0xFFA7A7A7),
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  void addTx(XFile pickedImage) async {
    List<int> imageBytes = await pickedImage.readAsBytes();
    String baseimage = base64Encode(imageBytes);

    final entertitle = textcontroller.text;
    _formkey.currentState?.validate();
    if (entertitle.isEmpty) {
      return;
    }
    final url =
        Uri.parse('https://adminpanel.mediahype.site/API/createPlayList');
    final response = await http.post(url, body: {
      'user_id': '1',
      'user_playlist_name': entertitle,
      'user_playlist_image': baseimage,
    });
    if (response.statusCode == 200) {
      final List playlist1 = json.decode(response.body);
    }
    Navigator.of(context).pop();
    print(response.body);
  }

  void onpress() async {
    final ImagePicker _picker = ImagePicker();
    pickedImage = (await _picker.pickImage(source: ImageSource.gallery))!;

    addTx(pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Text('Add'),
        elevation: 12,
        backgroundColor: Color(0xFFF15C00),
        foregroundColor: Colors.white,
        onPressed: () => showModalBottomSheet(
          backgroundColor: Color(0xFFF15C00),
          isScrollControlled: true,
          context: context,
          builder: (ctx) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Create New Playlist',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        IconButton(
                          onPressed: () {
                            textcontroller.text.isEmpty ? toast() : onpress();
                          },
                          icon: Icon(
                            Icons.camera_enhance_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 65,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        autofocus: false,
                        scrollPadding: EdgeInsets.only(bottom: 40),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Write title here',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onEditingComplete: onpress,
                        onSaved: (_) => onpress(),
                        controller: textcontroller,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.2, 0),
          child: Text(
            'Your Playlists',
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
              child: ListView.builder(
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
