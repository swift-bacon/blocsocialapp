import 'package:blocsocialapp/features/authentication/data/firebase_authentication_repository.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_state.dart';
import 'package:blocsocialapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:blocsocialapp/features/home/presentation/pages/home_page.dart';
import 'package:blocsocialapp/features/post/data/firebase_post_repository.dart';
import 'package:blocsocialapp/features/post/presentation/cubits/post_cubit.dart';
import 'package:blocsocialapp/features/profile/data/firebase_profile_repository.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:blocsocialapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {

    final authenticationRepo = FirebaseAuthenticationRepository();
    final profileRepo = FirebaseProfileRepository();
    final postRepository = FirebasePostRepository();

    Application({super.key});

    @override
    Widget build(BuildContext context) {
        return MultiBlocProvider(
            providers: [
                BlocProvider<AuthenticationCubit>(
                    create: (context) =>
                    AuthenticationCubit(authRepo: authenticationRepo)..checkAuth(),
                ),
                BlocProvider<ProfileCubit>(
                    create: (context) => ProfileCubit(profileRepository: profileRepo),
                ),
                BlocProvider<PostCubit>(
                    create: (context) => PostCubit(postRepository: postRepository),
                ),
            ],
            child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                    if (state is AuthenticationError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)),
                        );
                    }
                },
                builder: (context, authState) {
                    Widget home;

                    if (authState is Unauthenticated) {
                        home = const AuthenticationPage();
                    } else if (authState is Authenticated) {
                        home = const HomePage();
                    } else {
                        home = const Scaffold(
                            body: Center(child: CircularProgressIndicator()),
                        );
                    }

                    return MaterialApp(
                        debugShowCheckedModeBanner: false,
                        theme: lightMode,
                        home: home,
                    );
                },
            ),
        );
    }
}