import 'package:app_music_flutter/models/album_model.dart';

import '../base/base_viewmodel.dart';
import '../models/music_model.dart';

class HomeVM extends BaseViewModel {
  List<AlbumModel> listDataAlbum = [];

  List<MusicModel> listDataMusic = [];
  @override
  void onInit() {
    fetchDataAlbum();
    fetchMusicAll();
  }

  Future<void> fetchDataAlbum() async {
    listDataAlbum.add(AlbumModel(
      id: 0,
      title: 'HIP HOP',
      description: 'MUSIC',
      imageUrl: 'assets/images/unsplash_PDX_a_82obo.png',
    ));
    listDataAlbum.add(AlbumModel(
      id: 1,
      title: 'BOLERO',
      description: 'MUSIC',
      imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png',
    ));
    listDataAlbum.add(AlbumModel(
        id: 3,
        title: 'BOLERO',
        description: 'MUSIC',
        imageUrl: 'assets/images/unsplash_mbGxz7pt0jM.png'));
    notifyListeners();
  }

  Future<void> fetchMusicAll() async {
    listDataMusic.clear();
    listDataMusic.add(MusicModel(
        id: 1,
        type: 0,
        title: 'The last best1',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'making_my_way.mp3',
        isLoadSound: true));
    listDataMusic.add(MusicModel(
        id: 2,
        type: 1,
        title: 'The last best2',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'Infinity.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 3,
        type: 1,
        title: 'The last best3',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 4,
        type: 1,
        title: 'The last best4',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 5,
        type: 0,
        title: 'The last best5',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 6,
        type: 0,
        title: 'The last best6',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 7,
        type: 0,
        title: 'The last best7',
        description: 'MUSIC',
        time: '30.3',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'waveform.mp3',
        isLoadSound: false));
    notifyListeners();
  }
}
