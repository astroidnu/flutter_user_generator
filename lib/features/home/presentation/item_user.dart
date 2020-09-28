import 'package:flutter/material.dart';


class ItemUser extends StatelessWidget {
  final String name;
  final String email;
  final String url;
  final VoidCallback onPressed;

  const ItemUser({this.name, this.email, this.url, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 5,
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.0),
                    child: Image.network(url),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: [
                        Text(
                            "$name",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        Text("$email", textAlign: TextAlign.left)
                      ],
                    ),
                  )]
            )
        ),
      ),
    );
  }
}
