import 'package:app_music_flutter/generated/l10n.dart';
import 'package:app_music_flutter/pages/detail/music_detail_viewmodel.dart';
import 'package:app_music_flutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'base/di/locator.dart';
import 'main_viewmodel.dart';

void main() {
  setUpInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainVM>(create: (_) => MainVM()),
        ChangeNotifierProvider<DetailMusicViewModel>(create: (_) => DetailMusicViewModel())
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'FULL API - RETROFIT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
            S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
           supportedLocales: S.delegate.supportedLocales,
        home: const HomePage(),
      ),
    );
  }
}
