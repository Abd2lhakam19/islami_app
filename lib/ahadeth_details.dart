import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_model.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import 'myThemeData.dart';

class AhadethDetails extends StatelessWidget {
  static const String routName = "ahadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
       provider.isDarkMode()?Image.asset("assets/images/dark_bg.png") : Image.asset("assets/images/background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color:  provider.isDarkMode()?MyThemeData.whiteColor:MyThemeData.blackColor
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                      color: MyThemeData.primaryLight,
                      width: 2
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    indent: 40,
                    endIndent: 40,
                    thickness: 1,
                    color: MyThemeData.primaryLight,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(args.content[index],style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: MyThemeData.blackColor
                        ),textAlign: TextAlign.center,));
                  },
                  itemCount: args.content.length,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
