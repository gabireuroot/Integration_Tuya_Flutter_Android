import 'package:flutter/material.dart';

class ControlLightScreen extends StatefulWidget {
  const ControlLightScreen({Key? key}) : super(key: key);

  @override
  State<ControlLightScreen> createState() => _ControlLightScreenState();
}

class _ControlLightScreenState extends State<ControlLightScreen> {

  bool light = false;
  double _currentSliderValue = 20;
  List<String> listScene = <String>['Room', 'Living Room', 'Kitchen'];
  List<String> listWorkMode = <String>['Low', 'Fast'];

  @override
  Widget build(BuildContext context) {

    String dropdownSceneValue = listScene.first;
    String dropdownWorkModeValue = listWorkMode.first;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 48,
              bottom: 48,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // children: [
                    child: Image.network(
                      "https://d7qztf2ityad6.cloudfront.net/71282/71282_pictures_product_front_1.png?f=RM1920",
                      width: 160,
                    ),
                  // ],
                ),
                const Divider(
                  height: 50,
                ),
                RichText(
                  text: const TextSpan(
                      text: "Device: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: "Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
                const Divider(height: 30,),
                Row(
                  children: [
                    const Text(
                      "Bulb Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Switch(
                      value: light,
                      activeColor: const Color(0xFF00E1D4),
                      activeTrackColor: const Color(0xFF00E1D4),
                      inactiveTrackColor: Colors.grey,
                      onChanged: (isOn) {
                        setState(() {
                          light = isOn;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(height: 30,),
                Row(
                  children: [
                    const Text(
                      "Adjust Brightness",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 5,
                      activeColor: const Color(0xFF00E1D4),
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Set Scene",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: DropdownButton<String>(
                          value: dropdownSceneValue,
                          dropdownColor: Colors.black,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFF00E1D4)),
                          underline: Container(
                            height: 1,
                            color: const Color(0xFF00E1D4),
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownSceneValue = value!;
                            });
                          },
                          items: listScene.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                  ],
                ),
                const Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Set Work Mode",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: DropdownButton<String>(
                          value: dropdownWorkModeValue,
                          dropdownColor: Colors.black,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFF00E1D4)),
                          underline: Container(
                            height: 1,
                            color: const Color(0xFF00E1D4),
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownWorkModeValue = value!;
                            });
                          },
                          items: listWorkMode.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
