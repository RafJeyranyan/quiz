import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/core/consts/app_consts.dart';

import 'dummy_state.dart';

class DummyScreenCubit extends Cubit<DummyScreenState> {
  DummyScreenCubit()
      : super(const DummyScreenState(stage: DummyScreenStage.display)) {
    load();
  }

  load() async {


  }

}


