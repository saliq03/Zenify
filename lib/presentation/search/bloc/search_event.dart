part of 'search_bloc.dart';

 class SearchEvent extends Equatable{
  @override
  List<Object?> get props => [];
 }
 class OnSearchChange extends SearchEvent{
  final String searchText;
  OnSearchChange({required this.searchText});

  @override
  List<Object?> get props => [searchText];
 }

