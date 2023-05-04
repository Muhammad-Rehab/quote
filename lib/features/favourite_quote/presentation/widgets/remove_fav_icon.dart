
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quote_cubit.dart';

class RemoveFavouriteIcon extends StatelessWidget {
  final FavouriteQuoteModel favouriteQuoteModel ;

  const RemoveFavouriteIcon({super.key, required this.favouriteQuoteModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        BlocProvider.of<FavouriteQuoteCubit>(context).removeFavouriteQuote(favouriteQuoteModel);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle ,
          color: Theme.of(context).primaryColor ,
        ),
        child: const Icon( Icons.delete),
      ),
    );
  }
}
