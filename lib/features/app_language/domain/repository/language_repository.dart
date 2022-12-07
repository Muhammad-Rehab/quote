

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quotes/core/errors/failiers.dart';

abstract class LanguageRepository
{
 Future< Either<Failure,Locale>> toggleLanguage () ;
 Future<Either<Failure,Locale>> initLanguage();
}