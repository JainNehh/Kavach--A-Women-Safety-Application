import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kavach/ColorApp.dart';
import 'login_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class GoogleSignInDemo extends StatefulWidget {
  @override
  _GoogleSignInDemoState createState() => _GoogleSignInDemoState();
}

class _GoogleSignInDemoState extends State<GoogleSignInDemo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Widget> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print('Google Sign-Out and Firebase Sign-Out Successful');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
    } catch (e) {
      print('Error signing out: $e');
    }
    return SizedBox();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: scaffoldBackgroundColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height:250),
              IconButton(onPressed: (){handleSignOut();}, icon: Image.asset("assets/logout.png",fit: BoxFit.cover,height: 200,),iconSize: 150,),

              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('LOG OUT',
                      textStyle: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                      )),
                  WavyAnimatedText('YOU ARE SIGNING OUT',
                      textStyle: TextStyle(
                        color: Colors.green[600],
                        fontSize: 30,
                      )),
                ],
                repeatForever: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ],
          ),
        )
        );
    }
}
