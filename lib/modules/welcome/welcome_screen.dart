import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/models/questions.dart';
import 'package:quiz_application/shared/constants/constants.dart';
import '../exam/body/cubit_question/cubit_question.dart';
import '../exam/body/cubit_question/states_question.dart';
import '../exam/exam.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit()..getData(),
      child: BlocConsumer<QuestionCubit, QuestionStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Color(0xFF222541)),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Center(
                              child: Text(
                                "Let's Play Quiz",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.001),
                            const Center(
                              child: Text(
                                "Enter your information's below",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter Your Name";
                                }
                                return null;
                              },
                              controller: TextEditingController(text: nameUser),
                              onChanged: (value) {
                                nameUser = value;
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey),
                                hintText: "Full Name",
                                fillColor: Color(0xFF3C3E62),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  score = 0;
                                  QuestionCubit.get(context)
                                      .controller
                                      .restart();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ExamPage(),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF46A0AE),
                                        Color(0xFF00FFCB)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    )),
                                child: Text(
                                  "Lets Start Quiz",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Previous Quiz Results",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, bottom: 25.0),
                                    child: IconButton(
                                      onPressed: () {
                                        QuestionCubit.get(context).removeData();
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 50.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: const Color(0xFF3C3E62),
                              ),
                              child: historyList.isNotEmpty
                                  ? ListView.separated(
                                      itemBuilder: (context, index) {
                                        final historyItem = historyList[index];
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: historyItem.pass
                                                  ? Colors.green
                                                  : Colors.red,
                                              child: Text('${index + 1}'),
                                            ),
                                            title:
                                                Text(historyList[index].name),
                                            textColor: Colors.white,
                                            trailing: Text(
                                              '${historyList[index].scoreQuestion}/${questionsList.length}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: historyList.length,
                                      separatorBuilder: (context, index) {
                                        return const Divider(
                                          color: Colors.grey,
                                          height: 20,
                                          indent: 20,
                                          endIndent: 20,
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: Text(
                                        "No Previous Quiz Results",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
