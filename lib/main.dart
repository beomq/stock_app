import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:stock_app/util/color_schemes.dart';
import 'package:stock_app/data/source/local/company_listing_entity.dart';
import 'package:stock_app/presentation/main_screen.dart';

Future<void> main() async {
  Hive.registerAdapter(CompanyListingEntityAdapter());
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      themeMode: ThemeMode.system,
      home: const MainScreen(),
    );
  }
}
