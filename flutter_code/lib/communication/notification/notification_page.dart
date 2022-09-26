import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _msg = '通知内容: ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Demo'),
      ),
      body: Center(
        child: NotificationListener<CustomNotification>(
          onNotification: (notification){
            setState(() {
              _msg += notification.msg;
            });
            return true;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_msg),
              const Custom(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomNotification extends Notification{
  final String msg;
  CustomNotification(this.msg);
}

class Custom extends StatelessWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: ()=> CustomNotification('hello').dispatch(context),
        child: const Text('Notification Demo'),
      ),
    );
  }
}

