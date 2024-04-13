import 'package:app/Pages/home_page.dart';
import 'package:app/Provider/Service_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Quran_App());
}

class Quran_App extends StatelessWidget {
  const Quran_App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
      home:HomePage(),
      ),
    );
  }
}

