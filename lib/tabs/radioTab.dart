import 'package:flutter/material.dart';
import 'package:islami_app/myThemeData.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/radio_image.png"),
            SizedBox(
              height: 20,
            ),
            Text("إذاعة القران الكريم",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: MyThemeData.blackColor
            ),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               ImageIcon(AssetImage("assets/images/prev.png",),color: MyThemeData.primaryColor,),
                ImageIcon(AssetImage("assets/images/play.png"),color: MyThemeData.primaryColor,),
                ImageIcon(AssetImage("assets/images/next.png"),color: MyThemeData.primaryColor,)

              ],
            )
          ],
        ),
      ),
    );
  }
}
