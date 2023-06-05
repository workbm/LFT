import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:lft_new_project/models/category_model.dart';
import 'package:lft_new_project/screens/home/home_page.dart';
import 'package:lft_new_project/screens/menu_categories/main_category_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/horizontal_gap.dart';
import '../../../provider/main_category_provider/main_category_provider.dart';

class MenuCardWidget extends StatefulWidget {
  const MenuCardWidget({super.key, required this.choice});
  final String choice;
  @override
  State<MenuCardWidget> createState() => _MenuCardWidgetState();
}

class _MenuCardWidgetState extends State<MenuCardWidget> {
  var _expand = false;
  @override
  Widget build(BuildContext context) {
    var categoriesMap = widget.choice.contains(ConstantsClass.accueilName)
        ? ConstantsClass.catygories[ConstantsClass.accueilName]
        : widget.choice.contains(ConstantsClass.laFamilleGourmandeName)
            ? ConstantsClass.catygories[ConstantsClass.laFamilleGourmandeName]
            : widget.choice.contains(ConstantsClass.laFamilleSamuseName)
                ? ConstantsClass.catygories[ConstantsClass.laFamilleSamuseName]
                : widget.choice.contains(ConstantsClass.laFamilleVisiteName)
                    ? ConstantsClass
                        .catygories[ConstantsClass.laFamilleVisiteName]
                    : widget.choice.contains(ConstantsClass.laFamilleShopName)
                        ? ConstantsClass
                            .catygories[ConstantsClass.laFamilleShopName]
                        : widget.choice.contains(ConstantsClass.agendaName)
                            ? ConstantsClass
                                .catygories[ConstantsClass.agendaName]
                            : ConstantsClass
                                .catygories[ConstantsClass.infosPratiquesName];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      shape: RoundedRectangleBorder(
        borderRadius: widget.choice.contains(ConstantsClass.accueilName)
            ? const BorderRadius.only(
                topLeft: Radius.circular(7), topRight: Radius.circular(7))
            : widget.choice.contains(ConstantsClass.infosPratiquesName)
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
                Image.asset(categoriesMap!['image'] as String),
                // widget.choice.contains(ConstantsClass.accueilName)
                //     ?
                //      Image.asset(
                //         Assets.img.home.path,
                //         color: CommonColors.yellow,
                //       )
                //     : widget.choice
                //             .contains(ConstantsClass.laFamilleGourmandeName)
                //         ? Image.asset(
                //             Assets.img.familleGourmande.path,
                //             color: CommonColors.red,
                //           )
                //         : widget.choice
                //                 .contains(ConstantsClass.laFamilleSamuseName)
                //             ? Image.asset(
                //                 Assets.img.familleSamuse.path,
                //                 color: CommonColors.orange,
                //               )
                //             : widget.choice.contains(
                //                     ConstantsClass.laFamilleVisiteName)
                //                 ? Image.asset(
                //                     Assets.img.familleVisite.path,
                //                     color: CommonColors.darkGreen,
                //                   )
                //                 : widget.choice.contains(
                //                         ConstantsClass.laFamilleShopName)
                //                     ? Image.asset(
                //                         Assets.img.familleShop.path,
                //                         color: CommonColors.blue,
                //                       )
                //                     : widget.choice
                //                             .contains(ConstantsClass.agendaName)
                //                         ? Image.asset(
                //                             Assets.img.agenda.path,
                //                             color: CommonColors.pink,
                //                           )
                //                         : Image.asset(
                //                             Assets.img.infoPratique.path,
                //                             color: CommonColors.black,
                //                           ),
                const HorizontalGap(width: 5),
                AutoSizeText(
                  categoriesMap['title'] as String,
                  // widget.choice == 1
                  //     ? (_choice1['title'] as String)
                  //     : widget.choice == 2
                  //         ? (_choice2['title'] as String)
                  //         : widget.choice == 3
                  //             ? (_choice3['title'] as String)
                  //             : widget.choice == 4
                  //                 ? (_choice4['title'] as String)
                  //                 : widget.choice == 5
                  //                     ? (_choice5['title'] as String)
                  //                     : widget.choice == 6
                  //                         ? (_choice6['title'] as String)
                  //                         : (_choice7['title'] as String),
                ),
              ],
            ),
            trailing: Icon(
              (_expand &&
                      !widget.choice.contains(ConstantsClass.accueilName) &&
                      !widget.choice.contains(ConstantsClass.agendaName))
                  ? Icons.expand_more
                  : Icons.chevron_right,
              color: CommonColors.darkGrey,
            ),
            onTap: () {
              if (widget.choice.contains(ConstantsClass.accueilName)) {
                Navigator.pushNamed(context, HomePage.routeName);
              } else {
                setState(() {
                  _expand = !_expand;
                });
              }
              // if (widget.choice.contains(ConstantsClass.agendaName)) {
              //   Navigator.pushNamed(context, agenda.routeName);
              // }
            },
          ),
          (_expand &&
                  !widget.choice.contains(ConstantsClass.accueilName) &&
                  !widget.choice.contains(ConstantsClass.agendaName))
              ? Column(
                  children: (categoriesMap['catygories'] as List<CategoryModel>)
                      // (widget.choice == 1
                      //         ? _choice1['elements'] as List<String>
                      //         : widget.choice == 2
                      //             ? _choice2['elements'] as List<String>
                      //             : widget.choice == 3
                      //                 ? _choice3['elements'] as List<String>
                      //                 : widget.choice == 4
                      //                     ? _choice4['elements'] as List<String>
                      //                     : widget.choice == 5
                      //                         ? _choice5['elements'] as List<String>
                      //                         : widget.choice == 6
                      //                             ? _choice6['elements']
                      //                                 as List<String>
                      //                             : _choice7['elements']
                      //                                 as List<String>)
                      .map((e) => GestureDetector(
                            onTap: widget.choice
                                    .contains(ConstantsClass.infosPratiquesName)
                                ? () {}
                                : () {
                                    context
                                        .read<MainCategoryProvider>()
                                        .getCategoryInfo(
                                            categoriesMap['title'] as String,
                                            categoriesMap['image'] as String,
                                            e.name,
                                            e.url,
                                            e.id,
                                            categoriesMap['catygories']
                                                as List<CategoryModel>);
                                    Navigator.pushNamed(
                                        context, MainCategoryScreen.routeName);
                                  },
                            child: ListTile(
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
                                    e.name,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  // static const _choice1 = {
  //   'title': 'Accueil',
  //   'elements': ['Accueil']
  // };
  // static const _choice2 = {
  //   'title': ConstantsClass.laFamilleGourmandeName,
  //   'elements': [
  //     'Petit déjeuner',
  //     'Déjeuner / Dîner',
  //     'Salon de thé/café',
  //     'Brunch',
  //   ],
  // };
  // static const _choice3 = {
  //   'title': ConstantsClass.laFamilleSamuseName,
  //   'elements': [
  //     'Plages',
  //     'Parcs',
  //     'Activités culturelles',
  //     'Activités nautiques',
  //   ],
  // };
  // static const _choice4 = {
  //   'title': ConstantsClass.laFamilleVisiteName,
  //   'elements': [
  //     'Lieux emblématiques',
  //     'Spots Instagramables',
  //     'Circuits',
  //   ],
  // };
  // static const _choice5 = {
  //   'title': ConstantsClass.laFamilleShopName,
  //   'elements': [
  //     'Boutiques artisanales/souvenirs',
  //     'Centres commerciaux',
  //     'Les marchés',
  //   ],
  // };
  // static const _choice6 = {
  //   'title': ConstantsClass.agendaName,
  //   'elements': [
  //     'Petit déjeuner',
  //     'Petit déjeuner / Dîner',
  //     'Salon de thé/café',
  //     'Brunch',
  //   ],
  // };
  // static const _choice7 = {
  //   'title': ConstantsClass.infosPratiquesName,
  //   'elements': [
  //     'Parkings gratuits',
  //     'Toilettes publiques',
  //     'Commissariats',
  //     'Bureau Change',
  //     'Station service',
  //     'Borne électrique',
  //   ],
  // };
}
