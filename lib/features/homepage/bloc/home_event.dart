part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class WordSeacrhEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SearchButtonClickEvent extends HomeEvent {
  final String word;
  const SearchButtonClickEvent({required this.word});
}

class PlayAudioEvent extends HomeEvent {
  final String audiopath;
  const PlayAudioEvent({required this.audiopath});
}
