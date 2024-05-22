import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:navigate/navigate.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GenderType _selectedGender = GenderType.male;
  late final TextEditingController _userNameController,
      _nameController,
      _passwordController;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(
                              color: Colors.amber, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 44,
                    ),
                    MSTextField(
                      hintText: "User name",
                      controller: _userNameController,
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
                      hintText: "Full name",
                      controller: _nameController,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MSTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: _passwordController,
                      validator: (p0) {
                        if ((p0?.length ?? 0) < 8) {
                          return "Password must be atleast 8 charecter";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    MSTextField(
                      hintText: "Confirm password",
                      obscureText: true,
                      validator: (value) {
                        if (_passwordController.text != value) {
                          return "Password Dosen't match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    _RadioButtonSection(_selectedGender, (GenderType? value) {
                      setState(() {
                        _selectedGender = value ?? GenderType.male;
                      });
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                    _signupSection(),
                    const SizedBox(
                      height: 44,
                    ),
                    _loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupSection() {
    return Consumer<AuthController>(
      builder: (context, authprovider, _) {
        if (authprovider.signUpInProgress) {
          return const AppProgressIndicator();
        }
        return ElevatedButton(
          onPressed: () async {
            if (_globalKey.currentState!.validate()) {
              final signup = await authprovider.signUp(
                _nameController.text,
                _userNameController.text.trim(),
                _passwordController.text,
                _selectedGender,
              );
              if (signup && context.mounted) {
                await context.read<ProfileDataController>().getUserProfileData();
              }
              if (context.mounted) {
                if (signup) {
                  Navigate.pushAndRemoveUntil(
                    context,
                    const BottomNavbarScreen(),
                  );
                } else {
                  MSToast.errorToast("Try use another username");
                }
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
          ),
          child: const Text("Create"),
        );
      },
    );
  }

  Widget _loginButton() {
    return TextButton(
      onPressed: () {
        Navigate.pushReplacement(
          context,
          const LoginScreen(),
        );
      },
      child: RichText(
        text: const TextSpan(
          text: "Have an account? ",
          style: TextStyle(
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: "Login",
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

class _RadioButtonSection extends StatelessWidget {
  final GenderType groupValue;
  final void Function(GenderType?)? onChange;
  const _RadioButtonSection(this.groupValue, this.onChange);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _radioBox(GenderType.male, "Male"),
        const SizedBox(
          width: 8,
        ),
        _radioBox(GenderType.female, "Female"),
      ],
    );
  }

  Widget _radioBox(GenderType value, String name) {
    final color = (groupValue == value) ? Colors.amber : Colors.grey;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color,
            width: 3,
          ),
        ),
        child: RadioListTile(
          groupValue: groupValue,
          value: value,
          onChanged: onChange,
          title: Text(name),
          fillColor: MaterialStatePropertyAll(color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
