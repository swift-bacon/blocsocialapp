import 'package:blocsocialapp/features/authentication/domain/entities/app_user.dart';
import 'package:blocsocialapp/features/authentication/domain/repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRepository implements AuthenticationRepository {

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    @override
    Future<AppUser?> getCurrentUser() async {
        final firebaseUser = firebaseAuth.currentUser;

        if (firebaseUser == null) {
            return null;
        }

        return AppUser(
            uid: firebaseUser.uid,
            email: firebaseUser.email!,
            name: ''
        );
    }

    @override
    Future<AppUser?> loginWithEmailPassword(String email, String password) async {
        try {
            UserCredential userCredential = await firebaseAuth
                .signInWithEmailAndPassword(email: email, password: password);
            
            AppUser user = AppUser(
                uid: userCredential.user!.uid,
                email: email,
                name: '',
            );

            return user;
        } catch (e) {
            throw Exception('Login failed: $e');
        }
    }

    @override
    Future<void> logout() async {
        firebaseAuth.signOut();
    }

    @override
    Future<AppUser?> registerWithEmailPassword(String name, String email, String password) async {
        try {
            UserCredential userCredential = await firebaseAuth
                .createUserWithEmailAndPassword(email: email, password: password);

            AppUser user = AppUser(
                uid: userCredential.user!.uid,
                email: email,
                name: name,
            );

            await firebaseFirestore.collection("users").doc(user.uid).set(user.toJson());

            return user;
        } catch (e) {
            throw Exception('Registration failed: $e');
        }
    }

}
