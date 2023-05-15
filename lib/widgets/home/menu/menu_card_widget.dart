import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/horizontal_gap.dart';

class MenuCardWidget extends StatefulWidget {
  const MenuCardWidget({super.key, required this.choice});
  final int choice;
  @override
  State<MenuCardWidget> createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: widget.choice == 1
            ? const BorderRadius.only(
                topLeft: Radius.circular(7), topRight: Radius.circular(7))
            : widget.choice == 7
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7))
                : BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          ListTile(
            dense: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.choice == 1
                    ? Image.asset(
                        'assets/img/home.png',
                        color: CommonColors.yellow,
                      )
                    : widget.choice == 2
                        ? Image.asset(
                            'assets/img/famille-gourmande.png',
                            color: CommonColors.red,
                          )
                        : widget.choice == 3
                            ? Image.asset(
                                'assets/img/famille-samuse.png',
                                color: CommonColors.orange,
                              )
                            : widget.choice == 4
                                ? Image.asset(
                                    'assets/img/famille-visite.png',
                                    color: CommonColors.darkGreen,
                                  )
                                : widget.choice == 5
                                    ? Image.asset(
                                        'assets/img/famille-shop.png',
                                        color: CommonColors.blue,
                                      )
                                    : widget.choice == 6
                                        ? Image.asset(
                                            'assets/img/agenda.png',
                                            color: CommonColors.pink,
                                          )
                                        : Image.asset(
                                            'assets/img/info-pratique.png',
                                            color: CommonColors.black,
                                          ),
                const HorizontalGap(width: 5),
                AutoSizeText(
                  widget.choice == 1
                      ? (_choice1['title'] as String)
                      : widget.choice == 2
                          ? (_choice2['title'] as String)
                          : widget.choice == 3
                              ? (_choice3['title'] as String)
                              : widget.choice == 4
                                  ? (_choice4['title'] as String)
                                  : widget.choice == 5
                                      ? (_choice5['title'] as String)
                                      : widget.choice == 6
                                          ? (_choice6['title'] as String)
                                          : (_choice7['title'] as String),
                ),
              ],
            ),
            trailing: Icon(
              _expand ? Icons.expand_more : Icons.chevron_right,
              color: CommonColors.darkGrey,
              // size: .w,
            ),
            onTap: () {
              setState(() {
                _expand = !_expand;
              });
            },
          ),
          (_expand && widget.choice != 1 && widget.choice != 6)
              ? Column(
                  children: (widget.choice == 1
                          ? _choice1['elements'] as List<String>
                          : widget.choice == 2
                              ? _choice2['elements'] as List<String>
                              : widget.choice == 3
                                  ? _choice3['elements'] as List<String>
                                  : widget.choice == 4
                                      ? _choice4['elements'] as List<String>
                                      : widget.choice == 5
                                          ? _choice5['elements'] as List<String>
                                          : widget.choice == 6
                                              ? _choice6['elements']
                                                  as List<String>
                                              : _choice7['elements']
                                                  as List<String>)
                      .map((text) => ListTile(
                            dense: true,
                            title: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.toc,
                                  color: Colors.transparent,
                                ),
                                const HorizontalGap(width: 5),
                                AutoSizeText(
                                  text,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  static const _choice1 = {
    'title': 'Accueil',
    'elements': ['Accueil']
  };
  static const _choice2 = {
    'title': 'La famille gourmande',
    'elements': [
      'Petit déjeuner',
      'Déjeuner / Dîner',
      'Salon de thé/café',
      'Brunch',
    ],
  };
  static const _choice3 = {
    'title': 'La famille S’amuse',
    'elements': [
      'Plages',
      'Parcs',
      'Activités culturelles',
      'Activités nautiques',
    ],
  };
  static const _choice4 = {
    'title': 'La famille découvre/visite',
    'elements': [
      'Lieux emblématiques',
      'Spots Instagramables',
      'Circuits',
    ],
  };
  static const _choice5 = {
    'title': 'La famille shoppe',
    'elements': [
      'Boutiques artisanales/souvenirs',
      'Centres commerciaux',
      'Les marchés',
    ],
  };
  static const _choice6 = {
    'title': 'Agenda',
    'elements': [
      'Petit déjeuner',
      'Petit déjeuner / Dîner',
      'Salon de thé/café',
      'Brunch',
    ],
  };
  static const _choice7 = {
    'title': 'Info pratique',
    'elements': [
      'Parkings gratuits',
      'Toilettes publiques',
      'Commissariats',
      'Bureau Change',
      'Station service',
      'Borne électrique',
    ],
  };
}
