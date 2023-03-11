import 'dart:async';
//import 'package:image_network/image_network.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_screen_model.dart';
export 'search_screen_model.dart';
import 'dart:convert';
import 'package:koinonia/model/searchsongs.dart';
import 'package:http/http.dart' as http;

class SearchScreenWidget extends StatefulWidget {
  const SearchScreenWidget({Key? key}) : super(key: key);

  @override
  _SearchScreenWidgetState createState() => _SearchScreenWidgetState();
}

class SearchsongsApi {
  static Future<List<songs>> getBooks(String query) async {
    final url = Uri.parse('https://adminpanel.mediahype.site/API/getAllMusics');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List song = json.decode(response.body);

      return song.map((json) => songs.fromJson(json)).where((song) {
        final musictitleLower = song.musicTitle.toLowerCase();
        //final categoryNameLower = song.categoryId.toLowerCase();
        final albumnameLower = song.albumName.toLowerCase();

        final searchLower = query.toLowerCase();

        return musictitleLower.contains(searchLower) ||
            albumnameLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

class _SearchScreenWidgetState extends State<SearchScreenWidget> {
  //late SearchScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List<songs> song = [];

  String query = '';
  Timer? debouncer;

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        labelText: 'Enter search keyword',
        onChanged: searchBook,
      );
  Widget nothingfound() => Align(
        alignment: Alignment.center,
        child: Text('keyword could not be found',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(53, 111, 188, 0.34),
                fontFamily: "Urbanist",
                fontSize: 16,
                fontWeight: FontWeight.w700)),
      );

  Widget buildBook(songs song) => Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://adminpanel.mediahype.site/" + song.musicImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      song.musicTitle,
                      style: TextStyle(
                          //decoration: TextDecoration,
                          fontFamily: "Urbanist",
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 1.0),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    song.categoryName,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Open Sans',
                          color: Color(0xFF919191),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      );
  Future searchBook(String query) async => debounce(() async {
        final song = await SearchsongsApi.getBooks(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.song = song;
        });
      });
  Future init() async {
    final song = await SearchsongsApi.getBooks(query);

    setState(() => this.song = song);
  }

  void init1() async {
    final song = await SearchsongsApi.getBooks("");
    setState(() => this.song = song);
  }

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          title: Text(
            'Discover',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Urbanist',
                  color: Color(0xFF150734),
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
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
              buildSearch(),
              Expanded(
                child: ListView.builder(
                  itemCount: song.length,
                  itemBuilder: (context, index) {
                    final songs = song[index];

                    return (song.length == 0)
                        ? nothingfound()
                        : buildBook(songs);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String labelText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(
        color: Color.fromRGBO(53, 111, 188, 0.35),
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w500,
        fontSize: 12);
    final stylelabel = TextStyle(
        color: Color.fromRGBO(53, 111, 188, 0.35),
        fontFamily: "Urbanist",
        fontWeight: FontWeight.w500,
        fontSize: 12);
    final style = widget.text.isEmpty ? stylelabel : styleActive;

    return Container(
      height: 100,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,

          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFFF15C00),
          ),
          /*suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
              */
          hintText: widget.labelText,
          hintStyle: style,
          // border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
