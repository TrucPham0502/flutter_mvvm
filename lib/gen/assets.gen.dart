/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

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
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
