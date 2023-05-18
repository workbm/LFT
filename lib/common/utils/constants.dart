import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/models/category_model.dart';

import '../../gen/assets.gen.dart';

class ConstantsClass {
  static const image = 'assets/img/';
  // Accueil
  static const accueilName = 'Accueil';
  static const accueilImage = 'assets/img/home.png';
  // LA FAMILLE GOURMANDE
  static const laFamilleGourmandeName = 'La famille gourmande';
  static const laFamilleGourmandeImage = 'assets/img/famille-gourmande.png';
  // LA FAMILLE S'AMUSE
  static const laFamilleSamuseName = 'La famille s\'amuse';
  static const laFamilleSamuseImage = 'assets/img/famille-samuse.png';
  // LA FAMILLE DÉCOUVRE/VISITE
  static const laFamilleVisiteName = 'La famille découvre/visite';
  static const laFamilleVisiteImage = 'assets/img/famille-visite.png';
  // LA FAMILLE SHOP
  static const laFamilleShopName = 'La famille shoppe';
  static const laFamilleShopImage = 'assets/img/famille-shop.png';
  // AGENDA
  static const agendaName = 'Agenda';
  static const agendaImage = 'assets/img/agenda.png';
  // INFO PRATIQUE
  static const infosPratiquesName = 'Infos pratiques';
  static const infosPratiquesImage = 'assets/img/info-pratique.png';

  static final catygories = {
    ConstantsClass.accueilName: {
      'title': ConstantsClass.accueilName,
      'image': Assets.img.home.path,
      'api': '',
      'catygories': [],
    },
    ConstantsClass.laFamilleVisiteName: {
      'title': ConstantsClass.laFamilleVisiteName,
      'image': Assets.img.familleVisite.path,
      'api': Api.visiteByCategory,
      'catygories': [
        CategoryModel(id: 1, name: 'category 1', url: Api.visiteByCategory),
        CategoryModel(id: 2, name: 'category 2', url: Api.visiteByCategory),
        CategoryModel(id: 3, name: 'category 3', url: Api.visiteByCategory),
      ],
    },
    ConstantsClass.laFamilleSamuseName: {
      'title': ConstantsClass.laFamilleSamuseName,
      'image': Assets.img.familleSamuse.path,
      'api': Api.activitiesByCategory,
      'catygories': [
        CategoryModel(id: 1, name: 'EN FAMILLE', url: Api.activitiesByCategory),
        CategoryModel(id: 2, name: 'EN COUPLE', url: Api.activitiesByCategory),
        CategoryModel(id: 5, name: 'INTÉRIEUR', url: Api.activitiesByCategory),
        CategoryModel(id: 6, name: 'INTÉRIEUR', url: Api.activitiesByCategory),
        CategoryModel(
            id: 7, name: 'ACTIVITÉS PAYANTES', url: Api.activitiesByCategory),
        CategoryModel(
            id: 9, name: 'ACTIVITÉS GRATUITES', url: Api.activitiesByCategory),
      ],
    },
    ConstantsClass.laFamilleGourmandeName: {
      'title': ConstantsClass.laFamilleGourmandeName,
      'image': Assets.img.familleGourmande.path,
      'api': Api.restaurantByCategory,
      'catygories': [
        CategoryModel(
            id: 1, name: 'Petit dejeuner', url: Api.restaurantByCategory),
        CategoryModel(
            id: 2, name: 'Dejeuner & diner', url: Api.restaurantByCategory),
        CategoryModel(
            id: 3,
            name: 'Goûters & Patisseries',
            url: Api.restaurantByCategory),
        CategoryModel(id: 10, name: 'Brunch', url: Api.restaurantByCategory),
        // {'id': 1, 'name': 'Petit dejeuner'},
        // {'id': 2, 'name': 'Dejeuner & diner'},
        // {'id': 3, 'name': 'Goûters & Patisseries'},
        // {'id': 10, 'name': 'Brunch'}
      ],
    },
    ConstantsClass.laFamilleShopName: {
      'title': ConstantsClass.laFamilleShopName,
      'image': Assets.img.familleShop.path,
      'api': Api.shopByCategory,
      'catygories': [
        CategoryModel(
            id: 1, name: 'Centres commerciaux', url: Api.shopByCategory),
        CategoryModel(
            id: 2, name: 'Boutiques de souvenirs', url: Api.shopByCategory),
        // {'id': 1, 'name': 'Centres commerciaux'},
        // {'id': 2, 'name': 'Boutiques de souvenirs'}
      ],
    },
    ConstantsClass.agendaName: {
      'title': ConstantsClass.agendaName,
      'image': Assets.img.agenda.path,
      'api': '',
      'catygories': [],
    },
    ConstantsClass.infosPratiquesName: {
      'title': ConstantsClass.infosPratiquesName,
      'image': Assets.img.infoPratique.path,
      'api': Api.restaurantByCategory,
      'catygories': [
        CategoryModel(
            id: 1, name: 'Petit dejeuner', url: Api.restaurantByCategory),
        CategoryModel(
            id: 2, name: 'Dejeuner & diner', url: Api.restaurantByCategory),
        CategoryModel(
            id: 3,
            name: 'Goûters & Patisseries',
            url: Api.restaurantByCategory),
        CategoryModel(id: 10, name: 'Brunch', url: Api.restaurantByCategory),
      ],
    },
  };
}

// Origin Categories
//static const catygories = {
//   'publicPlaceCategpries': {
//     'title': '',
//     'api': '',
//     'catygories': [
//       {'id': 1, 'name': 'category 1'},
//       {'id': 2, 'name': 'category 2'},
//       {'id': 3, 'name': 'category 3'}
//     ],
//   },
//   'activityCategories': {
//     'title': '',
//     'api': '',
//     'catygories': [
//       {'id': 1, 'name': 'EN FAMILLE'},
//       {'id': 2, 'name': 'EN COUPLE'},
//       {'id': 5, 'name': 'INTÉRIEUR'},
//       {'id': 6, 'name': 'EXTÉRIEUR'},
//       {'id': 7, 'name': 'ACTIVITÉS PAYANTES'},
//       {'id': 9, 'name': 'ACTIVITÉS GRATUITES'}
//     ],
//   },
//   'restaurantCategories': {
//     'title': '',
//     'api': '',
//     'catygories': [
//       {'id': 1, 'name': 'Petit dejeuner'},
//       {'id': 2, 'name': 'Dejeuner & diner'},
//       {'id': 3, 'name': 'Goûters & Patisseries'},
//       {'id': 10, 'name': 'Brunch'}
//     ],
//   },
//   'shoppingCategories': {
//     'title': '',
//     'api': '',
//     'catygories': [
//       {'id': 1, 'name': 'Centres commerciaux'},
//       {'id': 2, 'name': 'Boutiques de souvenirs'}
//     ] ,
//   },
// };
