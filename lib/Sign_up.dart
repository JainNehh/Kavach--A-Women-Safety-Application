// Method to add google sign in option
// first make projecct on firebase and doo the whatever it wanst like json file or some dependencies
// then
// now add the dependencies of firebase also
// flutter pub add firebase_core
// flutter pub add firebase_auth
// after creating
// go to the
// Build -> Authentication -> sign in method -> enable the service you wwant (google)
// it asks for fingerprint
// for the fingerprint
// you have to run the command in terminal of your project
// commnad is:-
//  1) cd android
//   2)  ./gradlew signingReport
// now in this you get the SHA 1 and SHA 25 fingerprint copy and paste it to the firebase
// then
// now write the function:-
//
// googlelogin()async{
// print("google login method ");
// GoogleSignIn _googleSignIn= GoogleSignIn();
// try
// {
// var result =await _googleSignIn.signIn();
// if(result==null)
// {
// return;
// }
// final userdata=await result.authentication;
// final credential =GoogleAuthProvider.credential(
// accessToken: userdata.accessToken,idToken: userdata.idToken
// );
// var finalResult= await FirebaseAuth.instance.signInWithCredential(credential);
// print("result $result");
// print(result.displayName);
// print(result.email);
// print(result.photoUrl);
// }
// catch(error)
// {
// print(error);
// }
// }
// now call this fucntion in elevated buttonn
//
//
//
//
import 'package:kavach/HomePage.dart';

import 'after_login.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  void initState()
  {
    super.initState();
    Firebase.initializeApp();
  }
  googlelogin()async{
    print("google login method ");
    GoogleSignIn _googleSignIn= GoogleSignIn();
    try
        {
          var result =await _googleSignIn.signIn();
          if(result==null)
            {
              return;
            }
          final userdata=await result.authentication;
          final credential =GoogleAuthProvider.credential(
            accessToken: userdata.accessToken,idToken: userdata.idToken
          );
          var finalResult= await FirebaseAuth.instance.signInWithCredential(credential);
          print("result $result");
          print(result.displayName);
          print(result.email);
          print(result.photoUrl);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        }
        catch(error)
    {
print(error);
    }
  }
  void console()
  {

    print("Username: $_name.text");
    print("mobile: $_mobile.text");
    print("gender: $_gender.text");
    print("email: $_email.text");
    print("Password: $_pass.text");


  }
  TextEditingController _name=TextEditingController();
  TextEditingController _mobile=TextEditingController();
  TextEditingController _gender=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  String? name;
  int? mobile;
  String? gender;
  var email;
  var pass;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(onPressed: (){
        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
        //   }, icon: Icon(Icons.arrow_back_ios))
        // ),
        body: ListView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 40,
                    bottom:0,
                  ),
                  decoration: BoxDecoration(

                    boxShadow: [
                      BoxShadow(
                        color:Colors.transparent,
                        // blurRadius: 50.0,
                      )
                    ],
                    // border:Border.all(color:Colors.teal.shade800),

                    color:Colors.transparent,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0)),

                  ),

                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Padding(
                              padding: EdgeInsets.only(top:30.0),
                              child: Center(child: Text("SIGN UP",style: TextStyle(color:Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                              fontFamily: "cursive"),
                              )),
                            )),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top:30),
                            child: TextField(controller: _name,
                              style: TextStyle(
                                  color: Color(0xEC460386)),decoration: const InputDecoration(
                                hintText: "Enter Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color:Colors.black,
                                      width: 3,
                                    ),),
                                 focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color:Color(0xFFA34DEC),
                                      width: 3,
                                    ),),
                                  labelText: " UserName" ,
                                  icon: Icon(Icons.person,size: 30,),
                                  iconColor: Colors.black,

                                  labelStyle: TextStyle(color:Colors.black,fontSize: 20)


                              ),),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: TextField(controller: _mobile,
                            style: TextStyle(
                                color: Color(0xEC460386)),decoration: const InputDecoration(
                                hintText: "Enter MobileNumber",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFCCA5EE),
                                    width: 3,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFA34DEC),
                                    width: 3,
                                  ),),
                                labelText: " PhoneNumber" ,
                                icon: Icon(Icons.phone_android_outlined,size: 30,),
                                iconColor: Colors.black,

                                labelStyle: TextStyle(color:Colors.black,fontSize: 20)


                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: TextField(controller: _gender,
                            style: TextStyle(
                                color: Color(0xEC460386)),decoration: const InputDecoration(
                                hintText: "Enter Gender",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFCCA5EE),
                                    width: 3,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFA34DEC),
                                    width: 3,
                                  ),),
                                labelText: " Gender" ,
                                icon: Icon(Icons.accessibility,size: 30,),
                                iconColor: Colors.black,

                                labelStyle: TextStyle(color:Colors.black,fontSize: 20)


                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: TextField(controller: _email,
                            style: TextStyle(
                                color: Color(0xEC460386)),decoration: const InputDecoration(
                                hintText: "Enter E-mail",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFCCA5EE),
                                    width: 3,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFA34DEC),
                                    width: 3,
                                  ),),
                                labelText: " Email" ,
                                icon: Icon(Icons.mail,size: 30,),
                                iconColor: Colors.black,

                                labelStyle: TextStyle(color:Colors.black,fontSize: 20)


                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:20),
                          child: TextField(controller: _pass,
                            obscuringCharacter: "*",
                           obscureText: true,
                            style: TextStyle(
                                color: Color(0xEC460386)),decoration: const InputDecoration(
                                hintText: "Enter Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFCCA5EE),
                                    width: 3,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color:Color(0xFFA34DEC),
                                    width: 3,
                                  ),),
                                labelText: " PassWord" ,
                                icon: Icon(Icons.password_rounded,size: 30,),
                                iconColor: Colors.black,

                                labelStyle: TextStyle(color:Colors.black,fontSize: 20)


                            ),),
                        ),

                        Padding(
                            padding: EdgeInsets.only(top:40),
                            child: ElevatedButton(onPressed: (){
                              FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text,
                                  password: _pass.text).then((value)
                              {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Color(0xFFA34DEC),
                                    title: const Text('You Have Created Your Account\nPlease Login with it...',style: TextStyle(color:Colors.black),),
                                    content: const Text('ThankYou  :) ',style: TextStyle(color:Colors.limeAccent),),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }).onError((error,stackTrace)
                              {
                                print(error);
                              });
                            },
                                style: ButtonStyle(

                                  backgroundColor: MaterialStateProperty.all<Color>( Color(0xEC460386)),
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),



                                child: Text("Create Account"))),
                        Padding(
                            padding: EdgeInsets.only(top:10,left:10,bottom:50),
                            child:
                                ElevatedButton.icon(
                                  label: Text("Sign Up With Google",style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),),
                                  icon: Image.asset("assets/google.png",height: 40,),
                                  style: ButtonStyle(
                                 backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                                   // elevation: MaterialStateProperty.all<double>(10.0),
    ),

                                  onPressed: (){
                                    googlelogin();
                                  },)


                            )
                      ],
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
