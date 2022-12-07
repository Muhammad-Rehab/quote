
import 'package:quotes/features/app_language/domain/repository/language_repository.dart';

class InitLanguage
{
  LanguageRepository languageRepository;
  InitLanguage({required this.languageRepository});

  call ()=> languageRepository.initLanguage();
}