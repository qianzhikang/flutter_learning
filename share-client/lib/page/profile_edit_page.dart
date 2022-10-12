import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:share_client/entity/user_model.dart';
import 'package:share_client/main.dart';
import 'package:share_client/utils/share_preferences_util.dart';
import '../theme/config.dart';
import '../widget/profile_widget.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _picker = ImagePicker();
  late String avatar;
  late String mobile;
  late String nickname;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  /// 修改头像
  Future<String> avatarUpload(String imgPath) async {
    File? imageFile = File(imgPath);
    Dio dio = Dio();
    Map<String, dynamic> map = Map();
    map['file'] = await MultipartFile.fromFile(imageFile.path);
    FormData formData = FormData.fromMap(map);
    var res = await dio.post('http://localhost:8083/api/v1/file/upload',
        data: formData);
    return res.data['data'];
  }

  @override
  void initState() {
    avatar = SpUtils.getString("avatar")!;
    mobile = SpUtils.getString("mobile")!;
    nickname = SpUtils.getString("nickname")!;

    nicknameController.text = nickname;
    mobileController.text = mobile;
  }

  /// 修改个人资料
  Future<void> updateProfile() async {
    var res = await request.post("/users/audit", data: {
      "id": SpUtils.getInt("id"),
      "avatar": avatar,
      "mobile": mobileController.text,
      "nickname": nicknameController.text
    }, headers: {
      "X-Token": SpUtils.getString("token")
    });
    UserModel newUser = UserModel.fromJson(res);
    SpUtils.setString("avatar", newUser.avatar);
    SpUtils.setString("nickname", newUser.nickname);
    SpUtils.setString("mobile", newUser.mobile);

    setState(() {
      nickname = newUser.nickname;
      mobile = newUser.mobile;
    });

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("Edit"),
            backgroundColor: Config.primaryColor,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: avatar,
                isEdit: true,
                onClicked: () async {
                  XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  avatarUpload(image.path).then((value) => {
                        setState(() {
                          avatar = value;
                        })
                      });
                },
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '昵称',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: nicknameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '手机',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () => {updateProfile()},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Config.primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
