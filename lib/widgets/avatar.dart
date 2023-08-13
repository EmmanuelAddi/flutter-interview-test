import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? url;

  const Avatar({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: url != null ? NetworkImage(url!) : null,
    );
  }
}