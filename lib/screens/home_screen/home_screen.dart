import 'package:flutter/material.dart';
import 'package:scanner/models/service_model.dart';
import 'package:scanner/screens/details_screen/details_screen.dart';
import 'package:scanner/screens/home_screen/widgets/list_tile_service.dart';
import 'package:scanner/services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // variable que va a guardar los datos
  List<ServiceModel>? _listServices;

  // init state
  @override
  void initState() {
    super.initState();
    _init();
  }

  // funcion
  Future<void> _init() async {
    _listServices = await Services().getAllServices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/image_general.png",
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
              "Servicios",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          _listServices == null
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _listServices!.length,
                    itemBuilder: (context, index) {
                      return ListTileService(
                        pathBackgroundImage: _listServices![index].urlSmall,
                        title: _listServices![index].name,
                        onTap: () {
                          print("Servicios \$ $index");
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: _listServices![index],
                          );
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
