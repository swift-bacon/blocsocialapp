import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:blocsocialapp/features/home/presentation/components/app_drawer_tile.dart';
import 'package:blocsocialapp/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
    const AppDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                        children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 50.0),
                              child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Divider(
                                color: Theme.of(context).colorScheme.secondary,
                            ),
                            AppDrawerTile(
                                title: "Home",
                                icon: Icons.home,
                                onTap: () => Navigator.of(context).pop(),
                            ),
                            AppDrawerTile(
                                title: "Profile",
                                icon: Icons.person,
                                onTap: () {
                                    Navigator.of(context).pop();

                                    final user = context.read<AuthenticationCubit>().currentUser;
                                    String? uid = user!.uid;

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage(uid: uid)));
                                },
                            ),
                            AppDrawerTile(
                                title: "Search",
                                icon: Icons.search,
                                onTap: () {},
                            ),
                            AppDrawerTile(
                                title: "Settings",
                                icon: Icons.settings,
                                onTap: () {},
                            ),
                            const Spacer(),
                            AppDrawerTile(
                                title: "Logout",
                                icon: Icons.login,
                                onTap: () {
                                    context.read<AuthenticationCubit>().logout();
                                },
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}