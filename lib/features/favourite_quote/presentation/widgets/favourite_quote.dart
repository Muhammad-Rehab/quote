import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/features/favourite_quote/data/models/fav_quote_model.dart';
import 'package:quotes/features/favourite_quote/presentation/widgets/remove_fav_icon.dart';

import '../cubit/fav_quote_cubit.dart';

class FavouriteQuoteWidget extends StatelessWidget {

  final FavouriteQuoteModel favouriteQuoteModel ;

  const FavouriteQuoteWidget({super.key, required this.favouriteQuoteModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor ,
          borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.only(bottom: 40, right: 10, left: 10, top: 15),
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            favouriteQuoteModel.content,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            favouriteQuoteModel.author,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          // InkWell(
          //   onTap: (){
          //     BlocProvider.of<FavouriteQuoteCubit>(context,listen: true).removeFavouriteQuote(favouriteQuoteModel);
          //   },
          //   child: Container(
          //     // padding: const EdgeInsets.all(10),
          //     margin: const EdgeInsets.only(top: 20),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle ,
          //       color: Theme.of(context).appBarTheme.titleTextStyle!.color ,
          //     ),
          //     child: const Icon( Icons.delete ,size: 35, color: Colors.white,),
          //   ),
          // ),
          RemoveFavouriteIcon(favouriteQuoteModel: favouriteQuoteModel),
        ],
      ),
    );
  }
}
