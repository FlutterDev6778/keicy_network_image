library keicy_network_image;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keicy_cupertino_indicator/keicy_cupertino_indicator.dart';

@immutable
class KeicyNetworkImage extends StatelessWidget {
  const KeicyNetworkImage({
    Key key,
    @required this.url,
    @required this.width,
    @required this.height,
    this.boxFit = BoxFit.cover,
    this.errorTextColor = Colors.blue,
    this.errorTextFontSize = 15.0,
    this.borderColor = Colors.white,
    this.borderWidth = 0,
    this.borderRadius = 0.0,
    this.brightness = Brightness.light,
  }) : super(key: key);
  final String url;
  final double width;
  final double height;
  final Color errorTextColor;
  final BoxFit boxFit;
  final double errorTextFontSize;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    if (url != "" && url != null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(double.parse(borderRadius.toString())),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(double.parse(borderRadius.toString())),
          child: Image.network(
            url,
            width: width,
            height: height,
            fit: boxFit,
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: width,
                height: height,
                child: Center(
                  child: KeicyCupertinoIndicator(
                    size: height / 5,
                    brightness: brightness,
                  ),
                ),
              );
            },
            errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Container(
                width: width,
                height: height,
                child: Center(
                  child: Icon(
                    Icons.not_interested,
                    size: height / 2,
                    color: errorTextColor,
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(double.parse(borderRadius.toString())),
        ),
        child: Center(
          child: Icon(
            Icons.not_interested,
            size: height / 2,
            color: errorTextColor,
          ),
        ),
      );
    }
  }
}
