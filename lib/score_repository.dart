import 'dart:math';

abstract class ScoreRepositoryInterface {
  Future<int> getScore();
}

class ScoreRepository implements ScoreRepositoryInterface {
  @override
  Future<int> getScore() async {
    await Future.delayed(const Duration(seconds: 1)); // 等待 1 秒，模擬網路延遲
    var rand = Random();
    var score = rand.nextInt(100);
    return score;
  }
}
