import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_client/main.dart';
import 'package:share_client/utils/share_preferences_util.dart';

import '../theme/config.dart';

class UserSafePage extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController surePswController = TextEditingController();

  UserSafePage({Key? key}) : super(key: key);

  void verifyPsw(BuildContext context) async{
    if (passwordController.text == null || surePswController.text == null)
      return;
    if (passwordController.text != surePswController.text) {
      Fluttertoast.showToast(
          msg: "两次输入的密码不相同！",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    await request.post("/users/audit",
        data: {"id": SpUtils.getInt("id"), "password": passwordController.text},
        headers: {"X-Token": SpUtils.getString("token")});
    Navigator.pop(context,true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("账号安全设置"),
        backgroundColor: Config.primaryColor,
      ),
      backgroundColor: Color(0xfff6f6f6),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '当前账号',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey.shade600),
                ),
                Text(
                  '${SpUtils.getString('mobile')}',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: ExpansionTile(
              title: Text(
                "修改密码",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: [
                // SizedBox(height: 30,),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(18),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: Text('新密码'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                Container(
                  height: 80,
                  padding: EdgeInsets.all(18),
                  child: TextField(
                    controller: surePswController,
                    decoration: InputDecoration(
                      label: Text('确认密码'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                MaterialButton(
                  onPressed: () => {
                    verifyPsw(context)
                  },
                  child: Container(
                    height: 40,
                    width: 100,
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
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
