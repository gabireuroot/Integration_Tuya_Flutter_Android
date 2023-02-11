import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integration_tuya_flutter/home.dart';
import 'package:integration_tuya_flutter/register.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Channel = MethodChannel("com.example.integration_tuya_flutter");
  bool isLogged = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://apprecs.org/gp/images/app-icons/300/85/com.tuya.smart.jpg',
                            width: 50,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 5),
                            child: Icon(Icons.add, color: Colors.white,),
                          ),
                          Image.network(
                            'https://houseasy.net/ms-icon-144x144.png',
                            width: 70,
                          ),
                        ],
                      )),
                  Container(
                    child: Column(
                      children: [
                         const Padding(
                           padding: EdgeInsets.only(bottom: 40),
                           child: Text(
                            'Login in your Tuya Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                        ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: const Color(0xFFDEDEDE),
                              filled: true,
                              hintText: 'Country Code',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: const Color(0xFFDEDEDE),
                              filled: true,
                              hintText: 'E-mail',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              fillColor: const Color(0xFFDEDEDE),
                              filled: true,
                              hintText: 'Password',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              bool logged = await _loginTuya();
                              if (logged) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  }),
                                );
                              } else {
                                print("retorno false");
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(Color(0xFF00E1D4)),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            child: Text(
                              'Login'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterScreen()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.transparent),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xFF00E1D4),
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              'Register'.toUpperCase(),
                              style: const TextStyle(
                                color: Color(0xFF00E1D4),
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _loginTuya() async {
    bool login = await Channel.invokeMethod("loginData", <String, String>{
      "country_code": "55",
      "email": "gabrielcastromail@gmail.com",
      "password": "123456"
    });

    return login;
  }

  // Future<bool> _isLogged() async {
  //   final bool logged = await Channel.setMethodCallHandler((call) => {
  //     call.arguments
  //   });
  //
  //   return logged;
  // }

}
