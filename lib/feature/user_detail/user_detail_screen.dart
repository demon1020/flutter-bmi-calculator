import 'package:bmi/feature/user_detail/components/body_user_detail.dart';
import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ConstantTexts.kAPP_NAME),
      ),
      body: BodyUserDetails(),
    );
  }
}
