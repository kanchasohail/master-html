import 'package:flutter_bloc/flutter_bloc.dart';

class LearningCubit extends Cubit<LearningState> {
  LearningCubit() : super(LearningInitialState());
  bool isCardOpen = false;

  //This method will pop up the card
  void popUpCard() {
    if (!isCardOpen) {
      isCardOpen = true;
      emit(LearningCardPopupState());
    } else {
      isCardOpen = false;
      emit(LearningCardCloseState());
    }
  }
}

//These are the state classes of this cubit
abstract class LearningState {}

class LearningInitialState extends LearningState {}

class LearningCardPopupState extends LearningState {}

class LearningCardCloseState extends LearningState {}
