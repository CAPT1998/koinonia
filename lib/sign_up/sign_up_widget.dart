import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:koinonia/Api/Networkutils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../home_page/home_page_widget.dart';
import '../model/users.dart';
import '../sign_in/sign_in_widget.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;
  String username = '';
  String lastname = '';
  String email = '';
  String password = '';
  late SharedPreferences sharedPreferences;
  late List<SignupUser> _future;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController1 = TextEditingController();
    _model.textController2 = TextEditingController();
    _model.textController3 = TextEditingController();
    _model.textController4 = TextEditingController();
    _model.textController5 = TextEditingController();
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
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: 425.6,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/imageedit_1_5849557343.png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.93, -0.84),
                  child: IconButton(
                    icon: new Image.asset(
                      'assets/images/Koinonia connect Logo 1.png',
                      width: 60,
                    ),
                    iconSize: 50,
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.70, -0.63),
                  child: Text(
                    ' Sign up - to save playlists, likes \n albums  and access this across \n different devices',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.81, -0.40),
                  child: Text(
                    'Hello, Sign In To Continue',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.92, 0.51),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0.35),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              controller: _model.textController1,
                              autofocus: false,
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              textCapitalization: TextCapitalization.none,
                              obscureText: !_model.passwordVisibility1,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Color(0x57FFFFFF),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility1 =
                                        !_model.passwordVisibility1,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility1
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.justify,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                              onSaved: (value) {
                                password = value!;
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.05, -0.25),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              onSaved: (value) {
                                username = value!;
                              },
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: _model.textController2,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Color(0x57FFFFFF),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.justify,
                              keyboardType: TextInputType.name,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.54, 0.90),
                          child: Text(
                            'Already have an account?  ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.32, 0.80),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Color(0xFFFF296D),
                              size: 30,
                            ),
                            showLoadingIndicator: true,
                            onPressed: () {
                              var snackBar = SnackBar(
                                content: Text(
                                  'Google account login',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.6, 0.80),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Color(0xFF0101FF),
                              size: 30,
                            ),
                            onPressed: () {
                              var snackBar = SnackBar(
                                content: Text(
                                  'Facebook  login',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.91, 0.80),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Color(0xFF4C78EF),
                              size: 30,
                            ),
                            onPressed: () {
                              var snackBar = SnackBar(
                                content: Text(
                                  'Twitter login',
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
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.7, 0.90),
                          child: FFButtonWidget(
                            onPressed: () => {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 300),
                                  pageBuilder:
                                      (ctx, animation, secondaryAnimation) =>
                                          SignInWidget(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return SlideTransition(
                                      position: new Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset.zero,
                                          end: const Offset(1.0, 0.0),
                                        ).animate(secondaryAnimation),
                                        child: child,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            },
                            text: 'Login',
                            options: FFButtonOptions(
                              width: 80,
                              height: 26,
                              color: Color(0xFFF15C00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.80, 0.80),
                          child: FFButtonWidget(
                            onPressed: () {
                              onpress();
                              print("signup pressed");
                            },
                            text: 'Sign Up',
                            options: FFButtonOptions(
                              width: 130,
                              height: 50,
                              color: Color(0xFFF15C00),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.05),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: _model.textController3,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Color(0x57FFFFFF),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.justify,
                              keyboardType: TextInputType.name,
                              validator: _model.textController3Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.15),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              onSaved: (value) {
                                email = value!;
                              },
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: _model.textController4,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Your Email',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Color(0x57FFFFFF),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.justify,
                              validator: _model.textController4Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.55),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: _model.textController5,
                              autofocus: false,
                              textCapitalization: TextCapitalization.none,
                              obscureText: !_model.passwordVisibility2,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Urbanist",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                filled: true,
                                fillColor: Color(0x57FFFFFF),
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility2 =
                                        !_model.passwordVisibility2,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility2
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF757575),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              textAlign: TextAlign.justify,
                              validator: _model.textController5Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onpress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();
    await Networkutils.postSignup(
      _model.textController4.text,
      _model.textController1.text,
      _model.textController2.text,
    ).then((value) {
      print(_model.textController4.text);
      print(_model.textController1.text);
      print(_model.textController2.text);

      setState(() {
        _future = value!;
      });
    });

    try {
      // ignore: unnecessary_null_comparison
      if (_future[0] == null) {
        print('object');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('check Your credetials!')));
        return;
      }
    } on RangeError catch (_) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User is Already Registered!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
    // MyData.myName = _future.result[0].userId;
    // MyData.myImage = _future.result[0].userProfilePic;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setBool("isfirst", false);
    // prefs.setString("name", _future.result[0].userId);
    //prefs.setString("email", _future.result[0].userEmail);
    //prefs.setString("username", _future.result[0].userName);
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (ctx, animation, secondaryAnimation) => SignInWidget(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: const Offset(1.0, 0.0),
              ).animate(secondaryAnimation),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
