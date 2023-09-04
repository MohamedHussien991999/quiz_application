import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/modules/exam/body/cubit_question/states_question.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../../../../models/questions.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';

class QuestionCubit extends Cubit<QuestionStates> {
  late CountdownController controller;
  QuestionCubit() : super(QuestionInitial()) {
    score = 0;
    controller = CountdownController(autoStart: true);
  }

  static QuestionCubit get(context) => BlocProvider.of(context);
  String selectedOption = '0';
  int numQuestion = 1;

  PageController pageController = PageController(initialPage: 0);
  void changeSelectedOption(int indexquestion, String? value) {
    questionsList[indexquestion].selectedAns = value ?? '$indexquestion';
    emit(ChangeChoiceState());
  }

  void increaseNumQuestion() {
    numQuestion++;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
    emit(ChangeNumQuestionState());
  }

  void decreaseNumQuestion() {
    numQuestion--;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
    emit(ChangeNumQuestionState());
  }

  Future<void> submitExam() async {
    for (int i = 0; i < questionsList.length; i++) {
      if (questionsList[i].selectedAns == questionsList[i].correctAns) {
        score++;
      }
    }
    CacheHelper.saveData(key: 'history_key', value: historyList);
    for (int i = 0; i < questionsList.length; i++) {
      questionsList[i].selectedAns = "0";
    }
    emit(SubmitExamState());
  }

  Future<void> getData() async {
    historyList.clear();
    historyList = CacheHelper.getData(key: 'history_key');
    emit(GetDataState());
  }

  Future<void> removeData() async {
    if (await CacheHelper.removeDate(key: 'history_key')) {
      historyList.clear();
      print("remove data");
      emit(GetDataState());
    }
  }
}
