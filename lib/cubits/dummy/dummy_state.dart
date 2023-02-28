import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum DummyScreenStage {
  display,
  // error,
}

class DummyScreenState extends Equatable {
  final DummyScreenStage stage;
  final int bestScore;
  final int currentScore;
  final PageController controller;

  const DummyScreenState({
    required this.stage,
    required this.controller,
    this.bestScore = 0,
    this.currentScore = 0,
  });

  DummyScreenState copyWith({
    DummyScreenStage? stage,
    PageController? controller,
    int? bestScore,
    int? currentScore,
  }) {
    return DummyScreenState(
      stage: stage ?? this.stage,
      bestScore: bestScore ?? this.bestScore,
      controller: controller ?? this.controller,
      currentScore: currentScore ?? this.currentScore,
    );
  }

  @override
  List<Object?> get props => [
        stage,
        bestScore,
        currentScore,
      ];
}
