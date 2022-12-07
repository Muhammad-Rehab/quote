
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LanguageState extends Equatable
{
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class InitialState extends LanguageState {}


// ignore: must_be_immutable
class LanguageChangedState extends LanguageState
{
   Locale locale ;
   LanguageChangedState({required this.locale});

  @override
  List<Object?> get props => [locale];
}

class LanguageCacheErrorState extends LanguageState
{
  final String message ;
  const LanguageCacheErrorState({required this.message});

}
