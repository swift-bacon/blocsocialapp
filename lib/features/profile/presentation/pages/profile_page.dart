import 'package:blocsocialapp/features/authentication/domain/entities/app_user.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {

    final String uid;

    const ProfilePage({super.key, required this.uid});

    @override
    State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

    late final authCubit = context.read<AuthenticationCubit>();
    late final profileCubit = context.read<ProfileCubit>();

    late AppUser? currentUser = authCubit.currentUser;

    @override
    void initState() {
        super.initState();
        profileCubit.fetchUserProfile(widget.uid);
    }

    @override
    Widget build(BuildContext context) {
        return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
            if (state is ProfileLoaded) {
                final user = state.profileUser;

                return Scaffold(
                    appBar: AppBar(
                        title: Text(
                            user.name,
                        ),
                        foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    body: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                          children: [
                              Text(
                                  user.email,
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary,
                                  ),
                              ),
                              const SizedBox(height: 25,),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(60),
                                  ),
                                  height: 120,
                                  width: 120,
                                  padding: const EdgeInsets.all(25),
                                  child: Center(
                                      child: Icon(
                                          Icons.percent,
                                          size: 72,
                                          color: Theme.of(context).colorScheme.primary,
                                      ),
                                  ),
                              ),
                              const SizedBox(height: 25,),
                              Row(
                                  children: [
                                      
                                  ],
                              )
                          ],
                      ),
                    )
                );
            }

            else if (state is ProfileLoading) {
                return const Scaffold(
                    body: Center(
                        child: CircularProgressIndicator(),
                    ),
                );
            } else {
                return const Center(
                    child: Text(
                        'No profile data',
                    ),
                );
            }
        });
    }
}
