import 'package:flutter/material.dart';
import 'package:password_manager/sources/services/master_password/add_master_password.dart';
import 'package:password_strength/password_strength.dart';

import '../widgets/password_field.dart';

class CreateMasterPasswordPage extends StatefulWidget {
  const CreateMasterPasswordPage({Key? key}) : super(key: key);

  @override
  State<CreateMasterPasswordPage> createState() =>
      _CreateMasterPasswordPageState();
}

class _CreateMasterPasswordPageState extends State<CreateMasterPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 352, height: 467),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Image(image: AssetImage("key.png"), width: 80),
                const SizedBox(height: 24),
                Text(
                  'Create Master Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                Text(
                  'Enter a master password that you will use to unlock your passwords.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 32),
                PasswordField(
                  hintText: "Enter Password",
                  controller: passwordController,
                  strengthIndicatorVisible: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field can't be empty";
                    }
                    if (estimatePasswordStrength(passwordController.text) <
                        0.5) {
                      return "Password is too weak";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PasswordField(
                  hintText: "Confirm Password",
                  controller: confirmController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field can't be empty";
                    } else if (value != passwordController.text) {
                      return "Passwords are not similar";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 352,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        addMasterPassword(passwordController.text);
                      }
                    },
                    child: const Text(
                      "Continue",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
