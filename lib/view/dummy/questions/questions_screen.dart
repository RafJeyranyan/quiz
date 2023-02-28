import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/custom_button.dart';
import 'package:test_work/core/style.dart';
import 'package:test_work/view/dummy/questions/questions.dart';
import 'package:test_work/view/dummy/questions/result_page.dart';

import '../../../core/custom_answer_botton.dart';
import '../../../cubits/dummy/dummy_cubit.dart';
import '../../../cubits/dummy/dummy_state.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DummyScreenCubit>(
        create: (_) => DummyScreenCubit(),
        child: BlocBuilder<DummyScreenCubit, DummyScreenState>(
          builder: (context, state) {
            switch (state.stage) {
              case DummyScreenStage.display:
                return SafeArea(
                  child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    backgroundColor: AppColors.greenBackGround,
                    body: PageView(
                      // physics: NeverScrollableScrollPhysics(),
                      controller: state.controller,
                      children: [
                        ...questions.map((e) => Questions(
                              questionText: e["questionText"] as String,
                              rightAnswer: e["rightAnswer"] as String,
                              answers: e["answers"] as List<String>,
                              image: e["image"] as String?,
                            )),
                        ResultPage()
                      ],
                    ),
                  ),
                );
            }
          },
        ));
  }
}

class Questions extends StatelessWidget {
  final String questionText;
  final String rightAnswer;
  final List<String> answers;
  final String? image;

  const Questions(
      {Key? key,
      required this.rightAnswer,
      required this.answers,
      required this.questionText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = context.read<DummyScreenCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16.0),
        child: Column(

          children: [
           SizedBox(
             height: size.height * 0.48,
             child: Column(
               children: [
                 if(image != null)
                   Container(
                     height: size.height * 0.3,
                     margin: EdgeInsets.only(bottom: 8.0),
                     child: Image.asset(image!),
                   ),

                 Container(
                   // height: size.height * 0.4,
                   padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
                   constraints: BoxConstraints(
                       maxHeight: size.height * 0.18
                   ),
                   decoration: BoxDecoration(
                       borderRadius: AppBorderRadius.defaultBorderRadius,
                       color: AppColors.content
                   ),
                   child: SingleChildScrollView(
                     child: Text(
                       questionText,
                       style: AppTextStyle.questionTitle,
                     ),
                   ),
                 ),
               ],
             ),
           ),

            // Spacer(),
            Container(

              constraints: BoxConstraints(
                // minHeight: size.height * 0.2,
                maxHeight: size.height * 0.55
              ),

              child: Column(
                children: [
                  CustomAnswerButton(onPressed: (){
                    cubit.answerSelected(answers[0], rightAnswer);
                  }, child: Text(answers[0],style: AppTextStyle.questionAnswers,)),
                  const SizedBox(height: 8,),
                  CustomAnswerButton(onPressed: (){
                    cubit.answerSelected(answers[1], rightAnswer);
                  }, child: Text(answers[1],style: AppTextStyle.questionAnswers,)),
                  const SizedBox(height: 8,),
                  CustomAnswerButton(onPressed: (){
                    cubit.answerSelected(answers[2], rightAnswer);
                  }, child: Text(answers[2],style: AppTextStyle.questionAnswers,)),
                  const SizedBox(height: 8,),
                  CustomAnswerButton(onPressed: (){
                    cubit.answerSelected(answers[3], rightAnswer);
                  }, child: Text(answers[3],style: AppTextStyle.questionAnswers,)),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
