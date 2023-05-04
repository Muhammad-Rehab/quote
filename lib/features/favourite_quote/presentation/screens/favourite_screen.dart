import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quote_cubit.dart';
import 'package:quotes/features/favourite_quote/presentation/cubit/fav_quotes_states.dart';

import '../../../../core/widgets/error_widget.dart';
import '../widgets/favourite_quote.dart';



class FavouriteScreen extends StatefulWidget {
   const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  _getFavouriteQuotes()
  {
    BlocProvider.of<FavouriteQuoteCubit>(context).getFavouriteQuotes();
  }


  @override
  void initState() {
    super.initState();
    _getFavouriteQuotes();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar (
      title:  Text(
          AppLanguage.favouriteQuotes.getString(context) ,
      ),
      leading: IconButton(
        onPressed: ()
        {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
    ) ;
    return Scaffold(
      appBar: appBar,
      body: BlocBuilder<FavouriteQuoteCubit,FavouriteQuoteState>(
          builder: (context, state)
          {
            if(state is FavouriteIsLoadingState)
            {
              return const Center(child: CircularProgressIndicator(),);
            }
            else if (state is FavouriteLoadedState)
            {
              return ListView.builder(
                itemCount: state.favouriteQuotes.length ,
                itemBuilder: (_,index) => FavouriteQuoteWidget(favouriteQuoteModel: state.favouriteQuotes[index],),
              );
            }
            else if (state is FavouriteErrorState)
            {
              return const AppErrorWidget();
            }
            else if(state is FavouriteRemovedState)
              {
                  return ListView.builder(
                    itemCount: state.favouriteQuotes.length ,
                    itemBuilder: (_,index)=>FavouriteQuoteWidget(favouriteQuoteModel: state.favouriteQuotes[index],),
                  );
              }
            else
            {
              return const Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}
