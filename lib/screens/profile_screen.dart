import 'package:entrepreneurship_dictionary/screens/login_screen.dart';
import 'package:entrepreneurship_dictionary/utilities/authentication.dart';
import 'package:entrepreneurship_dictionary/utilities/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w400),
        title: const Text('Profile'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              user.photoURL != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 60,
                    )
                  : CircleAvatar(backgroundImage: NetworkImage(user.photoURL!)),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                user.displayName.toString(),
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                user.email.toString(),
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  await Authentication.signOut();
                  Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return LoginScreen();
                      },
                    ),
                    (_) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.bottomCenter,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
