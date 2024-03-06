import 'package:bitcoin/controllers/auth/auth_bloc.dart';
import 'package:bitcoin/controllers/auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/price_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF006400),
          title: Text(
            "BitCoin Exchange Rate",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          elevation: .1,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreen[500], // Background color of header
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () {
                  // Handle logout here
                  BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                },
              ),
            ],
          ),
        ),
        body: PriceList());
  }
}
