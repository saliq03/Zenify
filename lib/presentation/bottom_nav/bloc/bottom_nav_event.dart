part of 'bottom_nav_bloc.dart';

class BottomNavEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class ChangeIndex extends BottomNavEvent{
  final int index;
  ChangeIndex({required this.index});

  @override
  List<Object?> get props => [index];
}
