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
import '../model/categorymodel.dart';
import '../model/musics.dart';
import '../model/viewAlbum.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

import '../model/viewArtist.dart';
import 'categorymusics.dart';

class homepagecategorywidget extends StatefulWidget {
  const homepagecategorywidget({Key? key}) : super(key: key);

  @override
  _homepagealbumwidgetState createState() => _homepagealbumwidgetState();
}

class getAllcategoryApi {
  static Future<List<Categorymodel>> getallalbums() async {
    //print("HElloworld");

    final url =
        Uri.parse('https://adminpanel.mediahype.site/API/getAllCategories');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List music = json.decode(response.body);

      return music.map((json) => Categorymodel.fromJson(json)).toList();
      //artistinfo.map((json) => Artists.fromJson(json)).toList();
    }
    throw Exception();
  }
}

class _homepagealbumwidgetState extends State {
  List<Categorymodel> category = [];
  List<Artists> artistinfo = [];
  List allalbumimage = [];
  List allMusicsinfo = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List AllArtistsinfo = [];
  List<String> images = [
    "assets/images/pop.png",
    "assets/images/rap.png",
    "assets/images/jazz.png",
    "assets/images/rock.png"
  ];
  Future init1() async {
    final category = await getAllcategoryApi.getallalbums();

    setState(() => this.category = category);
    setState(() {
      this.artistinfo = artistinfo;
    });
    print("hello world");
    //  _model = createModel(context, () => AlbumsModel());
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void initState() {
    init1();
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  Widget buildAlbum(Categorymodel music, int) => Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => categorymusic(
                      catid: music.categoryId, catname: music.categoryName),
                ),
              );
            },
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(images[int], width: 400)),
                ),
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
              child: GridView.builder(
                // padding: EdgeInsets.zero,
                shrinkWrap: true,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 0,

                  // mainAxisExtent: ,
                  mainAxisSpacing: 0,
                ),
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  final Musics = category[index];

                  //final Artists = artistinfo[index];

                  return buildAlbum(Musics, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
