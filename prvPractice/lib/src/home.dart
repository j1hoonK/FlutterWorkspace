import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prv_practice/src/provider/bottom_navigation_provider.dart';
import 'package:prv_practice/src/provider/count_provider.dart';
import 'package:prv_practice/src/ui/count_home_widget.dart';
import 'package:prv_practice/src/ui/movie_list_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  BottomNavigationProvider? _bottomNavigationProvider;

  Widget _navigationBody() {
    switch(_bottomNavigationProvider){
      case 0:
        return CountHomeWidget();
        break;
      case 1:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "movie"),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.red,
      onTap: (index) => _bottomNavigationProvider?.updateCurrentPage(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Practice"),
      ),
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}