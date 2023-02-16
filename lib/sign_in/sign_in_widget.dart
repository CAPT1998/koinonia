import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_in_model.dart';
export 'sign_in_model.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late SignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInModel());

    _model.textController1 = TextEditingController();
    _model.textController2 = TextEditingController();
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
                fit: BoxFit.fill,
                image: Image.asset(
                  'assets/images/79696ac2eae0f3f18f77b6c86a9689a3_(1).png',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.85, -0.8),
                  child: FFButtonWidget(
                    onPressed: () => context.go('/homePage'),
                    text: 'Skip',
                    options: FFButtonOptions(
                      width: 50,
                      height: 24,
                      color: Color(0xFFF15C00),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Urbanist',
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 0.2,
                                fontWeight: FontWeight.bold,
                                //lineHeight: 1.6,
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
                  alignment: AlignmentDirectional(-0.15, -0.8),
                  child: Text(
                    'get started immediately',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.90, -0.31),
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
                  alignment: AlignmentDirectional(-0.50, -0.1),
                  child: Text(
                    'The app experience is better\n when you sign in.',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.74, 0.06),
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
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0.38),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              controller: _model.textController1,
                              autofocus: false,
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              textCapitalization: TextCapitalization.none,
                              obscureText: false,
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
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0.19),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: TextFormField(
                              scrollPadding: EdgeInsets.only(bottom: 40),
                              controller: _model.textController2,
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
                              keyboardType: TextInputType.emailAddress,
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.50, 0.88),
                          child: Text(
                            'Don’t have an account?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.92, 0.61),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: CircleBorder(),
                              ),
                              unselectedWidgetColor: Color(0xFFF5F5F5),
                            ),
                            child: Checkbox(
                              value: _model.checkboxValue ??= true,
                              onChanged: (newValue) async {
                                setState(
                                    () => _model.checkboxValue = newValue!);
                              },
                              activeColor: Colors.white,
                              checkColor: Color(0xFFE11013),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.50, 0.58),
                          child: Text(
                            'By signing up, you agree to these Terms and Conditions.',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.41, 0.76),
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
                          alignment: AlignmentDirectional(0.73, 0.76),
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
                                  'Facebook login',
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
                          alignment: AlignmentDirectional(1.02, 0.76),
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
                          alignment: AlignmentDirectional(0.7, 0.89),
                          child: FFButtonWidget(
                            onPressed: () => context.go('/signUp'),
                            text: 'Sign up for free',
                            options: FFButtonOptions(
                              width: 117,
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
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.80, 0.49),
                          child: Text(
                            'Forgot Password',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Urbanist',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.85, 0.76),
                          child: FFButtonWidget(
                            onPressed: () {
                              var snackBar = SnackBar(
                                content: Text(
                                  'login successful',
                                  style: TextStyle(
                                    color: Color(0xFFF15C00),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: StadiumBorder(),
                                width: 200,
                                duration: Duration(microseconds: 1),
                                behavior: SnackBarBehavior.floating,
                                onVisible: () => context.go('/verifyEmail'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            text: 'Log in',
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
}
