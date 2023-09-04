// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_application/models/history.dart';
import 'package:quiz_application/modules/welcome/welcome_screen.dart';
import '../../models/questions.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/local/cache_helper.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key, required this.scoreTest});
  final int scoreTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "$scoreTest/${questionsList.length}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: InkWell(
                  onTap: () async {
                    historyList.add(
                        History(nameUser, checkPass(scoreTest), scoreTest));

                    await CacheHelper.saveData(
                        key: 'history_key', value: historyList);
                    nameUser = "";
                    score = 0;
                    historyList = [];
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                    child: Text(
                      "Finish",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  bool checkPass(int score) {
    if (score >= questionsList.length / 2) {
      return true;
    }
    return false;
  }
}
