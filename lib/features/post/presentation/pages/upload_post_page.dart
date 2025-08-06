import 'package:flutter/material.dart';

class UploadPostPage extends StatefulWidget {
    const UploadPostPage({super.key});

    @override
    State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {

    final _textController = TextEditingController();

    @override
    void dispose() {
        _textController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(

        );
    }
}
