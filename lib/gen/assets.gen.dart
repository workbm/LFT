/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/Scroll-1.png
  AssetGenImage get scroll1 => const AssetGenImage('assets/img/Scroll-1.png');

  /// File path: assets/img/Scroll-2.png
  AssetGenImage get scroll2 => const AssetGenImage('assets/img/Scroll-2.png');

  /// File path: assets/img/Scroll-3.png
  AssetGenImage get scroll3 => const AssetGenImage('assets/img/Scroll-3.png');

  /// File path: assets/img/Scroll.png
  AssetGenImage get scroll => const AssetGenImage('assets/img/Scroll.png');

  /// File path: assets/img/agenda.png
  AssetGenImage get agenda => const AssetGenImage('assets/img/agenda.png');

  /// File path: assets/img/background-image-login.png
  AssetGenImage get backgroundImageLogin =>
      const AssetGenImage('assets/img/background-image-login.png');

  /// File path: assets/img/comment.png
  AssetGenImage get comment => const AssetGenImage('assets/img/comment.png');

  /// File path: assets/img/famille-gourmande.png
  AssetGenImage get familleGourmande =>
      const AssetGenImage('assets/img/famille-gourmande.png');

  /// File path: assets/img/famille-samuse.png
  AssetGenImage get familleSamuse =>
      const AssetGenImage('assets/img/famille-samuse.png');

  /// File path: assets/img/famille-shop.png
  AssetGenImage get familleShop =>
      const AssetGenImage('assets/img/famille-shop.png');

  /// File path: assets/img/famille-visite.png
  AssetGenImage get familleVisite =>
      const AssetGenImage('assets/img/famille-visite.png');

  /// File path: assets/img/google-icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/img/google-icon.png');

  /// File path: assets/img/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/img/heart.png');

  /// File path: assets/img/home.png
  AssetGenImage get home => const AssetGenImage('assets/img/home.png');

  /// File path: assets/img/info-pratique.png
  AssetGenImage get infoPratique =>
      const AssetGenImage('assets/img/info-pratique.png');

  /// File path: assets/img/location.png
  AssetGenImage get location => const AssetGenImage('assets/img/location.png');

  /// File path: assets/img/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/img/menu.png');

  /// File path: assets/img/object1.png
  AssetGenImage get object1 => const AssetGenImage('assets/img/object1.png');

  /// File path: assets/img/profile-icon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/img/profile-icon.png');

  /// File path: assets/img/time.png
  AssetGenImage get time => const AssetGenImage('assets/img/time.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        scroll1,
        scroll2,
        scroll3,
        scroll,
        agenda,
        backgroundImageLogin,
        comment,
        familleGourmande,
        familleSamuse,
        familleShop,
        familleVisite,
        googleIcon,
        heart,
        home,
        infoPratique,
        location,
        menu,
        object1,
        profileIcon,
        time
      ];
}

class Assets {
  Assets._();

  static const $AssetsImgGen img = $AssetsImgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
