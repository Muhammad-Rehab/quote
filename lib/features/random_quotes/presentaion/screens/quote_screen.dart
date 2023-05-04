import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';
import 'package:quotes/features/app_language/presentation/cubit/language_cubit.dart';
import 'package:quotes/features/app_theme/presentation/cubic/app_theme_cubit.dart';
import 'package:quotes/features/app_theme/presentation/widgets/chage_theme_widget.dart';
import 'package:quotes/features/favourite_quote/presentation/screens/favourite_screen.dart';
import 'package:quotes/features/local_notification/presentation/cubit/notification_cubit.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';
import 'package:quotes/features/random_quotes/presentaion/widgets/quote_content_widget.dart';

import '../../../../core/server_locator/injection_container.dart';
import '../../../app_theme/data/data_sources/app_theme_data.dart';


class QuoteScreen extends StatefulWidget
{
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen>
{
  Widget _quotePage ()
  {
    return const QuoteContentWidget();
  }

  @override
  Widget build(BuildContext context)
  {
    final appBar = AppBar (
     title: Text(
       AppLanguage.appName.getString(context) ,
     ),
      // leading: langIcon(),
    ) ;
    return  Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
             DrawerHeader(
                 decoration: BoxDecoration(color: Theme.of(context).primaryColor) ,
                 child: Center(
                   child: Text(
                       AppLanguage.appName.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium ,
                   ),
                 ),
             ),
            ListTile(
              onTap: (){
                BlocProvider.of<LanguageCubit>(context).toggleLanguage() ;
              },
              title:  Text(
                  AppLanguage.changeLanguage.getString(context),
                  style: Theme.of(context).textTheme.bodySmall ,
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const FavouriteScreen()));
              },
              title:  Text(
                AppLanguage.favouriteQuotes.getString(context),
                style:Theme.of(context).textTheme.bodySmall ,
              ),
            ),
            const ChangeThemeWidget(),
            ListTile(
              onTap: (){
                BlocProvider.of<AppNotificationCubit>(context).enableNotification(
                    true, 34, const Quote(
                    author: 'Ahmed', id: 'df', content: 'Hello world'));
              },
              title:  Text(
                'Enable Notification',
                style:Theme.of(context).textTheme.bodySmall ,
              ),
            ),

          ],
        ),
      ),
      appBar: appBar ,
      body: _quotePage() ,
    );
  }
}
