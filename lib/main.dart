import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'menu.dart';
import 'webCard.dart';
import 'androidCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.lightGreen,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.lightGreen,
        ),
        cardTheme: const CardTheme(
          shadowColor: Colors.lightGreen,
        ),
        tabBarTheme: const TabBarTheme(),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: groups.length,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                indicatorColor: Colors.white,
                isScrollable: true,
                tabs: [
                  for (final tab in groups) Tab(text: tab),
                ],
              ),
            ),
            body: GetPlatform.isWeb
                ? TabBarView(
                    children: List.generate(
                        groups.length,
                        (index) => WebCards(
                            products: menus
                                .where(
                                    (product) => product.group == groups[index])
                                .toList())),
                  )
                : TabBarView(
                    children: List.generate(
                        groups.length,
                        (index) => AndroidCards(
                            products: menus
                                .where(
                                    (product) => product.group == groups[index])
                                .toList())),
                  )),
      ),
    );
  }
}
