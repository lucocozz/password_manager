import 'package:flutter/material.dart';

import '../widgets/password_field.dart';

class CreateMasterPassword extends StatefulWidget {
  const CreateMasterPassword({Key? key}) : super(key: key);

  @override
  State<CreateMasterPassword> createState() => _CreateMasterPasswordState();
}

class _CreateMasterPasswordState extends State<CreateMasterPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 352, height: 443),
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
              const PasswordField(
                hintText: "Enter Password",
                strengthIndicatorVisible: true,
              ),
              const SizedBox(height: 16),
              const PasswordField(hintText: "Confirm Password"),
              const SizedBox(height: 16),
              SizedBox(
                width: 352,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
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
    );
  }
}
