part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class WordLoadingState extends HomeState {}

class LoadingSucces extends HomeState {
  final String meaning;
  final String audio;
  const LoadingSucces({required this.audio, required this.meaning});
}

class LoadingErrorstate extends HomeState {}
