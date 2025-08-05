import 'package:blocsocialapp/features/authentication/presentation/components/default_button.dart';
import 'package:blocsocialapp/features/authentication/presentation/components/default_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

    final void Function()? onTogglePage;

    const RegisterPage({super.key, required this.onTogglePage});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _rePasswordController = TextEditingController();

    void register() {
        final String name = _nameController.text;
        final String email = _emailController.text;
        final String password = _passwordController.text;
        final String rePassword = _rePasswordController.text;

        
    }

    @override
    void dispose() {
        _nameController.dispose();
        _emailController.dispose();
        _passwordController.dispose();
        _rePasswordController.dispose();
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
                                    "Let's create an account for you",
                                    style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                        fontSize: 16,
                                    ),
                                ),
                                const SizedBox(height: 45,),

                                DefaultTextField(
                                    controller: _nameController,
                                    placeholder: 'Enter name',
                                    obscureText: true,
                                ),
                                const SizedBox(height: 15,),
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
                                const SizedBox(height: 15,),
                                DefaultTextField(
                                    controller: _rePasswordController,
                                    placeholder: 'Confirm password',
                                    obscureText: true,
                                ),
                                const SizedBox(height: 45,),
                                DefaultButton(
                                    onTap: () {

                                    },
                                    text: 'Register'
                                ),
                                const SizedBox(height: 35,),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text(
                                            'Already a member?',
                                            style: TextStyle(
                                                color: Theme.of(context).colorScheme.primary,
                                            ),
                                        ),
                                        GestureDetector(
                                            onTap: widget.onTogglePage,
                                            child: Text(
                                                ' Login now',
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
