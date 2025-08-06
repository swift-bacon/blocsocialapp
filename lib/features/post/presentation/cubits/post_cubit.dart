import 'package:blocsocialapp/features/post/domain/repository/post_repository.dart';
import 'package:blocsocialapp/features/post/presentation/cubits/post_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';

class PostCubit extends Cubit<PostState> {
    final PostRepository postRepository;

    PostCubit({required this.postRepository}) : super(PostsInitial());

    Future<void> createPost(Post post) async {
        try {
            postRepository.createPost(post);
        } catch (e) {
            emit(PostsError('Failed to create post: $e'));
        }
    }

    Future<void> fetchAllPosts() async {
        try {
            emit(PostsLoading());
            final posts = await postRepository.fetchAllPosts();
            emit(PostsLoaded(posts));
        } catch (e) {
            emit(PostsError('Failed to fetch posts: $e'));
        }
    }

    Future<void> deletePost(String postId) async {
        try {
            await postRepository.deletePost(postId);
        } catch(e) {}
    }
}
