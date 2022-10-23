import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/utils/AppScrollBehavior.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {

const AppState({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PageProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    CustomFluroRouter.configureRoutes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Landing page',
      initialRoute: '/about',
      onGenerateRoute: CustomFluroRouter.router.generator,
    );
  }
}