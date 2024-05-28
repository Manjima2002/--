import 'dart:async';
import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<SearchButtonClickEvent>(searchandFindtheWord);
    on<PlayAudioEvent>(playaudio);
  }

  FutureOr<void> searchandFindtheWord(
      SearchButtonClickEvent event, Emitter<HomeState> emit) async {
    final word = event.word;
    List<String> Meanings = [""];
    String baseurl = "https://api.dictionaryapi.dev/api/v2/entries/en/$word";
    Dio dioclient = Dio();

    try {
      emit(WordLoadingState());
      final response = await dioclient.get(baseurl);

      if (response.statusCode == 200) {
        final meaning =
            response.data[0]["meanings"][0]['definitions'][0]['definition'];
        final audio = response.data[0]["phonetics"][0]["audio"];
        log(audio.toString());
        emit(LoadingSucces(meaning: meaning, audio: audio));
      }
    } catch (error) {
      emit(LoadingErrorstate());
      log(error.toString());
    }
  }

  FutureOr<void> playaudio(
      PlayAudioEvent event, Emitter<HomeState> emit) async {
    final player = AudioPlayer();
    try {
      await player.play(UrlSource(event.audiopath));
    } catch (e) {
      log(e.toString());
    }
  }
}
