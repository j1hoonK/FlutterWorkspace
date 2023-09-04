import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prv_practice/src/components/view_count.dart';
import 'package:prv_practice/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({super.key});

  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Count Provider"),
        ),
        body: ViewCountWidget(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                _countProvider?.add();
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                _countProvider?.remove();
              },
              icon: Icon(Icons.remove),
            )
          ],
        ),
    );
  }
}