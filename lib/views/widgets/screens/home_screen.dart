import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_try_video/constants.dart';
import 'package:new_try_video/main.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            pageIndex=idx;
          });
        } ,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        currentIndex: pageIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 30),
         label: 'Contents'),
         BottomNavigationBarItem(icon: Icon(Icons.settings, size: 30),
         label: 'Licence'),
      ]),
    body: pages[pageIndex],


    );
  }}