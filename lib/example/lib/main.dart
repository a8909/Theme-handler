import 'package:flutter/material.dart';
import 'package:theme_mode_manager/theme_mode_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Thus is important to call, it enables the application to bind before initialization.

  final themeHandler = ThemeModeHandler();
  await themeHandler.themeModeInit(); // Load saved theme before running the app

  runApp(MyApp(themeHandler: themeHandler));
}

class MyApp extends StatelessWidget {
  final ThemeModeHandler themeHandler;

  const MyApp({super.key, required this.themeHandler});

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: themeHandler,
      builder: (context, _) {
        return MaterialApp(
          title: 'Theme Mode Manager Example',
          debugShowCheckedModeBanner: false,
          themeMode: themeHandler.loadedTheme,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
          ),
          home: HomePage(themeHandler: themeHandler),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final ThemeModeHandler themeHandler;

  const HomePage({super.key, required this.themeHandler});

  @override
  Widget build(BuildContext context) {
    final mode = themeHandler.loadedTheme;

    void systemMode() {
      themeHandler.setThemeMode(ThemeMode.system);
    }

    void lightDark(ThemeMode mode) {
      themeHandler.setThemeMode(mode);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Manager Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Theme: ${mode.name}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.dark_mode),
              label: Text(
                (mode == ThemeMode.system || mode == ThemeMode.light)
                    ? 'Switch to Dark Mode'
                    : 'Switch to Light Mode',
              ),
              onPressed: () => lightDark(
                (mode == ThemeMode.system || mode == ThemeMode.light)
                    ? ThemeMode.dark
                    : ThemeMode.light,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings_system_daydream),
              label: const Text('Set to System Theme'),
              onPressed: systemMode,
            ),
          ],
        ),
      ),
    );
  }
}
