import 'package:chat_application_flutter/custom_ui/custom_appbar.dart';
import 'package:chat_application_flutter/custom_ui/custom_button.dart';
import 'package:chat_application_flutter/custom_ui/custom_text_form_field.dart';
import 'package:chat_application_flutter/utils/color_utils.dart';
import 'package:chat_application_flutter/utils/navigator_utils.dart';
import 'package:chat_application_flutter/utils/page_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_application_flutter/constants/app_constants.dart';
import 'package:chat_application_flutter/constants/color_constants.dart';
import 'package:chat_application_flutter/providers/auth_provider.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'pages.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double _pageHeight;
  late double _pageWidth;
  bool _autoValidate = false;
  bool _isIcon = false;
  final _formGlobalKey = GlobalKey<FormState>();
  // late VerificationBloc _verificationBloc;
  // late Login _fpoUser;
  String _phone = "";
  bool isTextFiledFocus = false;
  bool isTextFiledChange = true;
  bool loggedIn = false;

  @override
  void initState() {
    //_verificationBloc = VerificationBloc();
    //_fpoUser = Login();
    super.initState();
  }

  @override
  void dispose() {
    // _verificationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageHeight = PageUtils.getPageHeight(context: context);
    _pageWidth = PageUtils.getPageWidth(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }

    return Scaffold(
        appBar: CustomAppBar(
          title: 'Login',
          fontSize: 20.0,
          titleColor: Colors.black,
          fontWeight: FontWeight.w500,
          backgroundColor: Color(0xffF5F5F5),
          statusBarColor: Color(0xffF5F5F5),
          showLeadingBackButton: true,
        ),
        body: Container(
          color: Color(0xffF5F5F5),
          width: _pageWidth,
          height: _pageHeight,
          child: Stack(children: [
            Positioned(
              child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerView(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0,10,35.0,35.0),
                    child: _inputForm(),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 2.0),
                    width: _pageWidth,
                    height: 70.0,
                    child: FlatButton(
                      //color: Color(0xffFFF3F8),
                      onPressed: () async {
                        bool isSuccess = await authProvider.handleSignIn('G');
                        if (isSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("assets/images/google.png"),
                            ),

                            Text('Google',
                                style: TextStyle(
                                    color: Color(0xff33363B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ))
                          ],
                        ),
                      ),
                      //textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color(0xff999A9D),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    //padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 2.0),
                    width: _pageWidth,
                    height: 70.0,
                    child: FlatButton(
                      //color: Color(0xffFFF3F8),
                      onPressed: () async {
                        bool isSuccess = await authProvider.handleSignIn('F');
                        if (isSuccess) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset("assets/images/facebook.png"),
                            ),

                            Text('Facebook',
                                style: TextStyle(
                                    color: Color(0xff33363B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ))
                          ],
                        ),
                      ),
                      //textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color(0xff999A9D),
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )

                ],
              ),
            )
          ]),
        ));
  }

  Widget _headerView() {
    return Center(
      child: Container(
        height: _pageHeight * .30,
        width: _pageWidth * .30,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
        ),
        alignment: Alignment.center,
        child: SizedBox(
          height: _pageHeight * .28,
          width: _pageWidth * .28,
          child: Image.asset(
            "assets/images/icon.png",
          ),
        ),

      ),
    );
  }

  Widget _inputForm() {
    return SingleChildScrollView(
      child: Container(
        //height: _pageHeight * 0.25,
        child: Form(
            key: _formGlobalKey,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  label: "Phone number/email",
                  //textEditingController: password,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter a Phone Number';
                    }
                    return null;
                  },
                  fontWeight: FontWeight.w400,
                  fillColor: Color(0xffF5F5F5),
                  onSaved: _onUserNameSaved,
                  textInputAction: TextInputAction.done,
                  borderRadius: 10,
                  //initialText: 'blehbleh',
                ),
                SizedBox(height: 15.0),
                CustomTextFormField(
                  label: "Password",
                  // textEditingController: password,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter a Password';
                    }
                    return null;
                  },
                  fillColor: Color(0xffF5F5F5),
                  fontWeight: FontWeight.w400,
                  onSaved: _onPasswordSaved,
                  isPasswordField: true,
                  textInputAction: TextInputAction.done,
                  borderRadius: 10,
                  //initialText: 'blehbleh',
                ),
                SizedBox(height: _pageHeight * .050),
                Container(
                    alignment: Alignment.center,
                    height: _pageHeight * .10,
                    child: _loginButton()
                    /*StreamBuilder<NetworkState>(
                      stream: _verificationBloc
                          .loginStreamController.networkStateListener,
                      initialData:
                      NetworkState(state: NetworkStateEnum.INITIAL),
                      builder: (context, snapshot) {
                        print(snapshot.data);
                        return _getStateDependentView(snapshot.data!);
                      }),*/
                    ),
              ],
            )),
      ),
    );
  }



 /* Widget _getStateDependentView(NetworkState authenticationState) {
    switch (authenticationState.state) {
      case NetworkStateEnum.INITIAL:
        return _loginButton();
      case NetworkStateEnum.LOADING:
        return CircularProgressIndicator();
      case NetworkStateEnum.ON_FAILURE:
        DialogUtils.showCustomDialog(
            context: context,
            errorMessage: authenticationState.message!,
            title: 'Error',
            buttonName: 'Close',
            onButtonPressed: () {
              NavigatorUtils.pop(context);
            });
        //_verificationBloc.loginStreamController.setInitialState();
        return _loginButton();
      case NetworkStateEnum.ON_SUCCESS:
        Future.delayed(Duration(microseconds: 100), () {
          _openHomePage();
        });
        break;
    }
    return Container();
  }
*/
  Widget _loginButton() {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          buttonName: 'Log in',
          textColor: Colors.white,
          fontWeight: FontWeight.w600,
          textSize: 16.0,
          onButtonPressed: _onLoginButtonPressed,
          backgroundColor: ColorUtils.SPLASH_BACKGROUND,
        ));
  }




  _onLoginButtonPressed() {
    /* _fpoUser.mobileNumber = _phone;
    if (_formGlobalKey.currentState!.validate()) {
      _formGlobalKey.currentState?.save();
      _verificationBloc.login(_fpoUser);
    }*/

    //NavigatorUtils.push(context, Homepage());

    setState(() {
      _autoValidate = true;
    });
  }

  _openHomePage() {
    // NavigatorUtils.pushAndRemoveUntil(context, BottomNavBarPage());
  }

  _onUserNameSaved(String username) => username = username;
  _onPasswordSaved(String password) => password = password;
}
