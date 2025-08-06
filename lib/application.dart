import 'package:blocsocialapp/features/authentication/data/firebase_authentication_repository.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_state.dart';
import 'package:blocsocialapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:blocsocialapp/features/home/presentation/pages/home_page.dart';
import 'package:blocsocialapp/features/profile/data/firebase_profile_repository.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:blocsocialapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {

    final authenticationRepo = FirebaseAuthenticationRepository();
    final profileRepo = FirebaseProfileRepository();

    Application({super.key});

    @override
    Widget build(BuildContext context) {
        return MultiBlocProvider(
            providers: [
                BlocProvider<AuthenticationCubit>(
                    create: (context) => AuthenticationCubit(authRepo: authenticationRepo)..checkAuth()
                ),

                BlocProvider<ProfileCubit>(
                    create: (context) => ProfileCubit(profileRepository: profileRepo)
                ),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightMode,
                home: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    builder: (context, authState) {
                        if (authState is Unauthenticated) {
                            return const AuthenticationPage();
                        }

                        if (authState is Authenticated) {
                            return const HomePage();
                        }

                        else {
                            return const Scaffold(
                                body: Center(
                                    child: CircularProgressIndicator(),
                                ),
                            );
                        }
                    },
                    listener: (context, state) {
                        if (state is AuthenticationError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(
                                    state.message,
                                ),)
                            );
                        }
                    }),
            ),);
    }
}