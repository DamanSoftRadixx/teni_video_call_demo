import 'dart:io';
import 'package:teni_video_call_demo/core/theme/color_schemes.dart'
    show AppColorSchemes;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;
import '../constants/image_resource.dart';

/// Enum for supported asset types
enum CommonImageType { png, svg, file, network }

/// Model for image asset
class CommonImageAsset {
  final String path;
  final CommonImageType type;
  final File? file;

  CommonImageAsset({required this.path, required this.type, this.file});
}

/// Common image loader widget
class CommonImageLoader extends StatelessWidget {
  final CommonImageAsset asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final bool isCircular;
  final bool flipX;
  final File? file;
  final String? placeholder;
  final int? cacheWidth;
  final int? cacheHeight;
  final Function(double progress)? onProgress;

  const CommonImageLoader({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.fit,
    this.isCircular = false,
    this.flipX = false,
    this.file,
    this.placeholder,
    this.cacheWidth,
    this.cacheHeight,
    this.onProgress,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    switch (asset.type) {
      case CommonImageType.png:
        imageWidget = Image.asset(
          asset.path,
          width: width,
          height: height,
          color: color,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            print('==========error: $error');
            return _placeholderWidget();
          },
        );
        break;
      case CommonImageType.svg:
        imageWidget = asset.path.isNotEmpty
            ? SvgPicture.asset(
                asset.path,
                width: width,
                height: height,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
                fit: fit ?? BoxFit.contain,
                placeholderBuilder: (context) => _placeholderWidget(),
              )
            : _placeholderWidget();
        break;
      case CommonImageType.file:
        if (asset.file != null) {
          imageWidget = Image.file(
            asset.file!,
            width: width,
            height: height,
            color: color,
            fit: fit ?? BoxFit.contain,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
            errorBuilder: (context, error, stackTrace) => _placeholderWidget(),
          );
        } else {
          imageWidget = _placeholderWidget();
        }
        break;
      case CommonImageType.network:
        imageWidget = CachedNetworkImage(
          imageUrl: asset.path,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          errorListener: (error) {
            print('==========error: $error');
          },
          placeholder: (context, url) => _placeholderWidget(),
          errorWidget: (context, url, error) => _placeholderWidget(),
        );
        break;
    }
    if (isCircular) {
      imageWidget = ClipOval(child: imageWidget);
    }
    if (flipX) {
      imageWidget = Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(3.1416),
        child: imageWidget,
      );
    }
    return imageWidget;
  }

  Widget _placeholderWidget() {
    if (placeholder == null) {
      return Container(
        width: width,
        height: height,
        color: Colors.red,
        child: Shimmer.fromColors(
          baseColor: AppColorSchemes.lightColorScheme.primary,
          highlightColor: Colors.transparent,
          child: Container(color: AppColorSchemes.lightColorScheme.primary),
        ),
      );
    }
    return Image.asset(
      placeholder ?? ImageResource.splashBg,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      color: color,
    );
  }

  Widget _progressWidget(double value) {
    return Center(
      child: SizedBox(
        width: width ?? 24,
        height: height ?? 24,
        child: CircularProgressIndicator(
          value: value > 0 && value < 1 ? value : null,
        ),
      ),
    );
  }
}
