import 'package:flutter/material.dart';
import 'package:pcs5practice4/models/song.dart';
import 'package:pcs5practice4/pages/song_details_page.dart';
import 'package:pcs5practice4/constants.dart';

class PlaylistSongTile extends StatelessWidget {

  final String playlistTitle;
  final Song song;
  final void Function(Song) onSongDeleteAction;

  const PlaylistSongTile({super.key, required this.playlistTitle, required this.song, required this.onSongDeleteAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SongDetailsPage(playlistTitle: playlistTitle, song: song, onSongDelete: onSongDeleteAction);
          }));
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: _getSongCoverImage(context, song)
              ),
              Text(
                  song.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Text(
                  song.artist,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: Colors.grey[800]
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSongCoverImage(BuildContext context, Song song) {
    if (song.coverPhotoUrl.isNotEmpty) {
      return Image.network(
        song.coverPhotoUrl,
        height: MediaQuery.of(context).size.width * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover
      );
    }
    else {
      return Image.asset(
        kNoCoverImage,
        height: MediaQuery.of(context).size.width * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        fit: BoxFit.cover
      );
    }
  }
}