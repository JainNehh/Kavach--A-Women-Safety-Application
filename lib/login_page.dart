
import 'package:kavach/HomePage.dart';

import 'Sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'after_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  var email;
  var pass;

  @override

  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Color(0xFFCDAEE7),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.78,
            // color: Colors.white,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(6.0, 6.0))
              ],
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(6.0, 6.0))
                      ],
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/women.gif"),
                    ),
                  ),
                  //  textfields
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Row(
                            children: [
                              Text(
                                "Email",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          controller: _email,
                          style: TextStyle(color: Color(0xEC460386)),
                          decoration: const InputDecoration(
                              hintText: "Enter Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFFECAEEC),
                                  width: 2,
                                ),
                              ),
                              // labelText: " UserName" ,
                              // icon: Icon(Icons.person,size: 30,),
                              // iconColor: Colors.black,

                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 30, left: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Row(
                            children: [
                              Text(
                                "Password",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        TextField(
                          controller: _pass,
                          obscuringCharacter: "•",
                          obscureText: true,
                          style: TextStyle(color: Color(0xEC460386)),
                          decoration: const InputDecoration(
                              hintText: "Enter password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Color(0xFFECAEEC),
                                  width: 2,
                                ),
                              ),
                              // labelText: " UserName" ,
                              // icon: Icon(Icons.person,size: 30,),
                              // iconColor: Colors.black,

                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text,
                                password: _pass.text).then((value)
                            {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage() ));

                            }).onError((error,stackTrace)
                            {
                              print(error);
                            });


                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                          },
                          style: ButtonStyle(
                              elevation:
                                  MaterialStateProperty.all<double>(10.0),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Color(0xF2333334)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xEC460386))),
                          child: Text("Login"),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              elevation:
                                  MaterialStateProperty.all<double>(10.0),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Color(0xF21F1F21)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xEC460386))),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign()));
                          },
                          child: Text("SignUp"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
