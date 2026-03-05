import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:writehub/core/theme/app_pallete.dart';
import 'package:writehub/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:writehub/feature/auth/presentation/widgets/auth_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AuthInputField(labelText: "Name", controller: nameController),
                SizedBox(height: 10),
                AuthInputField(labelText: "Email", controller: emailController),
                SizedBox(height: 10),
                AuthInputField(
                  labelText: "Password",
                  controller: passwordController,
                  isObscureText: true,
                ),
                SizedBox(height: 20),
                AuthGradientButton(
                  buttonText: "Sign up",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        AuthSignUp(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "Login",
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
