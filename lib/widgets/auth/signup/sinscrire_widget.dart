import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/utils.dart';
import 'package:lft_new_project/provider/auth/sign_up_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/http_exception.dart';
import '../../../common/widgets/gap.dart';

class SinscrireCredentialWidget extends StatefulWidget {
  const SinscrireCredentialWidget({super.key});

  @override
  State<SinscrireCredentialWidget> createState() =>
      _SinscrireCredentialWidgetState();
}

class _SinscrireCredentialWidgetState extends State<SinscrireCredentialWidget> {
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _birthDateController = TextEditingController();
  final _codeController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  final _villeController = TextEditingController();
  @override
  void dispose() {
    _birthDateController.dispose();
    _codeController.dispose();
    _countryController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passController.dispose();
    _villeController.dispose();
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
              padding: EdgeInsets.only(left: 22), child: Text('Prénom')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                if (value.length < 3 || value.length > 25) {
                  return 'Le nombre de caractères doit être compris entre 3 et 25';
                }
                return null;
              },
            ),
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text('Date de naissance')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              controller: _birthDateController,
              readOnly: true,
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2023),
                ).then((value) {
                  if (value != null) {
                    _birthDateController.text =
                        DateFormat("yyyy-MM-dd").format(value);
                  }
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                return null;
              },
            ),
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22), child: Text('Pays')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              controller: _countryController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                return null;
              },
            ),
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text('Ville et code postale')),
          Gap(height: size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    errorStyle: const TextStyle(fontSize: 0.01),
                  ),
                  style: const TextStyle(
                    decorationThickness: 0,
                  ),
                  controller: _villeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    errorStyle: const TextStyle(fontSize: 0.01),
                  ),
                  style: const TextStyle(
                    decorationThickness: 0,
                  ),
                  controller: _codeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text('Adresse e-mail')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                if (!value.contains('@')) {
                  return 'Saisir un format valide';
                }
                return null;
              },
            ),
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22), child: Text('Mot de passe')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              obscureText: true,
              controller: _passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                if (value.length < 6 || value.length > 15) {
                  return 'Le nombre de caractères doit être compris entre 6 et 15';
                }
                return null;
              },
            ),
          ),
          Gap(height: size.height * 0.02),
          const Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text('Confirmer le mot de passe')),
          Gap(height: size.height * 0.01),
          SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                errorStyle: const TextStyle(fontSize: 0.01),
              ),
              style: const TextStyle(
                decorationThickness: 0,
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ est obligatoire';
                }
                if (value != _passController.text) {
                  return 'Les mots de passe ne sont pas égaux';
                }
                return null;
              },
            ),
          ),
          // Sign UP
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
                      signUpFct();
                    },
                    child: const Text('S\'inscrire'),
                  ),
          ),
          Gap(height: size.height * 0.01),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'J\'ai déjà un compte',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signUpFct() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      setState(() {
        _isLoading = true;
      });
      await context.read<SignupProvider>().signUpFct(
          _nameController.text,
          _codeController.text,
          _emailController.text,
          _birthDateController.text,
          _passController.text,
          _villeController.text,
          _countryController.text);
    } on HttpExceptionClass catch (error) {
      print('HttpException Sinscrire');
      var exceptionError = 'Une erreur se produit';
      if (error.toString().contains('The email has already been taken.')) {
        exceptionError = 'The email has already been taken';
      }
      showSnackBar(context: context, content: exceptionError);
    } catch (err) {
      showSnackBar(context: context, content: 'Une erreur se produit');
    }
    setState(() {
      _isLoading = false;
    });
  }
}
