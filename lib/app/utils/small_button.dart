import 'package:alfred_taxi_driver/app/themes/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    this.title = "Votre texte",
    this.color = AppColors.DBLUE,
    this.textcolor = AppColors.DWHITE0,
    this.actionPrincipale,
    this.actionSecondaire,
  }) : super(key: key);

  final title, color, textcolor, actionPrincipale, actionSecondaire;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      child: Text(
        '$title',
      ),
      onPressed: actionPrincipale,
    );
  }
}

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    this.title = "Votre texte",
    this.color = AppColors.DBLUE,
    this.textcolor = AppColors.DWHITE0,
    this.actionPrincipale,
    this.actionSecondaire,
  }) : super(key: key);

  final title, color, textcolor, actionPrincipale, actionSecondaire;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: color,
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          wordSpacing: 10,
          letterSpacing: 4,
        ),
      ),
      onPressed: actionPrincipale,
    );
  }
}
