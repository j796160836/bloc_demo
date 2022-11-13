import 'package:bloc_demo/my_bloc.dart';
import 'package:bloc_demo/my_bloc_event.dart';
import 'package:bloc_demo/my_bloc_state.dart';
import 'package:bloc_demo/score_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class StubScoreRepository implements ScoreRepositoryInterface {
  int score;

  StubScoreRepository({required this.score});

  @override
  Future<int> getScore() async {
    return score;
  }
}

void main() {
  blocTest<MyBloc, MyBlocState>(
    'emits [SmileState] when GetScoringDataEvent is added',
    build: () {
      var scoreRepo = StubScoreRepository(score: 60);
      return MyBloc(scoreRepo: scoreRepo);
    },
    act: (cubit) => cubit.add(GetScoringDataEvent()),
    expect: () =>
        <TypeMatcher<MyBlocState>>[isA<InitState>(), isA<SmileState>()],
  );

  blocTest<MyBloc, MyBlocState>(
    'emits [CryingState] when GetScoringDataEvent is added',
    build: () {
      var scoreRepo = StubScoreRepository(score: 40);
      return MyBloc(scoreRepo: scoreRepo);
    },
    act: (cubit) => cubit.add(GetScoringDataEvent()),
    expect: () =>
        <TypeMatcher<MyBlocState>>[isA<InitState>(), isA<CryingState>()],
  );
}
