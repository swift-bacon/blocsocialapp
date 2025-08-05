import 'package:blocsocialapp/features/authentication/presentation/pages/login_page.dart';
import 'package:blocsocialapp/themes/light_mode.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
    const Application({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode,
            home: LoginPage(),
        );
    }
}