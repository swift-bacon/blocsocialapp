import 'package:blocsocialapp/features/home/presentation/components/app_drawer.dart';
import 'package:blocsocialapp/features/post/presentation/pages/upload_post_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
                'Home',
            ),
            actions: [
                IconButton(
                    onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => UploadPostPage()
                            )
                        );
                    },
                    icon: const Icon(Icons.add),
                ),
            ],
        ),
        drawer: const AppDrawer(),
    );
  }
}
