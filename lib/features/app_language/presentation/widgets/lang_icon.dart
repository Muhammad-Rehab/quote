
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/language_cubit.dart';

Widget langIcon ()
{
  return Builder(
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(8),
        child: IconButton(
            onPressed: (){
              BlocProvider.of<LanguageCubit>(context).toggleLanguage();
            },
            icon: const Icon(
                Icons.translate_outlined,
                color: Colors.black,
                size: 30,
            ),
        ),
      );
    }
  );
}