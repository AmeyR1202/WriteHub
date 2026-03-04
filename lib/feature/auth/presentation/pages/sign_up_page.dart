import 'package:flutter/material.dart';
import 'package:writehub/core/theme/app_pallete.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                AuthInputField(labelText: "Name"),
                SizedBox(height: 10),
                AuthInputField(labelText: "Email"),
                SizedBox(height: 10),
                AuthInputField(labelText: "Password"),
                SizedBox(height: 20),
                AuthGradientButton(),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: AppPallete.gradient2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
