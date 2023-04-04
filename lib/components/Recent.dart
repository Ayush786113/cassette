import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:just_audio/just_audio.dart';

class Recent extends StatefulWidget {
  Recent({Key? key, required this.songModel}) : super(key: key);

  final SongModel songModel;

  @override
  _RecentState createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  
  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          QueryArtworkWidget(
              artworkBorder: BorderRadius.circular(0),
              nullArtworkWidget: const Text("No Artwork Available!"), 
              errorBuilder: (p0, p1, p2) {
                return const Text("Error!");
              },
              artworkFit: BoxFit.cover,
              id: widget.songModel.id, 
              type: ArtworkType.AUDIO,
              format: ArtworkFormat.PNG,
              artworkHeight: 150,
              artworkWidth: 150,
            ),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Flexible(
                  child: Text(
                    widget.songModel.title,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ),
            ),
            IconButton(
              onPressed: () async {
                setState(
                  () {
                    isPlaying = !isPlaying;
                  }
                );
                await player.setFilePath(widget.songModel.data);
                if(isPlaying){
                  player.play();
                }
                else{
                  player.pause();
                }
              },
              icon: Icon(
                !isPlaying ? Icons.play_arrow : Icons.pause,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isPlaying = false;
                  player.stop();
                });
              },
              icon: const Icon(
                Icons.stop
              ),
            ),
          ],
        ),
      ],
    );
  }
}