import 'package:bloc_demo/my_bloc_event.dart';
import 'package:bloc_demo/my_bloc_state.dart';
import 'package:bloc_demo/score_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBloc extends Bloc<MyBlocEvent, MyBlocState> {
  ScoreRepositoryInterface scoreRepo;

  MyBloc({required this.scoreRepo}) : super(InitState()) {
    on<GetScoringDataEvent>((event, emit) async {
      emit(InitState());
      int score = await scoreRepo.getScore();
      if (score >= 60) {
        emit(SmileState());
      } else {
        emit(CryingState());
      }
    });
  }
}
