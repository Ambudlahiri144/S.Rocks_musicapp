// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. Import Firebase Core and your options file
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/dependency_injection.dart';
import 'ui/viewmodels/home_viewmodel.dart';
import 'ui/views/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// 2. Make the main function 'async'
void main() async {
  // 3. Ensure Flutter is ready before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // 4. THIS IS THE CORRECT PLACE to initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Your other setup code remains the same
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    final TextTheme syneTextTheme = GoogleFonts.syneTextTheme(theme.textTheme);
    return ChangeNotifierProvider(
      create: (context) => getIt<HomeViewModel>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'S.Rocks.Music',
        theme: theme.copyWith(
          // primarySwatch: Colors.pink,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF1a001a),
          // MODIFIED: Apply letterSpacing to specific text styles within the Syne theme
          textTheme: syneTextTheme.copyWith(
            // For body text (normal text, descriptions, etc.)
            bodyLarge: syneTextTheme.bodyLarge
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            bodyMedium: syneTextTheme.bodyMedium
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            bodySmall: syneTextTheme.bodySmall
                ?.copyWith(letterSpacing: 0.4, color: Colors.white70),

            // For display text (headlines, titles, etc.)
            displayLarge: syneTextTheme.displayLarge
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            displayMedium: syneTextTheme.displayMedium
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            displaySmall: syneTextTheme.displaySmall
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),

            headlineLarge: syneTextTheme.headlineLarge
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            headlineMedium: syneTextTheme.headlineMedium
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            headlineSmall: syneTextTheme.headlineSmall?.copyWith(
                letterSpacing: 0.5,
                color: Colors.white), // Often used for AppBar titles

            titleLarge: syneTextTheme.titleLarge?.copyWith(
                letterSpacing: 0.5,
                color: Colors.white), // Often used for ListTile titles
            titleMedium: syneTextTheme.titleMedium
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),
            titleSmall: syneTextTheme.titleSmall
                ?.copyWith(letterSpacing: 0.5, color: Colors.white),

            labelLarge: syneTextTheme.labelLarge?.copyWith(
                letterSpacing: 0.6,
                color: Colors.white), // Often used for Button text
            labelMedium: syneTextTheme.labelMedium
                ?.copyWith(letterSpacing: 0.5, color: Colors.white70),
            labelSmall: syneTextTheme.labelSmall
                ?.copyWith(letterSpacing: 0.5, color: Colors.white70),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
