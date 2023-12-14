import 'package:disappear/models/user_profile_model.dart';
import 'package:disappear/services/profile_service.dart';
import 'package:flutter/foundation.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileService _profileService;

  ProfileViewModel() : _profileService = ProfileService();

  Profile? _profile;

  Profile? get profile => _profile;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getProfile() async {
    try {
      // _isLoading = true;
      // notifyListeners();

      final profileData = await _profileService.getProfile();
      _profile = Profile.fromJson(profileData);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Error getting profile: $error');
    }
  }

  bool _isSaving = false;
  bool get isSaving => _isSaving;

  Future<void> editProfile(Map<String, dynamic> data) async {
    try {
      _isSaving = true;
      notifyListeners();

      await _profileService.editProfile(data);

      await getProfile();
    } catch (error) {
      debugPrint('Error editing profile: $error');
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }
}
