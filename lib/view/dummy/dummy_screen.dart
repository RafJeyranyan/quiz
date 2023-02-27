import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/style.dart';

import '../../cubits/dummy/dummy_cubit.dart';
import '../../cubits/dummy/dummy_state.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DummyScreenCubit>(
        create: (_) => DummyScreenCubit(),
        child: BlocBuilder<DummyScreenCubit, DummyScreenState>(
          builder: (context, state) {
            switch (state.stage) {
              case DummyScreenStage.display:
                return DisplayDummyScreen();
            }
          },
        ));
  }
}

class DisplayDummyScreen extends StatelessWidget {
  const DisplayDummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: size.width * 0.7,
                  height: size.height * 0.2,
                  child: Image.asset(
                    "assets/icon/icon1.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16.0,),
                Text("Welcome to Sport Quiz",style: AppTextStyle.titleLarge,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
