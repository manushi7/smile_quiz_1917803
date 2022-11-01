
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:smile_quiz/utils/constants.dart';



class Body extends StatefulWidget {
  const Body({
    required Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    //QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: [
              Container(
                width: double.infinity,
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF3F4768),width: 3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [

                  LayoutBuilder(
                    builder: (context,constraints) => Container(
                      width: constraints.maxWidth * 0.5,
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9 / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("60 sec"),
                            SvgPicture.asset("assets/clock.svg"),
                          ]
                        )
                        )
                        )
                ]
                        )
                        ),
            ]
                        )
          )
          ),
      ]
      );
                        }
}