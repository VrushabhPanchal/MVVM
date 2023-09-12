import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_models/User_View_Model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
  final userPrefrences = Provider.of<UserViewModel>(context);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap:() {
                userPrefrences.remove().then((value) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                });

              },
              child: Center(
                child: Text(
                    'Logout'
                ),
              ),
            )
          ],
        title: Text('HomeScreen'),
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
