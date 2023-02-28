import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/core/consts/app_consts.dart';

import 'dummy_state.dart';

class DummyScreenCubit extends Cubit<DummyScreenState> {
  DummyScreenCubit()
      : super( DummyScreenState(
      stage: DummyScreenStage.display,
      controller: PageController())
  ) {
    load();
  }

  load() async {
   final sharedPrefs = await SharedPreferences.getInstance();
   final bestScore = sharedPrefs.getInt("bestScore") ?? 0;
   emit(state.copyWith(bestScore: bestScore));
  }

  setBest(int newResult) async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final ok = await sharedPrefs.setInt("bestScore", newResult);
    if(ok) {
      emit(state.copyWith(bestScore: newResult));
    }
}
  removeBest() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final ok = await sharedPrefs.setInt("bestScore", 0);
    if(ok) {
      emit(state.copyWith(bestScore: 0));
    }
}

  answerSelected(String selectedAnswer, String rightAnswer) async{
    if(selectedAnswer == rightAnswer){
      emit(state.copyWith(currentScore: state.currentScore + 1));
    }
    if(state.currentScore > state.bestScore){
      await setBest(state.currentScore);
    }
    state.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

}


