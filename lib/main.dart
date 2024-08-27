import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/providers/theme_mode_provider.dart';
import 'package:starkeep/shared/routes/custom_routes.dart';
import 'package:starkeep/shared/themes/custom_theme.dart';
import 'package:starkeep/shared/utils/init_hive.dart';
import 'package:toastification/toastification.dart';

void main() async {
  await Hive.initFlutter();
  await InitHive().call();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(providerOfThemeMode);

    return ToastificationWrapper(
      config: const ToastificationConfig(alignment: Alignment.bottomCenter),
      child: MaterialApp(
        title: 'Stark Notes',
        theme: CustomTheme.light(),
        darkTheme: CustomTheme.dark(),
        themeMode: themeMode,
        onGenerateRoute: CustomRoutes.generateRoute,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
