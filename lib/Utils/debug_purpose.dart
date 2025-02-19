// ANSI color codes
import 'package:flutter/foundation.dart';

const String reset = '\x1B[0m';
const String red = '\x1B[31m';
const String green = '\x1B[32m';
const String yellow = '\x1B[33m';
const String blue = '\x1B[34m';
const String violet = '\x1B[35m';
const String magenta = '\x1B[35m';
const String pink = '\x1B[38;5;13m';

// Method to print green text
void printGreen(var message) {
  if (kDebugMode) {
    print('$green$message$reset');
  }
}

// Method to print red text
void printRed(var message) {
  if (kDebugMode) {
    print('$red$message$reset');
  }
}

// Method to print yellow text
void printYellow(var message) {
  if (kDebugMode) {
    print('$yellow$message$reset');
  }
}

// Method to print blue text
void printBlue(var message) {
  if (kDebugMode) {
    print('$blue$message$reset');
  }
}

// Method to print violet (magenta) text
void printViolet(var message) {
  if (kDebugMode) {
    print('$violet$message$reset');
  }
}

// Method to print magenta text
void printMagenta(var message) {
  if (kDebugMode) {
    print('$magenta$message$reset');
  }
}

// Method to print pink text
void printPink(var message) {
  if (kDebugMode) {
    print('$pink$message$reset');
  }
}
