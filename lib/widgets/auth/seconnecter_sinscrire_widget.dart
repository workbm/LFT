import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/auth/seconnecter_sinscrire_provider.dart';
import 'package:lft_new_project/widgets/auth/seconnecter_widget.dart';
import 'package:provider/provider.dart';

class SeConnecterSinscrireWidget extends StatefulWidget {
  const SeConnecterSinscrireWidget({super.key});

  @override
  State<SeConnecterSinscrireWidget> createState() =>
      _SeConnecterSinscrireWidgetState();
}

class _SeConnecterSinscrireWidgetState
    extends State<SeConnecterSinscrireWidget> {
  var _isSeconnecter = true;
  @override
  Widget build(BuildContext context) {
    var data = context.read<SeconnecterSinscrireProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              data.seConnecterFct(false);
              _isSeconnecter = false;
            });
          },
          child: SeConnecterWidget(
            text: 'S\'inscrire',
            changeTextColor: false,
            seConnecter: !_isSeconnecter,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              data.seConnecterFct(true);
              _isSeconnecter = true;
            });
          },
          child: SeConnecterWidget(
            text: 'Se connecter',
            changeTextColor: true,
            seConnecter: _isSeconnecter,
          ),
        )
      ],
    );
  }
}
