import 'package:app_music_flutter/gen/assets.gen.dart';
import 'package:app_music_flutter/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream/plugin.dart';

import '../base/base_page.dart';
import '../components/item_album_widget.dart';
import '../components/item_music.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinBasePage<HomeVM> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
                _scaffoldKey.currentState?.openEndDrawer();
              } else {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 29),
              child: Assets.icons.drawer.svg(),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 29),
              child: Assets.icons.search.svg(),
            )
          ],
          title:  Text(
             S.of(context).txt_top_album,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('123'),
              ),
              ListTile(
                title: const Text('2222'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: builder(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                  child: Text(
                    S.of(context).txt_album,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.listDataAlbum.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemAlbumb(
                          model: provider.listDataAlbum[index],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 8.0),
                  child: Text(
                    S.of(context).txt_recommended,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.listDataMusic.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemMusic(
                        model: provider.listDataMusic[index],
                      );
                    },
                  ),
                )
              ],
            )));
  }

  @override
  HomeVM create() => HomeVM();

  @override
  void initialise(BuildContext context) {}
}
