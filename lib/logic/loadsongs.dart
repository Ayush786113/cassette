import 'package:on_audio_query/on_audio_query.dart';

class Utilities{
  void main() async{
    final OnAudioQuery _audioQuery = OnAudioQuery();

    List<SongModel> songs = await _audioQuery.querySongs(
        path: '/storage/emulated/0/Songs',
        ignoreCase: true,
        uriType: UriType.EXTERNAL,
    );
    songs.shuffle();
    print(songs.first.displayNameWOExt);
  }
}