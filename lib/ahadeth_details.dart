import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_model.dart';

import 'myThemeData.dart';

class AhadethDetails extends StatelessWidget {
  static const String routName = "ahadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Stack(
      children: [
        Image.asset("assets/images/background.png"),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                      color: MyThemeData.primaryColor,
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
                    color: MyThemeData.primaryColor,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text(args.content[index],style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,));
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
