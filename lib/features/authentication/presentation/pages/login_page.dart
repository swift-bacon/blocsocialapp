import 'package:blocsocialapp/features/authentication/presentation/components/default_button.dart';
import 'package:blocsocialapp/features/authentication/presentation/components/default_text_field.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {

    final void Function()? onTogglePage;

    const LoginPage({super.key, required this.onTogglePage});

    @override
    State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    void login() {
        final String email = _emailController.text;
        final String password = _passwordController.text;

        final authCubit = context.read<AuthenticationCubit>();

        if (email.isNotEmpty && password.isNotEmpty) {
            authCubit.login(email, password);
        } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Please enter both email and password'),
            ));
        }
    }

    @override
    void dispose() {
        _emailController.dispose();
        _passwordController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                const SizedBox(height: 45,),
                                DefaultTextField(
                                    controller: _emailController,
                                    placeholder: 'Enter email',
                                    obscureText: false,
                                ),
                                const SizedBox(height: 15,),
                                DefaultTextField(
                                    controller: _passwordController,
                                    placeholder: 'Enter password',
                                    obscureText: true,
                                ),
                                const SizedBox(height: 45,),
                                DefaultButton(
                                    onTap: login,
                                    text: 'Login'
                                ),
                                const SizedBox(height: 35,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            'Not a member? ',
                                            style: TextStyle(
                                                color: Theme.of(context).colorScheme.primary,
                                            ),
                                        ),
                                        GestureDetector(
                                            onTap: widget.onTogglePage,
                                            child: Text(
                                                'Register now',
                                                style: TextStyle(
                                                    color: Theme.of(context).colorScheme.inversePrimary,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                        ),
                                    ],
                                )
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
