import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/svg.dart';

import 'Home_screen.dart';


class ScoreScreen extends StatelessWidget {
  final int? finalScore;
  const ScoreScreen({Key? key, this.finalScore}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      backgroundColor: Color.fromARGB(0, 9, 31, 43), 
        elevation: 0,
        actions: [
         TextButton(onPressed: (){
          Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      );
         }, child: Text("Close"))
        ],
       
      ),

       body: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [(Color.fromARGB(255, 34, 236, 125)), Color.fromARGB(255, 11, 197, 63),]
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Hey,Manushi ",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
              Spacer(flex: 1),
              Text(
                "Your score is: $finalScore ",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.white),
              ),
              Spacer(),
              //Text(
                //"${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                //style: Theme.of(context)
                   // .textTheme
                    //.headline4
                   // .copyWith(color: kSecondaryColor),
              //),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    ));
  }
}