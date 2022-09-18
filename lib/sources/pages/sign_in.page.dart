import 'package:auto_route/auto_route.dart';
import 'package:dargon2_flutter/dargon2_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_manager/sources/routes/router.gr.dart';

import '../models/providers.model.dart';
import '../widgets/password_field.widget.dart';
import '../services/sign_up/check_master_password.service.dart';

class SignInPage extends StatefulHookConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  String? _validatorValue;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  Future _fieldValidator(String? password) async {
    _validatorValue = null;
    setState(() {});

    bool isGood = await checkMasterPassword(password!);
    if (password.isEmpty) {
      _validatorValue = "Field can't be empty";
    } else if (isGood == false) {
      _validatorValue = "Invalid password";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 352, height: 331),
          child: Column(
            children: [
              const Image(image: AssetImage("key.png"), width: 80),
              const SizedBox(height: 32),
              Text(
                "Enter Master Password",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: Focus(
                  onFocusChange: (hasFocus) {
                    if (!hasFocus) {
                      _fieldValidator(_passwordController.text);
                    }
                  },
                  child: PasswordField(
                    hintText: "Enter Password",
                    controller: _passwordController,
                    validator: (_) => _validatorValue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 350,
                height: 48,
                child: ElevatedButton(
                  child: const Text("Unlock Manager"),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ref.read(masterPasswordProvider.notifier).state =
                          await argon2.hashPasswordString(
                        _passwordController.text,
                        salt: Salt.newSalt(),
                      );
                      context.router.push(const DashboardRouter());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
