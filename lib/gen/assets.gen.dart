/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/chowmin.png
  AssetGenImage get chowmin => const AssetGenImage('assets/images/chowmin.png');

  /// File path: assets/images/coke.svg
  String get coke => 'assets/images/coke.svg';

  /// File path: assets/images/dollar.svg
  String get dollar => 'assets/images/dollar.svg';

  /// File path: assets/images/loading.gif
  AssetGenImage get loading => const AssetGenImage('assets/images/loading.gif');

  /// File path: assets/images/man.jpeg
  AssetGenImage get man => const AssetGenImage('assets/images/man.jpeg');

  /// File path: assets/images/menu.svg
  String get menu => 'assets/images/menu.svg';

  /// File path: assets/images/onion.png
  AssetGenImage get onion => const AssetGenImage('assets/images/onion.png');

  /// File path: assets/images/pizza-1.png
  AssetGenImage get pizza1 => const AssetGenImage('assets/images/pizza-1.png');

  /// File path: assets/images/pizza.png
  AssetGenImage get pizzaPng => const AssetGenImage('assets/images/pizza.png');

  /// File path: assets/images/pizza.svg
  String get pizzaSvg => 'assets/images/pizza.svg';

  /// File path: assets/images/salad.png
  AssetGenImage get salad => const AssetGenImage('assets/images/salad.png');

  /// File path: assets/images/sandwhich.png
  AssetGenImage get sandwhich =>
      const AssetGenImage('assets/images/sandwhich.png');

  /// File path: assets/images/sea-food.svg
  String get seaFood => 'assets/images/sea-food.svg';

  /// File path: assets/images/testImage.jpeg
  AssetGenImage get testImage =>
      const AssetGenImage('assets/images/testImage.jpeg');

  /// File path: assets/images/tomato.png
  AssetGenImage get tomato => const AssetGenImage('assets/images/tomato.png');

  /// List of all assets
  List<dynamic> get values => [
        chowmin,
        coke,
        dollar,
        loading,
        man,
        menu,
        onion,
        pizza1,
        pizzaPng,
        pizzaSvg,
        salad,
        sandwhich,
        seaFood,
        testImage,
        tomato
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
