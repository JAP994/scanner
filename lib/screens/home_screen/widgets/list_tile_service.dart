import 'package:flutter/material.dart';

class ListTileService extends StatelessWidget {
  const ListTileService({
    super.key,
    required this.pathNackgroundImage,
    this.avatarLabel,
    required this.title,
    this.onTap,
  });
  final String pathNackgroundImage;
  final String? avatarLabel;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(pathNackgroundImage),
        // child: Text(avatarLabel ?? ""),
        child: avatarLabel == null ? null : Text(avatarLabel!),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTap ?? () {},
    );
  }
}
