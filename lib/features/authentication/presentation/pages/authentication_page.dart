import 'package:blocsocialapp/features/authentication/presentation/pages/login_page.dart';
import 'package:blocsocialapp/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
    const AuthenticationPage({super.key});

    @override
    State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

    bool showLoginPage = true;

    void togglePages() {
        setState(() {
          showLoginPage = !showLoginPage;
        });
    }

    @override
    Widget build(BuildContext context) {
        if (showLoginPage) {
            return LoginPage(onTogglePage: togglePages,);
        } else {
            return RegisterPage(onTogglePage: togglePages,);
        }
    }
}
