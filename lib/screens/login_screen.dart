import 'package:entrepreneurship_dictionary/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/authentication.dart';
import '../utilities/constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: kColorMainApp,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              kIconAppLogo,
              width: kSizeHeightAppIcon,
              height: kSizeWidthAppIcon,
              scale: 1,
            ),
            const Text(
              'Entrepreneurship',
              style: TextStyle(
                  fontSize: kFontSizeTitleText,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Dictionary',
              style: TextStyle(
                  fontSize: kFontSizeTitleText,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 35),
                _googleSignInButton(),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _googleSignInButton() {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            User? user = await Authentication.signInWithGoogle(context);

            if (user != null) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: user,),
                ),
              );
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(35, 8, 35, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Image(
                    image: AssetImage(kIconGoogleSignIn),
                    height: kSizeHeightIconGoogleSignIn),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 20,
                      color: kColorText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
