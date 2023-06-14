import 'package:app_music_flutter/generated/l10n.dart';
import 'package:app_music_flutter/models/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../gen/assets.gen.dart';
import '../../base/base_page.dart';
import '../../components/item_album_widget.dart';
import '../../models/album_model.dart';
import '../home_viewmodel.dart';
import 'music_detail_viewmodel.dart';
import 'widget/item_music_widget.dart';

class DetailAlbumbScreen extends StatefulWidget {
  const DetailAlbumbScreen(
      {super.key, required this.model, required this.musicModel});

  final AlbumModel model;
  final MusicModel musicModel;

  @override
  State<DetailAlbumbScreen> createState() => _DetailAlbumbScreenState();
}

class _DetailAlbumbScreenState extends State<DetailAlbumbScreen>
    with MixinBasePage<HomeVM> {
  bool playing = true;
  bool isPlaying = false;
  Duration position = Duration.zero;
  final audioPlayer = AudioPlayer();
  late MusicModel musicModels = MusicModel();
  Duration duration = Duration.zero;
  @override
  void initState() {
    super.initState();


    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event ;
      });
    });

    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event ;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 29),
              child: Assets.icons.back.svg(),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 29),
              child: Assets.icons.search.svg(),
            )
          ],
          title: Text(
            S.of(context).txt_album,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        body: Stack(children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset("assets/images/bg.png", width: size.width),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                  child: SizedBox(
                    child: ItemAlbumb(model: widget.model),
                  )),
              const SizedBox(
                height: 22.0,
              ),
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Selector<DetailMusicViewModel, List<MusicModel>>(
                    selector: (_, vm) => vm.listDataMusic,
                    shouldRebuild: (data1, data2) => true,
                    builder: (_, value, __) {
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return ItemMusic(
                            model: value[index],
                            callBack: (MusicModel value) async {
                              musicModels = value;
                              playing = !playing;
                                isPlaying = false;
                                await audioPlayer
                                    .play(AssetSource(value.pathMusic ?? ""));
                              setState(() {});
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            width: MediaQuery.of(context).size.width,
            height: 60.0,
            bottom: 0.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: Container(
              height: 60.0,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(203, 197, 197, 0.51),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Image.asset(
                              musicModels.imageUrl ??
                                  "assets/images/unsplash_1.png",
                              fit: BoxFit.cover,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, top: 8.0, bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  musicModels.title ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(musicModels.author ?? ""),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Assets.icons.vtLets.svg(),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        IconButton(
                            onPressed: () {
                              if (isPlaying) {
                                isPlaying = false;
                                audioPlayer.resume();
                              } else {
                                isPlaying = true;
                                audioPlayer.pause();
                              }

                              setState(() {});
                            },
                            icon: isPlaying
                                ? Assets.icons.vtPlay.svg()
                                : Assets.icons.play.svg()),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 0),
                          child: Assets.icons.vtRight.svg(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
