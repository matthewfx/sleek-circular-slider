import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/configuration/CircularSliderColors.dart';
import 'package:sleek_circular_slider/configuration/CircularSliderFeatures.dart';
import 'package:sleek_circular_slider/configuration/CircularSliderGeometry.dart';

typedef String PercentageModifier(double percentage);

class CircularSliderAppearance {
  static const double _defaultGradientStartAngle = 0.0;
  static const double _defaultGradientEndAngle = 180.0;
  static const double _defaultTrackGradientStartAngle = 0.0;
  static const double _defaultTrackGradientEndAngle = 180.0;
  static const double _defaultShadowMaxOpacity = 0.2;

  static const bool _defaultDynamicGradient = false;

  String _defaultPercentageModifier(double value) {
    final roundedValue = value.ceil();
    return '$roundedValue %';
  }

  static const defaultGeometry = CircularSliderGeometry();
  static const defaultColors = CircularSliderColors();
  static const defaultFeatures = CircularSliderFeatures();

  final CircularSliderGeometry settings;
  final CircularSliderColors colors;
  final CircularSliderFeatures features;

  final double animDurationMultiplier;
  final int spinnerDuration;
  final CustomSliderWidths customWidths;
  final CustomSliderColors customColors;
  final InfoProperties infoProperties;

  double get trackWidth => customWidths?.trackWidth ?? progressBarWidth / 4.0;
  double get progressBarWidth =>
      customWidths?.progressBarWidth ?? settings.size / 10.0;
  double get handlerSize => customWidths?.handlerSize ?? progressBarWidth / 5.0;
  double get shadowWidth => customWidths?.shadowWidth ?? progressBarWidth * 1.4;

  double get gradientStartAngle =>
      customColors?.gradientStartAngle ?? _defaultGradientStartAngle;
  double get gradientStopAngle =>
      customColors?.gradientEndAngle ?? _defaultGradientEndAngle;
  double get trackGradientStartAngle =>
      customColors?.trackGradientStartAngle ?? _defaultTrackGradientStartAngle;
  double get trackGradientStopAngle =>
      customColors?.trackGradientEndAngle ?? _defaultTrackGradientEndAngle;
  bool get dynamicGradient =>
      customColors?.dynamicGradient ?? _defaultDynamicGradient;

  double get shadowMaxOpacity =>
      customColors?.shadowMaxOpacity ?? _defaultShadowMaxOpacity;
  double get shadowStep => customColors?.shadowStep;

  PercentageModifier get infoModifier =>
      infoProperties?.modifier ?? _defaultPercentageModifier;
  String get infoTopLabelText => infoProperties?.topLabelText;
  String get infoBottomLabelText => infoProperties?.bottomLabelText ?? null;

  TextStyle get infoMainLabelStyle =>
      infoProperties?.mainLabelStyle ??
      TextStyle(
          fontWeight: FontWeight.w100,
          fontSize: settings.size / 5.0,
          color: Color.fromRGBO(30, 0, 59, 1.0));

  TextStyle get infoTopLabelStyle =>
      infoProperties?.topLabelStyle ??
      TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: settings.size / 10.0,
          color: Color.fromRGBO(147, 81, 120, 1.0));

  TextStyle get infoBottomLabelStyle =>
      infoProperties?.bottomLabelStyle ??
      TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: settings.size / 10.0,
          color: Color.fromRGBO(147, 81, 120, 1.0));

  const CircularSliderAppearance({
    this.settings = defaultGeometry,
    this.colors = defaultColors,
    this.features = defaultFeatures,
    this.customWidths,
    this.customColors,
    this.infoProperties,
    this.spinnerDuration = 1500,
    this.animDurationMultiplier = 1.0,
  });
}

class CustomSliderWidths {
  final double trackWidth;
  final double progressBarWidth;
  final double handlerSize;
  final double shadowWidth;

  CustomSliderWidths(
      {this.trackWidth,
      this.progressBarWidth,
      this.handlerSize,
      this.shadowWidth});
}

class CustomSliderColors {
  final double gradientStartAngle;
  final double gradientEndAngle;
  final double trackGradientStartAngle;
  final double trackGradientEndAngle;
  final bool dynamicGradient;

  final double shadowMaxOpacity;
  final double shadowStep;

  CustomSliderColors(
      {this.gradientStartAngle,
      this.gradientEndAngle,
      this.trackGradientStartAngle,
      this.trackGradientEndAngle,
      this.shadowMaxOpacity,
      this.shadowStep,
      this.dynamicGradient = false});
}

class InfoProperties {
  final PercentageModifier modifier;
  final TextStyle mainLabelStyle;
  final TextStyle topLabelStyle;
  final TextStyle bottomLabelStyle;
  final String topLabelText;
  final String bottomLabelText;

  InfoProperties(
      {this.topLabelText,
      this.bottomLabelText,
      this.mainLabelStyle,
      this.topLabelStyle,
      this.bottomLabelStyle,
      this.modifier});
}
