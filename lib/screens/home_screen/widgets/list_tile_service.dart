import 'package:flutter/material.dart';

class ListTileService extends StatelessWidget {
  const ListTileService({
    super.key,
    required this.pathBackgroundImage,
    this.avatarLabel,
    required this.title,
    this.onTap,
  });

  // Parametros
  final String pathBackgroundImage;
  final String? avatarLabel;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(pathBackgroundImage),
        //child: Text(avatarLabel ?? ""), Opcion 1
        child: avatarLabel == null ? null : Text(avatarLabel!) , // Operador ternario
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTap,
    );
  }
}