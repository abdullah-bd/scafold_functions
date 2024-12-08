import 'package:flutter/material.dart';

import 'a.dart';
import 'b.dart';
import 'c.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _selectedIndex = 0;

  var widgets = [
    A(),
    B(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange
              ),
                child: Text('App Drawer')),
            ListTile(
            title: Text('Item 1'),
              onTap:() {

              Navigator.pop(context);

              },
          ),
            ListTile(
            title: Text('Item 2'),
          ),

          ],
        ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace:  Container(
          decoration: ShapeDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.orange,Colors.grey]),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)
              )),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, icon: Icon(Icons.menu)),

                Text("MY APP",
                  style: TextStyle(
                    fontSize: 20
                  ),),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),

              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => C(),
              ));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32))),
        child: Icon(Icons.add),
      ),
      body: widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTap,
      ),

    );
  }
}
