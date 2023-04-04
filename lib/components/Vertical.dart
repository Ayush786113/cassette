import 'dart:typed_data';

import 'package:Cassette/components/Recent.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Vertical extends StatelessWidget {
  const Vertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final OnAudioQuery _audioQuery = OnAudioQuery();

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            "All Songs",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: FutureBuilder<List<SongModel>>(
              future: _audioQuery.querySongs(
                path: '/storage/emulated/0/Songs',
                ignoreCase: true,
                uriType: UriType.EXTERNAL,
              ),
              builder: (context, snapshot) {

                if(snapshot.data == null){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else if(snapshot.data!.isEmpty){
                  return const Center(
                    child: Text("No Audio Found!"),
                  );
                }

                snapshot.data!.shuffle();

                return GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                  ),
                  children: List.generate(
                    snapshot.data!.length,
                    (index) => Recent(
                      songModel: snapshot.data![index],
                    )
                )
              );
            },
            )
          )
        ],
      ),
    );
  }
}