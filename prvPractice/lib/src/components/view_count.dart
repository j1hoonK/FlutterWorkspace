import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prv_practice/src/provider/count_provider.dart';

class ViewCountWidget extends StatelessWidget {
  const ViewCountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("build Called");
    return Center(
      child: Consumer(
        builder: (context, value, child) => Text(
          Provider.of<CountProvider>(context).count.toString(),
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}
