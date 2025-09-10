import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen/widgets/list_tile_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/image_general.png',
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              'SEVICIOS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [
                ListTileService(
                  pathNackgroundImage: 'assets/icon1.jpeg',
                  title: 'Servicio 1',
                ),
                ListTileService(
                  pathNackgroundImage: 'assets/icon2.jpeg',
                  title: 'Servicio 2',
                ),
                ListTileService(
                  pathNackgroundImage: 'assets/icon3.jpeg',
                  title: 'Servicio 3',
                ),
                ListTileService(
                  pathNackgroundImage: 'assets/icon4.jpeg',
                  title: 'Servicio 4',
                ),
                ListTileService(
                  pathNackgroundImage: 'assets/icon5.jpeg',
                  title: 'Servicio 5',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTileService(
                  pathNackgroundImage: 'assets/icon5.jpeg',
                  title: 'Servicios $index',
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
