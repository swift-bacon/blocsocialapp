import 'package:blocsocialapp/features/authentication/presentation/components/default_text_field.dart';
import 'package:blocsocialapp/features/profile/domain/entities/profile_user.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:blocsocialapp/features/profile/presentation/cubits/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {

    final ProfileUser user;

    const EditProfilePage({super.key, required this.user});

    @override
    State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

    final _bioTextController = TextEditingController();

    void updateProfile() async {
        final profileCubit = context.read<ProfileCubit>();
        
        if (_bioTextController.text.isNotEmpty) {
            profileCubit.updateProfile(uid: widget.user.uid, newBio: _bioTextController.text);
        }
    }

    @override
    void dispose() {
        _bioTextController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return BlocConsumer(builder: (context, state) {
            if(state is ProfileLoading) {
                return const Scaffold(
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            CircularProgressIndicator(),
                            const SizedBox(height: 25,),
                            Text(
                                'Uploading',
                            )
                        ],
                    ),
                );
            } else {
                return _buildEditPage();
            }
        }, listener: (context, state) {
            if (state is ProfileLoaded) {
                Navigator.pop(context);
            }
        });
    }

    Widget _buildEditPage({double uploadProgress = 0.0}) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Edit profile'
                ),
                foregroundColor: Theme.of(context).colorScheme.primary,
                actions: [
                    IconButton(
                        onPressed: updateProfile,
                        icon: const Icon(
                            Icons.upload,
                        ),
                    )
                ],
            ),
            body: Column(
                children: [
                    Text('Bio'),
                    const SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: DefaultTextField(
                          controller: _bioTextController,
                          placeholder: widget.user.bio,
                          obscureText: false,
                      ),
                    )
                ],
            )
        );
    }
}
