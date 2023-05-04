
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';

import '../cubic/app_theme_cubit.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        BlocProvider.of<AppThemeCubit>(context).toggleAppTheme();
      },
      title:  Text(
        AppLanguage.changeTheme.getString(context),
        style:Theme.of(context).textTheme.bodySmall ,
      ),
    );
  }
}
