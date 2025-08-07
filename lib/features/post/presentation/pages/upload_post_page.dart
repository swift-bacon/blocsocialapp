import 'package:blocsocialapp/features/authentication/domain/entities/app_user.dart';
import 'package:blocsocialapp/features/authentication/presentation/components/default_text_field.dart';
import 'package:blocsocialapp/features/authentication/presentation/cubits/authentication_cubit.dart';
import 'package:blocsocialapp/features/post/domain/entities/post.dart';
import 'package:blocsocialapp/features/post/presentation/cubits/post_cubit.dart';
import 'package:blocsocialapp/features/post/presentation/cubits/post_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadPostPage extends StatefulWidget {
    const UploadPostPage({super.key});

    @override
    State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {

    final _textController = TextEditingController();
    AppUser? currentUser;

    @override
    void initState() {
        super.initState();
        getCurrentUser();
    }

    @override
    void dispose() {
        _textController.dispose();
        super.dispose();
    }

    void getCurrentUser() async {
        final authenticationCubit = context.read<AuthenticationCubit>();
        currentUser = authenticationCubit.currentUser;
    }

    void uploadPost() {
        if (_textController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Caption are required'))
            );
            return;
        }

        final newPost = Post(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            userId: currentUser!.uid,
            username: currentUser!.name,
            text: _textController.text,
            timestamp: DateTime.now(),
        );

        final postCubit = context.read<PostCubit>();

        postCubit.createPost(newPost);
    }

    @override
    Widget build(BuildContext context) {
        return BlocConsumer<PostCubit, PostState>(
            builder: (context, state) {
                if (state is PostsLoading || state is PostUploading) {
                    return const Scaffold(
                        body: Center(
                            child: CircularProgressIndicator(),
                        ),
                    );
                }

                return _buildUploadPage();
            },
            listener: (context, state) {
                if (state is PostsLoaded) {
                    Navigator.of(context).pop();
                }
            }
        );
    }

    Widget _buildUploadPage() {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Create post',
                ),
                foregroundColor: Theme.of(context).colorScheme.primary,
                actions: [
                    IconButton(
                        onPressed: uploadPost,
                        icon: const Icon(Icons.upload),
                    )
                ],
            ),
            body: Column(
                children: [
                    DefaultTextField(
                        controller: _textController,
                        placeholder: 'Caption',
                        obscureText: false,
                    ),
                ],
            ),
        );
    }
}
