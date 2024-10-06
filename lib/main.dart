import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starkeep/shared/constants/themes_id.dart';
import 'package:starkeep/shared/routes/custom_routes.dart';
import 'package:starkeep/shared/themes/custom_theme.dart';
import 'package:starkeep/shared/utils/init_hive.dart';
import 'package:theme_provider/theme_provider.dart';
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
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
          id: ThemesId.customLightTheme,
          data: CustomTheme.light(),
          description: "Custom light theme",
        ),
        AppTheme(
          id: ThemesId.customDarkTheme,
          data: CustomTheme.dark(),
          description: "Custom dark theme",
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => ToastificationWrapper(
            config:
                const ToastificationConfig(alignment: Alignment.bottomCenter),
            child: MaterialApp(
              title: 'Stark Notes',
              theme: ThemeProvider.themeOf(themeContext).data,
              onGenerateRoute: CustomRoutes.generateRoute,
              initialRoute: '/',
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      ),
    );
  }
}
