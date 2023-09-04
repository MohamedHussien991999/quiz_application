import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/cubit_question.dart';
import '../../../../models/questions.dart';
import '../../../../shared/constants/constants.dart';
import '../cubit_question/states_question.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.indexques,
  });

  final int indexques;

  @override
  Widget build(context) {
    return BlocConsumer<QuestionCubit, QuestionStates>(
      listener: (context, state) {},
      builder: (context, state) {
        QuestionCubit cubit = QuestionCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      questionsList[indexques].question,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: kBlackColor),
                    ),
                    const SizedBox(height: 40),
                    ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: kDefaultPadding,
                            ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: questionsList[indexques].options.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    cubit.changeSelectedOption(
                                      indexques,
                                      questionsList[indexques].options[index],
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(
                                        10), // Add padding around the radio button
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Change the background color
                                      borderRadius: BorderRadius.circular(
                                          50), // Add rounded corners
                                    ),
                                    child: Row(
                                      children: [
                                        Radio<String>(
                                          value: questionsList[indexques]
                                              .options[index],
                                          groupValue: questionsList[indexques]
                                              .selectedAns,
                                          onChanged: (String? value) {
                                            cubit.changeSelectedOption(
                                                indexques, value);
                                          },
                                        ),
                                        Expanded(
                                          child: Text(
                                            questionsList[indexques]
                                                .options[index],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
