import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:quotes/config/app_language/provided_language.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback ? onPress ;
  const AppErrorWidget({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 170,
            color: Theme.of(context).appBarTheme.titleTextStyle!.color,
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            AppLanguage.somethingWentWrong.getString(context),
            style:const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           Text(
            AppLanguage.tryAgain.getString(context),
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              if(onPress != null )
                {
                  onPress!();
                }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                borderRadius: BorderRadius.circular(50),
              ),
              child:  Text(
                AppLanguage.reloadScreen.getString(context),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
