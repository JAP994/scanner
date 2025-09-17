import 'package:flutter/material.dart';
import 'package:scanner/models/service_model.dart';
import 'package:scanner/widgets/primary_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as ServiceModel;
    return Scaffold(
      appBar: AppBar(title: Text("Detalles del Servicio")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ClipRRect(
            // borderRadius: BorderRadiusGeometry.only(
            //   topLeft: Radius.circular(16)
            // ),
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(data.banner.url),
          ),
          Text(
           data.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            data.description,
          ),
          Text(
            "Precio: \$${data.price}",
            style: TextTheme.of(
              context,
            ).titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PrimaryButton(
          label: "Agendar Servicio", 
          onPressed: () {},
          ),
      ),
    );
  }
}
