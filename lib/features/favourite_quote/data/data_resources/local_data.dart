import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quotes/core/errors/failiers.dart';
import 'package:quotes/core/utilies/app_strings.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class LocalFavQuote {
  Future<List<FavouriteQuoteModel>> getFavQuotes();

  Future<bool> storeFavQuote(FavouriteQuoteModel favouriteQuoteModel);

  Future<List<FavouriteQuoteModel>> removeFavQuote(FavouriteQuoteModel favouriteQuoteModel);
}

class LocalFavQuoteImp implements LocalFavQuote {
  final SharedPreferences sharedPreference;

  const LocalFavQuoteImp({
    required this.sharedPreference,
  });

  @override
  Future<List<FavouriteQuoteModel>> getFavQuotes() async {
    var favQuotes =
        sharedPreference.getString(AppStrings.cashFavouriteQuotesKey);
    if (favQuotes == null || favQuotes.isEmpty) {
      return [];
    } else {
      List<FavouriteQuoteModel> hold = [];
      var data = json.decode(favQuotes);
      List jsonMap = data['quoteList'] as List;
      for (var value in jsonMap) {
        hold.add(FavouriteQuoteModel.fromJson(value));
      }
      return hold;
    }
  }

  @override
  Future<bool> storeFavQuote(
      FavouriteQuoteModel favouriteQuoteModel) async {
    List<FavouriteQuoteModel> hold = await getFavQuotes();
    if (!hold.contains(favouriteQuoteModel)) {
      hold.add(favouriteQuoteModel);
      Map<String, dynamic> data = {'quoteList': hold};
      sharedPreference.setString(
          AppStrings.cashFavouriteQuotesKey, jsonEncode(data));
      return true ;
    }
    return false;
  }

  @override
  Future<List<FavouriteQuoteModel>> removeFavQuote(FavouriteQuoteModel favouriteQuoteModel) async {
    List<FavouriteQuoteModel> hold = await getFavQuotes();
    hold.remove(favouriteQuoteModel);
    Map<String, dynamic> data = {'quoteList': hold};
    sharedPreference.setString(
        AppStrings.cashFavouriteQuotesKey, jsonEncode(data));
    return hold ;
  }
}
