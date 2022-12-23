import 'package:flutter/material.dart';

class itemHadethDetails extends StatelessWidget {
  String name;
  itemHadethDetails({required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        style: Theme.of(context).textTheme.subtitle2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
