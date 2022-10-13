import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_client/entity/user_model.dart';
import 'package:share_client/main.dart';
import 'package:share_client/page/profile_edit_page.dart';
import 'package:share_client/page/user_safe_page.dart';
import 'package:share_client/theme/config.dart';
import '../utils/share_preferences_util.dart';
import 'login_page.dart';

TextStyle _titleStyle =
    const TextStyle(color: Config.primaryColor, fontSize: 15.0);
TextStyle _subTitleStyle = const TextStyle(fontSize: 14.0);

class ProfileOnePage extends StatefulWidget {
  const ProfileOnePage({super.key});

  @override
  State<ProfileOnePage> createState() => _ProfileOnePageState();
}

class _ProfileOnePageState extends State<ProfileOnePage> {
  String nickname = "未登陆";
  String mobile = "登陆后获取";
  String avatar =
      'https://pic-go.oss-cn-shanghai.aliyuncs.com/avatars/avatar05.jpg';
  String roles = "登陆以获取";

  void _init() async {
    if (SpUtils.getInt("id") != -1) {
      int id = SpUtils.getInt("id")!;
      String token = SpUtils.getString("token")!;
      getUserData(id, token);
    }
  }

  Future<void> getUserData(int id, String token) async {
    var userData = await request.get("/users/$id", headers: {"X-Token": token});
    UserModel userModel = UserModel.fromJson(userData);
    setState(() {
      nickname = userModel.nickname;
      mobile = userModel.mobile;
      roles = userModel.roles;
      avatar = userModel.avatar;
    });
    SpUtils.setString("avatar", avatar);
    SpUtils.setString("mobile", mobile);
    SpUtils.setString("nickname", nickname);
  }

  void _dispose() async {
    SpUtils.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  @override
  void initState() {
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              _buildHeader(),
              Expanded(child: _buildListTile()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.2, 0.9],
          colors: [
            Config.primarySwatchColor.shade400,
            Config.primarySwatchColor.shade200,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditProfilePage()))
                        .then((value) => setState(() {
                              avatar = SpUtils.getString("avatar")!;
                              nickname = SpUtils.getString("nickname")!;
                              mobile = SpUtils.getString("mobile")!;
                            }))
                  },
                  child: CircleAvatar(
                    minRadius: 30.0,
                    backgroundColor: Config.primarySwatchColor.shade300,
                    child: const Icon(
                      Icons.edit,
                      size: 30.0,
                    ),
                  ),
                ),
                CircleAvatar(
                  minRadius: 60,
                  backgroundColor: Config.primarySwatchColor.shade200,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                    minRadius: 50,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (_) => UserSafePage()))
                        .then((value) {
                      if (value != null) {
                        var flag = value as bool;
                        if (flag) {
                          Fluttertoast.showToast(
                              msg: "密码修改成功！",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      }
                    });
                  },
                  child: CircleAvatar(
                    minRadius: 30.0,
                    backgroundColor: Config.primarySwatchColor.shade300,
                    child: const Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(nickname, style: TextStyle(fontSize: 22.0, color: Colors.white)),
          Text(roles,
              style: TextStyle(fontSize: 14.0, color: Colors.red.shade100)),
        ],
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.deepOrange.shade300,
            child: const ListTile(
              title: Text(
                '50898',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                'FOLLOWERS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: const ListTile(
              title: Text(
                '345288',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                'FOLLOWING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListTile() {
    return ListView(
      children: [
        ListTile(
          dense: true,
          title: Text(
            "Phone",
            style: _titleStyle,
          ),
          subtitle: Text(
            mobile,
            style: _subTitleStyle,
          ),
        ),
        ListTile(
          dense: true,
          title: Text(
            "Roles",
            style: _titleStyle,
          ),
          subtitle: Text(
            roles,
            style: _subTitleStyle,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        MaterialButton(
          onPressed: () => {_dispose()},
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: const Center(
              child: Text(
                "Logout",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
