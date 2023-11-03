import 'package:flutter/material.dart';
import 'package:islami_app/myThemeData.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله ',
    'لا اله الا الله',
    'الله اكبر '
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/sebhabody.png"),
            SizedBox(
              height: 40,
            ),
            Text(
              "عدد التسبيحات",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color:provider.isDarkMode()?MyThemeData.whiteColor : MyThemeData.blackColor),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 65,
              width: 50,
              decoration: BoxDecoration(
                  color: MyThemeData.primaryLight.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(14)),
              child: Center(
                  child: Text(
                "$counter",
                style: Theme.of(context).textTheme.bodySmall,
              )),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(140, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: MyThemeData.primaryLight),
                onPressed: () {
                  counter++;
                  if (counter > 33) {
                    index++;
                    counter = 0;
                    if(index==azkar.length-1)
                      {
                        index = 0;
                      }
                  }
                  setState(() {});
                },
                child: Text(
                  "${azkar[index]}",
                  style: Theme.of(context).textTheme.bodySmall,
                ))
          ],
        ),
      ),
    );
  }
}
