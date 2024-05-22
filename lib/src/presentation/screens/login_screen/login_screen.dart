import 'package:flutter/material.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _userET, _passET;
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userET = TextEditingController();
    _passET = TextEditingController();
  }

  @override
  void dispose() {
    _userET.dispose();
    _passET.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                color: Colors.amber,
                                fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 44,
                      ),
                      MSTextField(
                        hintText: "User name",
                        controller: _userET,
                        validator: (p0) {
                          if (p0 != p0?.toLowerCase()) {
                            return "Username must not contain upercase charecter";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MSTextField(
                        hintText: "Password",
                        obscureText: true,
                        controller: _passET,
                        validator: (p0) {
                          if ((p0?.length ?? 0) < 8) {
                            return "Password must be atleast 8 charecter";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      _loginSection(),
                      const SizedBox(
                        height: 44,
                      ),
                      _signUpButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginSection() {
    return Consumer<AuthController>(
      builder: (context, authController, _) {
        if (authController.loginInProgress) {
          return const AppProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () async {
            if (_loginKey.currentState!.validate()) {
              final login = await authController.login(
                _userET.text.trim(),
                _passET.text,
              );
              if (login && context.mounted) {
                await context.read<ProfileDataController>().getUserProfileData();
              }
              if (context.mounted) {
                if (login) {
                  Navigate.pushAndRemoveUntil(
                    context,
                    const BottomNavbarScreen(),
                  );
                } else {
                  MSToast.errorToast("Somthing went wrong try later");
                }
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
          ),
          child: const Text("Login"),
        );
      },
    );
  }

  Widget _signUpButton() {
    return TextButton(
      onPressed: () {
        Navigate.pushReplacement(
          context,
          const SignUpScreen(),
        );
      },
      child: RichText(
        text: const TextSpan(
          text: "Have no account? ",
          style: TextStyle(
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: "Create One!",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
