import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kavach/Home.dart';
import 'package:kavach/HomePage.dart';
import 'package:page_transition/page_transition.dart';
import 'login_page.dart';
import 'after_login.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}  var isLogin =false;

class _HomeState extends State<Home> {
  checkiflogin()async{

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user !=null && mounted)
      {
        setState(() {

          isLogin=true;

          // print(user.Username);

        });

      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    checkiflogin();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // download flutter pub add animated_splash_screen in terminal and import packages given above
      home: AnimatedSplashScreen(

        splashIconSize: 1000,
          duration: 3500,
          splash: Image.asset("assets/splash.gif",fit: BoxFit.cover,),
           // nextScreen: Sign(),
           nextScreen:   isLogin ?HomePage() : login(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          backgroundColor: Colors.transparent));

  }
}
