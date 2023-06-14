import '../../base/base_viewmodel.dart';
import '../../models/music_model.dart';

class DetailMusicViewModel extends BaseViewModel {
  List<MusicModel> listDataMusic = [];

  @override
  void onInit() {
    fetchMusicAll();
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
        pathMusic: 'audio/booktok.mp3',
        isLoadSound: true));
    listDataMusic.add(MusicModel(
        id: 2,
        type: 1,
        title: 'The last best2',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'audio/Infinity.mp3',
        isLoadSound: false));
    listDataMusic.add(MusicModel(
        id: 3,
        type: 1,
        title: 'The last best3',
        description: 'MUSIC',
        time: '3.30',
        author: 'jack',
        imageUrl: 'assets/images/unsplash_2.png',
        pathMusic: 'audio/waveform.mp3',
        isLoadSound: false));
    notifyListeners();
  }
}
