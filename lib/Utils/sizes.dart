import 'package:flutter/cupertino.dart';

class OffiqlSizes {
  static final OffiqlSizes _instance = OffiqlSizes._internal();

  OffiqlSizes._internal();

  // Factory constructor
  factory OffiqlSizes({BoxConstraints? constraints, Orientation? orientation}) {
    if (constraints != null && orientation != null) {
      _instance.initialize(
          constraints, orientation); // Initialize if parameters are provided
    }
    return _instance;
  }

  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;

  static double _verticalBlockSize = 0.0;
  static double _horizontalBlockSize = 0.0;

  static double _textMultiplier = 0.0;
  static double _heightMultiplier = 0.0;
  static double _imageSizeMultiplier = 0.0;

  get screenWidth => _screenWidth;

  get screenHeight => _screenHeight;

  get verticalBlockSize => _verticalBlockSize;

  get horizontalBlockSize => _horizontalBlockSize;

  get textMultiplier => _textMultiplier;

  get imageSizeMultiplier => _imageSizeMultiplier;

  get heightMultiplier => _heightMultiplier;

  get horizontalGapSize => _horizontalBlockSize * 2.5;

  get verticalGapSize => _verticalBlockSize * 2.5;

  double getHorizontalGapSize({double? horizontalGapSizeInPercent}) {
    if (horizontalGapSizeInPercent == null) {
      return horizontalGapSize;
    } else {
      return _horizontalBlockSize * horizontalGapSizeInPercent;
    }
  }

  double getVerticalGapSize({double? verticalGapSizeInPercent}) {
    if (verticalGapSizeInPercent == null) {
      return verticalGapSize;
    } else {
      return _verticalBlockSize * verticalGapSizeInPercent;
    }
  }

  void initialize(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    _verticalBlockSize = _screenHeight / 100;
    _horizontalBlockSize = _screenWidth / 100;

    _textMultiplier = _verticalBlockSize;
    _imageSizeMultiplier = _horizontalBlockSize;
    _heightMultiplier = _verticalBlockSize;
  }
}
