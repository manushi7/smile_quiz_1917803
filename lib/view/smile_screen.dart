
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:smile_quiz/controller/question_controller.dart';
import 'package:smile_quiz/utils/constants.dart';
import 'score_board.dart';


class SmileScreen extends StatefulWidget{
  const SmileScreen({super.key});

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      extendBodyBehindAppBar: true,
      appBar: AppBar(
      backgroundColor: Color.fromARGB(0, 9, 31, 43), 
        elevation: 0,
        actions: [
         TextButton(onPressed: (){
          Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoreScreen(),
                        )
                      );
         }, child: Text("Close"))
        ],
        
      ),
      body:  BodyPart( ),
      
    );
     
  }
}

class BodyPart extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      
      children: [
        Image.asset("assets\gradientorange.jpg", fit: BoxFit.fill),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ProgressBar(),
              Text.rich(
                TextSpan(
                  text: "Question 1",
                  style: Theme.of(context)
                  .textTheme
                  .headline4?.
                  copyWith(color:kSecondaryColor),
                  children: [
                    TextSpan(
                      text : "/....",
                      style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                        color: kSecondaryColor

                      ),
                      ),
                  ],
                  
                ),
                
              ),
               Divider(thickness: 1.5,),
               SizedBox(height: 16,),

               GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
               /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      ); */
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(Color.fromARGB(255, 26, 96, 248)), Color.fromARGB(255, 44, 196, 201)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "one",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),

             GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
               /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      ); */
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(Color.fromARGB(255, 26, 96, 248)), Color.fromARGB(255, 44, 196, 201)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "two",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),

             GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
               /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      ); */
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(Color.fromARGB(255, 26, 96, 248)), Color.fromARGB(255, 44, 196, 201)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "three",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
             GestureDetector(
              onTap: () {
                // Write Click Listener Code Here.
               /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )
                      ); */
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [(Color.fromARGB(255, 26, 96, 248)), Color.fromARGB(255, 44, 196, 201)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)
                    ),
                  ],
                ),
                child: Text(
                  "four",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
               /*Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 119, 64, 64),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: Column(
                  children: [
                    Text(
                      sample_data[0]['options'],
                     
                    ), */
                    
                     /* Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                      border: Border.all(color: kGrayColor),
                      borderRadius: BorderRadius.circular(15),
                      ),
                    child: Row(
                      children: [
                        Text("1. abc",
                        style: TextStyle(color: kGrayColor,fontSize: 16),
                        )
                        
                        ],
                    ) */
                    
                    //option(),
                    //option(),
                    //option(),
                    //option(),
      ]),))]); 


       //)] );
             
          //)
                       //)
     // ]
          
    //);
      
                        }}

class ProgressBar extends StatelessWidget {
   

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768), width: 3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: 
      GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return
          Stack(
            children: [
              // LayoutBuilder provide us the available space for the conatiner
              // constraints.maxWidth needed for our animation
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  // from 0 to 1 it takes 60s
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16 / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset("assets/icons/clock.svg"),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
  


// ignore: non_constant_identifier_names


