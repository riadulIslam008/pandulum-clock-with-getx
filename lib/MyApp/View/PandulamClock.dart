import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandulam_clock/MyApp/Controller/ClockController.dart';
import 'package:pandulam_clock/MyApp/View/Widgets/ClockUI.dart';
import 'package:pandulam_clock/MyApp/View/Widgets/PandulamUI.dart';

class PandulamClock extends StatelessWidget {
  final _top = Get.height / 2;
  final TextStyle _style = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202F41),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: _top),
              GetBuilder<ClockController>(
                init: ClockController(),
                builder: (controller) {
                  return Transform(
                    alignment: FractionalOffset(0.5, 0.0),
                    transform: Matrix4.rotationZ(controller.animation.value),
                    child: Center(
                      child: Container(
                        child: PandulamUI(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

//
// ─── THIS IS TIME SHOW SCETION  TRY TO COMMENT OUT THIS SCETION CZ UI IS NOT PERFECT
//
          Center(
            // top: Get.height / 2 - 73,
            // left: 83,
            child: CircleAvatar(
              backgroundColor: Color(0xFF202F41),
              radius: Get.width / 4 - 17,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text("12", style: _style),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    alignment: Alignment.centerRight,
                    child: Text("3", style: _style),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text("6", style: _style),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
                    child: Text("9", style: _style),
                  ),
                ],
              ),
            ),
          ),

          Center(
            child: Container(
              alignment: FractionalOffset(0.5, 0.5),
              child: GetBuilder<ClockController>(
                init: ClockController(),
                builder: (controller) {
                  return ClockUI();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
