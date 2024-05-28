import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_wave/features/homepage/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final wordController = TextEditingController();
    String meaning = '';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 223, 243),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: wordController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10)),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 237, 223, 243),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          final String word = wordController.text;
                          bloc.add(SearchButtonClickEvent(word: word));
                          log(word);
                        },
                        icon: Icon(Icons.search))),
                SizedBox(width: 20),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is LoadingSucces) {
                      return Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 237, 223, 243),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {
                                bloc.add(
                                    PlayAudioEvent(audiopath: state.audio));
                              },
                              icon: Icon(Icons.speaker_phone)));
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is WordLoadingState) {
                return CircularProgressIndicator();
              }
              if (state is LoadingSucces) {
                meaning = state.meaning;
              }
              if (state is LoadingErrorstate) {
                meaning = "sorry mahn error vannu";
              }
              return Text(
                meaning,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
