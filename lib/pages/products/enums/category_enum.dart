import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CategoryEnum {
  industrial,
  residental,
  corporate;

  String get name {
    switch (this) {
      case CategoryEnum.industrial:
        return 'Industriais';
      case CategoryEnum.residental:
        return 'Residenciais';
      case CategoryEnum.corporate:
        return 'Corporativos';
    }
  }

  IconData get icon {
    switch (this) {
      case CategoryEnum.industrial:
        return FontAwesomeIcons.tractor;
      case CategoryEnum.residental:
        return FontAwesomeIcons.seedling;
      case CategoryEnum.corporate:
        return FontAwesomeIcons.helicopter;
    }
  }
}