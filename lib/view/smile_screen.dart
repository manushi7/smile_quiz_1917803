
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smile_quiz/controller/question_controller.dart';
import 'package:smile_quiz/model/question_api_model.dart';
import 'package:smile_quiz/provider/question_api_provider.dart';
import 'package:smile_quiz/utils/constants.dart';
import '../utils/api_response.dart';
import 'score_board.dart';


class SmileScreen extends StatefulWidget{
  const SmileScreen({super.key});

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  void initState() {
   showQuestion();
    // startTimer();
      super.initState();
  }
    QuestionApiProvider questionApiProvider = QuestionApiProvider();
  List<String> solutionIndex = ['a.', 'b.', 'c.', 'd.'];
  int solutionIndicator = -1;
showQuestion() async {
    await questionApiProvider.getApiService();
  }

  
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
      body:  Stack(
      
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
              ChangeNotifierProvider<QuestionApiProvider>(
                              create: (BuildContext context) => questionApiProvider,
                              child: Consumer<QuestionApiProvider>(
                                  builder: ((context, value, _) {
                                log(value.responseList!.data.toString(),
                                    name: "response list");
                                switch (value.responseList?.status) {
                                  case Status.loading:
                                    return const CircularProgressIndicator(); //

                                  case Status.error:
                                    return Text(value.responseList?.message
                                            .toString() ??
                                        '');
                                  case Status.completed:
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 250,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(value
                                                          .responseList
                                                          ?.data!
                                                          .question
                                                          .toString() ??
                                                      ""))),
                                        ),
SizedBox(
                                          height: 20,
                                        ),
                                        GridView.builder(
                                            shrinkWrap: true,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    childAspectRatio: 3,
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 15,
                                                    mainAxisSpacing: 30),
                                            itemCount: value.viewAnswer.length,
                                            itemBuilder:
                                                (BuildContext ctx, index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                    color:kSecondaryColor,
                                                       
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
child: ListTile(
                                                  leading: Text(
                                                    solutionIndex[value
                                                        .viewAnswer
                                                        .indexOf(
                                                            value.viewAnswer[
                                                                index])],
                                                    style: TextStyle(
                                                        // color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15),
                                                  ),
                                                  onTap: () async {
                                                    setState(() {
                                                      solutionIndicator = value
                                                          .viewAnswer
                                                          .indexOf(
                                                              value.viewAnswer[
                                                                  index]);
                                                    });
if (value.responseList
                                                            ?.data!.solution ==
                                                        value.viewAnswer[index]
                                                            .toString()) {
                                                      // pointViewModel
                                                      //     .totalScore();

                                                      // log("${pointViewModel.score}",
                                                      //     name: "score value");

                                                      // pointViewModel
                                                      //     .questionNum();

                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 1),
                                                        () async {
                                                          await questionApiProvider
                                                              .getApiService();

                                                          setState(() {
                                                            solutionIndicator =
                                                                -1;
                                                          });
                                                        },
                                                      );
                                                    } else {
Future.delayed(
                                                        const Duration(
                                                            seconds: 1),
                                                        () async {
                                                          await questionApiProvider
                                                              .getApiService();

                                                          setState(() {
                                                            solutionIndicator =
                                                                -1;
                                                          });
                                                        },
                                                      );

                                                      // pointViewModel
                                                      //     .questionNum();
                                                    }
                                                  },
                                                  title: Text(
                                                    value.viewAnswer[index]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              );
                                            }),
],
                                    );
                                  default:
                                    Container();
                                }
                                return Container();
                              })),
                            )


             

             

      ]),))]),
      //BodyPart( ),
      
    );
     
  }
}


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
      child: Center(
        child: LinearProgressIndicator(),
      )
    );
      // GetBuilder<QuestionController>(
      //   init: QuestionController(),
      //   builder: (controller) {
      //     return
      //     Stack(
      //       children: [
      //         // LayoutBuilder provide us the available space for the conatiner
      //         // constraints.maxWidth needed for our animation
      //         LayoutBuilder(
      //           builder: (context, constraints) => Container(
      //             // from 0 to 1 it takes 60s
      //             width: constraints.maxWidth * controller.animation.value,
      //             decoration: BoxDecoration(
      //               gradient: kPrimaryGradient,
      //               borderRadius: BorderRadius.circular(50),
      //             ),
      //           ),
      //         ),
      //         Positioned.fill(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(
      //                 horizontal: 16 / 2),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text("${(controller.animation.value * 60).round()} sec"),
      //                 SvgPicture.asset("assets/icons/clock.svg"),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     );
      //   },
      // ),
    //);
  }
}
  


// ignore: non_constant_identifier_names


