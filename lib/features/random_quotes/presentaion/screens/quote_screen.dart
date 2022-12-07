import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';
import 'package:quotes/features/random_quotes/presentaion/widgets/quote_content_widget.dart';
import '../../../app_language/presentation/widgets/lang_icon.dart';

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
    return  const  QuoteContentWidget();
  }

  @override
  Widget build(BuildContext context)
  {
    final appBar = AppBar (
     title: Text(
       AppLanguage.appName.getString(context) ,
     ),
      leading: langIcon(),
    ) ;
    return  Scaffold(
      appBar: appBar ,
      body: _quotePage() ,
    );
  }
}
