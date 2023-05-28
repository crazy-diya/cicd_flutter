import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/utils/navigation_routes.dart';
import 'package:test1/core/services/dependency_injection.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Routes.generateRoute,
      initialRoute: Routes.splashScreen,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
    );
  }
}
