import 'package:flutter/material.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/common/widgets/padding.dart';
import 'package:lft_new_project/provider/auth/seconnecter_sinscrire_provider.dart';
import 'package:lft_new_project/widgets/auth/signup/login_credential_widget.dart';
import 'package:lft_new_project/widgets/auth/seconnecter_sinscrire_widget.dart';
import 'package:lft_new_project/widgets/auth/signup/sinscrire_widget.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<SeconnecterSinscrireProvider>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: size.height - MediaQuery.of(context).padding.top,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/img/background-image-login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: PaddingWidget(
                      horizontal: 15,
                      vertical: 5,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SeConnecterSinscrireWidget(),
                              Gap(height: size.height * 0.025),
                              listenData.isSeconnecter
                                  ? const LoginCredentialWidget()
                                  : const SinscrireCredentialWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
