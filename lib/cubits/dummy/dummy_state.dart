import 'package:equatable/equatable.dart';


enum DummyScreenStage {
  display,
  // error,
}

class DummyScreenState extends Equatable {
  final DummyScreenStage stage;

  const DummyScreenState({required this.stage, });

  DummyScreenState copyWith({DummyScreenStage? stage,}) {
    return DummyScreenState(
      stage: stage ?? this.stage,
    );
  }

  @override
  List<Object?> get props => [stage, ];
}
