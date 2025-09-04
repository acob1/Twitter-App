import 'package:flutter/material.dart';
import 'package:twitter_app/screens/welcome_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_app/utils/theme/theme_provider.dart';
import 'package:twitter_app/utils/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      darkTheme: appDarkTheme,
      themeMode: themeMode,
      home: WelcomeScreen(),
    );
  }
}
