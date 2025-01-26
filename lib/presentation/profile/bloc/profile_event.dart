part of 'profile_bloc.dart';

class ProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class GetUser extends ProfileEvent{}
class FetchFavouriteSongs extends ProfileEvent{}
class RemoveFavouriteSong extends ProfileEvent{
  final int index;
  RemoveFavouriteSong({required this.index});
  @override
  List<Object?> get props => [index];
}
class LogoutUser extends ProfileEvent{
  final BuildContext context;
  LogoutUser({required this.context});
  @override
  List<Object?> get props => [context];
}