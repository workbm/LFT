import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/utils.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/provider/auth/login_provider.dart';
import 'package:lft_new_project/screens/home/home_page.dart';
import 'package:provider/provider.dart';

class LoginCredentialWidget extends StatefulWidget {
  const LoginCredentialWidget({super.key});

  @override
  State<LoginCredentialWidget> createState() => _LoginCredentialWidgetState();
}

class _LoginCredentialWidgetState extends State<LoginCredentialWidget> {
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text('Adresse e-mail')),
          Gap(height: size.height * 0.01),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ce champ est obligatoire';
              }
              return null;
            },
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22), child: Text('Mot de passe')),
          Gap(height: size.height * 0.01),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            obscureText: true,
            controller: _passController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ce champ est obligatoire';
              }
              return null;
            },
          ),
          Gap(height: size.height * 0.05),
          Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CommonColors.darkGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: const Size(200, 45),
                    ),
                    onPressed: () {
                      _login();
                    },
                    child: const Text('Se connecter'),
                  ),
          ),
          Gap(height: size.height * 0.01),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: CommonColors.lightGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: const Size(200, 45),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/img/google-icon.png',
                      height: 30,
                      width: 30,
                    ),
                    const Text(
                      'Avec Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      await context
          .read<LoginProvider>()
          .login(_emailController.text, _passController.text);
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } on Exception catch (error) {
      print('error');
      print(error);
      showSnackBar(context: context, content: 'Une erreur se produit');
    }
    setState(() {
      _isLoading = false;
    });
  }
}
