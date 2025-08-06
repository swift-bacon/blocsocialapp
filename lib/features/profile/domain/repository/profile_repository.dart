import 'package:blocsocialapp/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepository {
    Future<ProfileUser?> fetchUserProfile(String uid);
    Future<void> updateProfile(ProfileUser updatedProfile);
}