import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:writehub/core/theme/app_pallete.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AuthInputField(labelText: "Email", controller: emailController),
                SizedBox(height: 10),
                AuthInputField(
                  labelText: "Password",
                  controller: passwordController,
                  isObscureText: true,
                ),
                SizedBox(height: 20),
                AuthGradientButton(buttonText: "Log In"),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    context.go('/signup');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
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
