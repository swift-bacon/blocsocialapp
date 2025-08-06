import 'package:blocsocialapp/features/post/domain/entities/post.dart';
import 'package:blocsocialapp/features/post/domain/repository/post_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebasePostRepository implements PostRepository {

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final CollectionReference postsCollection = FirebaseFirestore.instance.collection('posts');

    @override
    Future<void> createPost(Post post) async {
        try {
            await postsCollection.doc(post.id).set(post.toJson());
        } catch (e) {
            throw Exception('Error creating post: $e');
        }
    }

    @override
    Future<void> deletePost(String postId) async {
        await postsCollection.doc(postId).delete();
    }

    @override
    Future<List<Post>> fetchAllPosts() async {
        try {
            final postsSnapshot = await postsCollection.orderBy('timestamp', descending: true).get();

            final List<Post> allPosts = postsSnapshot.docs
                .map((doc) => Post.fromJson(doc.data as Map<String, dynamic>))
                .toList();

            return allPosts;
        } catch (e) {
            throw Exception('Error fetching posts: $e');
        }
    }

    @override
    Future<List<Post>> fetchPostsByUserId(String userId) async {
        try {
            final postsSnapshot = await postsCollection.where('userId', isEqualTo: userId).get();

            final List<Post> userPosts = postsSnapshot.docs
                .map((doc) => Post.fromJson(doc.data as Map<String, dynamic>))
                .toList();

            return userPosts;
        } catch (e) {
            throw Exception('Error fetching posts by user: $e');
        }
    }

}