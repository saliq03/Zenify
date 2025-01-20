import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState()) {
   on<ChangeIndex>(_changeIndex);
  }

  void _changeIndex(ChangeIndex event,Emitter<BottomNavState> emit){
    emit(state.copyWith(currentIndex: event.index));
  }
}
