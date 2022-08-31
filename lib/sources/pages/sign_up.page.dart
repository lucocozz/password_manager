import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_manager/sources/routes/router.gr.dart';
import 'package:password_strength/password_strength.dart';

import '../widgets/password_field.widget.dart';
import '../services/sign_up/add_master_password.service.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
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
                        addMasterPassword(passwordController.text, ref);
                        context.router.push(const DashboardRouter());
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
