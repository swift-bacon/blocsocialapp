import 'package:flutter/material.dart';

class AppDrawerTile extends StatelessWidget {

    final String title;
    final IconData icon;
    final void Function()? onTap;

    const AppDrawerTile({super.key, required this.title, required this.icon, required this.onTap});

    @override
    Widget build(BuildContext context) {
        return ListTile(
            onTap: onTap,
            leading: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                ),
            ),
        );
    }
}
