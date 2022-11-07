import 'dart:math';

abstract class ScoreRepository {
  Future<int> getScore();
}

class ScoreRepositoryImpl implements ScoreRepository {
  @override
  Future<int> getScore() async {
    await Future.delayed(const Duration(seconds: 1));
    var rand = Random();
    var score = rand.nextInt(100);
    return score;
  }
}
