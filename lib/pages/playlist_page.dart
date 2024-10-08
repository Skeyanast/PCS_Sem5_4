import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcs5practice4/components/playlist_song_tile.dart';
import 'package:pcs5practice4/models/song.dart';
import 'dart:convert';

class PlaylistPage extends StatefulWidget {

  final String title;

  const PlaylistPage({super.key, required this.title});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {

  List<Song> songs = [];

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                  child: Text(widget.title)
              )
            )
          ]
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.02
            ),
            child: IconButton(
              onPressed: () => _showAddSongDialog(context),
              icon: Icon(
                Icons.add,
                size: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white
              ),
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02)
                ),
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              )
            ),
          )
        ],
        titleTextStyle: const TextStyle(
            fontSize: 24,
            color: Colors.black
        ),
      ),
      body: songs.isEmpty
      ? const Center(
          child: Text('Плейлист пуст...')
        )
      : ListView.builder(
          itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
            return PlaylistSongTile(
                playlistTitle: widget.title,
                song: songs[index],
                onSongDeleteAction: _removeSong
            );
          }
        ),
    );
  }

  void _showAddSongDialog(BuildContext context) {
    final songArtistController = TextEditingController();
    final songTitleController = TextEditingController();
    final songCoverImageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавление нового трека'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: songTitleController,
                style: const TextStyle(fontSize: 18.0),
                  decoration: const InputDecoration(
                  hintText: 'Название',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey
                  )
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextField(
                controller: songArtistController,
                style: const TextStyle(fontSize: 18.0),
                  decoration: const InputDecoration(
                  hintText: 'Исполнитель',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey
                  )
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              TextField(
                controller: songCoverImageUrlController,
                style: const TextStyle(fontSize: 18.0),
                  decoration: const InputDecoration(
                  hintText: 'Ссылка на обложку',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey
                  )
                )
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: (){
                String songTitle = songTitleController.text.trim();
                String songArtist = songArtistController.text.trim();
                String songCoverImageUrl = songCoverImageUrlController.text.trim();
                if (songTitle.isNotEmpty && songArtist.isNotEmpty && songCoverImageUrl.isNotEmpty) {
                  _addSong(Song(
                      id: songs[songs.length - 1].id + 1,
                      title: songTitle,
                      artist: songArtist,
                      coverPhotoUrl: songCoverImageUrl)
                  );
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Сохранить')
            ),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Отмена')
            )
          ],
        );
      }
    );
  }

  Future _loadSongs() async {
    final String response = await rootBundle.loadString('lib/data/songs_data.json');
    final List<dynamic> songList = json.decode(response);
    setState(() {
      songs = songList.map((item) => Song.fromJson(item)).toList();
    });
  }

  void _addSong(Song song) {
    setState(() {
      songs.add(song);
    });
  }

  void _removeSong(Song song) {
    setState(() {
      songs.remove(song);
    });
  }
}
