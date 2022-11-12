import 'dart:async';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:smile_quiz/model/question_api_model.dart';
import 'package:smile_quiz/provider/question_api_provider.dart';
import 'package:smile_quiz/provider/score_provider.dart';
import 'package:smile_quiz/utils/constants.dart';
import '../utils/api_response.dart';
import 'Home_screen.dart';
import 'score_board.dart';

class SmileScreen extends StatefulWidget {
  const SmileScreen({super.key});

  @override
  State<SmileScreen> createState() => _SmileScreenState();
}

class _SmileScreenState extends State<SmileScreen> {
  @override
  void initState() {
    showQuestion();
    onTimer();
    super.initState();
  }
  ScoreProvider scoreProvider = ScoreProvider();
  static const maxSeconds = 90;
  int seconds = maxSeconds;
  QuestionApiProvider questionApiProvider = QuestionApiProvider();
  List<String> solutionIndex = ['a.', 'b.', 'c.', 'd.'];
  int solutionIndicator = -1;
  showQuestion() async {
    await questionApiProvider.getApiService();
  }
  void onTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds == 0) {
        timer.cancel();

        seconds = maxSeconds;

        scoreProvider.resetTotalScore();
        scoreProvider.setQuestionNum();


      } else {
        setState(() => seconds--);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: (seconds == 0)?null:
      AppBar(
        backgroundColor: Color.fromARGB(0, 9, 31, 43),
        elevation: 0,
        leading: Text("Score ${scoreProvider.totalScore}", style: TextStyle(color: Colors.black, fontSize: 17), ),
        actions: (seconds == 0)?null: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScoreScreen(finalScore: scoreProvider.totalScore,),
                    ));
              },
              child: Text("Close"))
        ],
      ),
      body: seconds == 0
          ? ScoreScreen(finalScore: scoreProvider.totalScore,):
              
            
      Stack (children: [
        SafeArea(
            child: Container(
          decoration: BoxDecoration(color: Colors.amber),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start,
                 children: [
              
              Text.rich(
                TextSpan(
                  text: "Question ",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: kSecondaryColor),
                ),
              ),
              Container(
                child: (seconds == 0) ? null : viewTime(),
              ),
              SizedBox(
                height: 20,
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
                      return Text(value.responseList?.message.toString() ?? '');
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
                                            .responseList?.data!.question
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
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: ListTile(
                                    leading: Text(
                                      solutionIndex[value.viewAnswer
                                          .indexOf(value.viewAnswer[index])],
                                      style: TextStyle(
                                          // color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                    onTap: () async {
                                      setState(() {
                                        solutionIndicator = value.viewAnswer
                                            .indexOf(value.viewAnswer[index]);
                                      });
                                      if (value.responseList?.data!.solution.toString()==
                                          value.viewAnswer[index].toString()) {
                                         
                                        scoreProvider.setTotalScore();
                                        scoreProvider.getQuestionNum();

                                        
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () async {
                                            await questionApiProvider
                                                .getApiService();

                                            setState(() {
                                              solutionIndicator = -1;
                                            });
                                          },
                                        );
                                      } else {
                                        Future.delayed(
                                          const Duration(seconds: 1),
                                          () async {
                                            await questionApiProvider
                                                .getApiService();

                                            setState(() {
                                              solutionIndicator = -1;
                                            });
                                          },
                                        );

                                        // pointViewModel
                                        //     .questionNum();
                                      }
                                    },
                                    title: Text(
                                      value.viewAnswer[index].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
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
            ]),
          ),
        ))
      ]),
      //BodyPart( ),
    );
  }
  Widget displayTime() {
    return FittedBox(
      child: Text(
        seconds.toString(),
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget viewTime() {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            color: Color.fromARGB(255, 5, 101, 41),
            value: seconds / maxSeconds,
            strokeWidth: 5,
          ),
          Center(
            child: displayTime(),
          )
        ],
      ),
    );
  }
}


