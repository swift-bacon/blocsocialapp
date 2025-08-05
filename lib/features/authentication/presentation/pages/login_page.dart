import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                children: [
                    Icon(
                        Icons.lock_open_rounded,
                        size: 80,
                        color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 50,),
                    Text(
                        'Welcome back, you have been missed!',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                        ),
                    ),
                    const SizedBox(height: 25,),
                    TextField(
                        
                    )
                ],
            ),
          ),
        ),
    );
  }
}
