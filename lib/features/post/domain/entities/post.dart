import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
    final String id;
    final String userId;
    final String username;
    final String text;
    final DateTime timestamp;

    Post({
        required this.id,
        required this.userId,
        required this.username,
        required this.text,
        required this.timestamp,
    });

    Post copyWith() {
        return Post(
            id: id,
            userId: userId,
            username: username,
            text: text,
            timestamp: timestamp,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'userId': userId,
            'username': username,
            'text': text,
            'timestamp': Timestamp.fromDate(timestamp),
        };
    }

    factory Post.fromJson(Map<String, dynamic> json) {
        return Post(
            id: json['id'],
            userId: json['userId'],
            username: json['username'],
            text: json['text'],
            timestamp: (json['timestamp'] as Timestamp).toDate(),
        );
    }
}