// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/cubit_question.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/states_question.dart';
import '../../../models/questions.dart';
import '../../../shared/constants/constants.dart';
import '../../score/score.dart';
import 'question_card/question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionCubit questionCubit = QuestionCubit.get(context);

        return SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Question ${questionCubit.numQuestion} of ${questionsList.length}",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.7, // Adjust the value as needed
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionCubit.pageController,
                  itemBuilder: (context, index) {
                    return QuestionCard(indexques: index);
                  },
                  itemCount: questionsList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    if (questionCubit.numQuestion > 1)
                      FloatingActionButton(
                        heroTag: 'Back',
                        onPressed: () {
                          if (questionCubit.numQuestion > 1) {
                            questionCubit.decreaseNumQuestion();
                          }
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    const Spacer(),
                    FloatingActionButton(
                      heroTag: 'Finish',
                      onPressed: () async {
                        if (questionCubit.numQuestion < questionsList.length) {
                          questionCubit.increaseNumQuestion();
                        } else {
                          await questionCubit.submitExam();

                          finish = true;
                          QuestionCubit.get(context).controller.onPause;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScoreScreen(
                                        scoreTest: score,
                                      )));
                        }
                      },
                      child: questionCubit.numQuestion != questionsList.length
                          ? const Icon(Icons.arrow_forward)
                          : const Text("Finish"),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
