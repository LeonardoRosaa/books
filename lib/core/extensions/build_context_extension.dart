import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {

  ThemeData get theme => Theme.of(this);
}