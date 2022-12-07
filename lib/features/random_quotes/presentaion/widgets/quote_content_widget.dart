import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/core/widgets/error_widget.dart';

import '../cubit/random_quote_cubit.dart';
import '../cubit/randome_quote_state.dart';

class QuoteContentWidget extends StatefulWidget {
  const QuoteContentWidget({Key? key}) : super(key: key);

  @override
  State<QuoteContentWidget> createState() => _QuoteContentWidgetState();
}

class _QuoteContentWidgetState extends State<QuoteContentWidget> {
  _getRandomQuote()
  {
    BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
      builder: (context, state) {
        if (state is RandomQuoteIsLoading)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is RandomQuoteExceptionState)
        {
          return  Center(
            child: AppErrorWidget(
              onPress: (){
                _getRandomQuote();
              },
            ),
          );
        }
        else if (state is RandomQuoteLoaded)
        {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.titleTextStyle!.color,
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
                      state.quote.content,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      state.quote.author,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap:_getRandomQuote ,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle ,
                    color: Theme.of(context).appBarTheme.titleTextStyle!.color ,
                  ),
                  child: const Icon( Icons.refresh ,size: 35, color: Colors.white,),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
