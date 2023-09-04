// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/modules/exam/body/body.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/cubit_question.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/states_question.dart';
import 'package:quiz_application/modules/score/score.dart';
import 'package:quiz_application/shared/constants/constants.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(),
      child: BlocConsumer<QuestionCubit, QuestionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  Center(
                    child: Text('Time Remaining:  ',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: const Color(0xFF00FFCB),
                                  fontWeight: FontWeight.bold,
                                )),
                  ),
                  Center(
                    child: Countdown(
                      controller: QuestionCubit.get(context).controller,
                      seconds: 720,
                      build: (BuildContext context, double time) {
                        int minutes = (time / 60).floor();
                        int seconds = (time % 60).floor();
                        return Text(
                          '$minutes : $seconds',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: const Color(0xFF46A0AE),
                                fontWeight: FontWeight.bold,
                              ),
                        );
                      },
                      interval: const Duration(milliseconds: 100),
                      onFinished: () {
                        QuestionCubit.get(context).submitExam();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScoreScreen(
                                      scoreTest: score,
                                    )));
                      },
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: const Color(0xFF222541),
              elevation: 2,
            ),
            body: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Color(0xFF222541)),
                  ),
                  const SafeArea(
                    child: SingleChildScrollView(
                      child:
                          Padding(padding: EdgeInsets.all(10.0), child: Body()),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
