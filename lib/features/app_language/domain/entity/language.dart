
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class Language extends Equatable
{
  Locale locale ;

  Language({required this.locale});

  @override
  List<Object?> get props => [locale];
}