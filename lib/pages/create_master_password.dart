import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/foundation.dart';

class CreateMasterPassword extends StatefulWidget {
  const CreateMasterPassword({Key? key}) : super(key: key);

  @override
  State<CreateMasterPassword> createState() => _CreateMasterPasswordState();
}

class _CreateMasterPasswordState extends State<CreateMasterPassword> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    if (defaultTargetPlatform != TargetPlatform.android &&
        defaultTargetPlatform != TargetPlatform.iOS) {}
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
