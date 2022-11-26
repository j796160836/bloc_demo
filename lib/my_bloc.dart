import 'package:bloc_demo/my_bloc_event.dart';
import 'package:bloc_demo/my_bloc_state.dart';
import 'package:bloc_demo/score_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// bloc 寫法
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

// Cubit 寫法
class MyCubit extends Cubit<MyBlocState> {
  ScoreRepositoryInterface scoreRepo;

  MyCubit({required this.scoreRepo}) : super(InitState()) {}

  void getScoringData() {
    emit(InitState());
    scoreRepo.getScore().then((score) {
      if (score >= 60) {
        emit(SmileState());
      } else {
        emit(CryingState());
      }
    }).catchError((error) {
      emit(ErrorState(error));
    });
  }
}
