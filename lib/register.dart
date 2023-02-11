import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  static const Channel = MethodChannel("com.example.integration_tuya_flutter");

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
                            padding: const EdgeInsets.only(bottom: 20),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: const Color(0xFFDEDEDE),
                                filled: true,
                                hintText: 'Code',
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
                              onPressed: () {
                                _validateTuya();
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
                                'Send Code'.toUpperCase(),
                                style: const TextStyle(
                                  color: Color(0xFF00E1D4),
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
                                _registerTuya();
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
                                'Register'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black,
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

  Future<void> _validateTuya() async {
    final int validateData = await Channel.invokeMethod("validateData", <String, String>{
      "country_code": "55",
      "email": "gabrielcastromail@gmail.com"
    });
  }

  Future<void> _registerTuya() async {
    final int registerData = await Channel.invokeMethod("registerData", <String, String>{
      "country_code": "55",
      "email": "gabrielcastromail@gmail.com",
      "password": "123456",
      "code": "138665"
    });
  }
}
