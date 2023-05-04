import 'package:flutter/material.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/gap.dart';

class SinscrireCredentialWidget extends StatefulWidget {
  const SinscrireCredentialWidget({super.key});

  @override
  State<SinscrireCredentialWidget> createState() =>
      _SinscrireCredentialWidgetState();
}

class _SinscrireCredentialWidgetState extends State<SinscrireCredentialWidget> {
  final _formKey = GlobalKey<FormState>();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passController = TextEditingController();
  @override
  void dispose() {
    _birthDateController.dispose();
    _emailController.dispose();
    _nameController.dispose();
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
                hintText: 'Prénom',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              controller: _nameController,
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
              ),
              controller: _birthDateController,
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
                  ),
                  controller: _birthDateController,
                ),
              ),
              SizedBox(
                height: 40,
                width: 100,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  controller: _birthDateController,
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
              ),
              controller: _emailController,
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
              ),
              obscureText: true,
              controller: _passController,
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
              ),
              obscureText: true,
              controller: _passController,
            ),
          ),
          Gap(height: size.height * 0.05),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CommonColors.darkGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fixedSize: const Size(200, 45),
              ),
              onPressed: () {},
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
}
