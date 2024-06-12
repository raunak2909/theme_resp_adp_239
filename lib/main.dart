import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resp_adp_theme_239/login_view.dart';
import 'package:resp_adp_theme_239/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.watch<ThemeProvider>().toggleTheme ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      /* ThemeData(
        brightness: Brightness.dark,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 21),
            displaySmall: TextStyle(fontSize: 12),
          )
      ),*/
      theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 21),
            displaySmall: TextStyle(fontSize: 12),
          )),
      home: loginview(),
    );
  }
}
