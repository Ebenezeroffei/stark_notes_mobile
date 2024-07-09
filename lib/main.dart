import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/routes/custom_routes.dart';
import 'package:starkeep/shared/themes/custom_theme.dart';
import 'package:starkeep/shared/utils/init_hive.dart';

void main() async {
  await Hive.initFlutter();
  await InitHive().call();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starkeep',
      theme: CustomTheme.light(),
      darkTheme: CustomTheme.dark(),
      themeMode: ThemeMode.light,
      onGenerateRoute: CustomRoutes.generateRoute,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
