import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_lite_technical_test/controllers/post_controller.dart';
import 'package:social_lite_technical_test/models/user_model.dart';
import 'package:social_lite_technical_test/widgets/bottom_nav_bar_widget.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final _userBox = Hive.box<UserModel>('users');
  var currentUser = Rxn<UserModel>();
  var profileImage = RxnString();
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  Future<String?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      return image.path;
    }
    return null;
  }

  void registerUser({
    required String username,
    required String email,
    required String password,
    required String title,
    required String status,
    required String imageUrl,
  }) {
    final newUser = UserModel(
      username: username,
      email: email,
      password: password,
      title: title,
      status: 'offline',
      imageUrl: imageUrl,
    );
    _userBox.put(email, newUser);
    currentUser.value = newUser;

    Get.offAllNamed(AppRoutes.loginScreen);
  }

  void loginUser({required String email, required String password}) {
    final user = _userBox.get(email);
    if (user == null) {
      Get.closeAllSnackbars();
      Get.snackbar('Login Failed', 'This email is not registered.');
    } else if (user.password != password) {
      Get.closeAllSnackbars();
      Get.snackbar('Login Failed', 'Incorrect password.');
    } else {
      currentUser.value = user;
      Get.put(PostController());
      Get.to(() => const BottomNavBar(initialIndex: 0));
    }
  }

  void updateUser({
    required String username,
    required String email,
    required String title,
    required String status,
    required String imageUrl,
  }) {
    final user = currentUser.value;
    if (user != null) {
      user.username = username;
      user.email = email;
      user.title = title;
      user.status = status;
      user.imageUrl = imageUrl;
      user.save();
      currentUser.refresh();
    }
  }

  void logout() {
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
