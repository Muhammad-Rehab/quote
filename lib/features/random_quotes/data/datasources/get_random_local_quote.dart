
import 'dart:convert';

import 'package:quotes/core/errors/exceptions.dart';
import 'package:quotes/core/utilies/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/guote_model.dart';

abstract class GetRandomLocalQuote
{
  Future<QuoteModel> getRandomLocalQuote ();
  Future<void> cacheQuote (QuoteModel quoteModel);
}

class GetRandomLocalQuoteImpl extends GetRandomLocalQuote
{
  SharedPreferences sharedPreferences ;
  GetRandomLocalQuoteImpl({required this.sharedPreferences});
  @override
  Future<QuoteModel> getRandomLocalQuote()  {
    final  jsonStringQuote =  sharedPreferences.getString(AppStrings.cacheQuoteKey);
    if(jsonStringQuote != null)
      {
        return Future.value(QuoteModel.fromJson(json.decode(jsonStringQuote))) ;
      }else
        {
          throw CacheException();
        }
  }

  @override
  Future<void> cacheQuote (QuoteModel quoteModel)
  {
    return sharedPreferences.setString(
        AppStrings.cacheQuoteKey ,
        json.encode(quoteModel)
    );
  }
}