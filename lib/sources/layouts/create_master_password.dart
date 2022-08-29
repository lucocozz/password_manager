import 'package:flutter/material.dart';

import '../widgets/password_field.dart';

class CreateMasterPassword extends StatefulWidget {
  const CreateMasterPassword({Key? key}) : super(key: key);

  @override
  State<CreateMasterPassword> createState() => _CreateMasterPasswordState();
}

class _CreateMasterPasswordState extends State<CreateMasterPassword> {
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 352, height: 467),
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
                      return "Passwords are not similar.";
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
                      if (formKey.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Continue",
                      textAlign: TextAlign.center,
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
