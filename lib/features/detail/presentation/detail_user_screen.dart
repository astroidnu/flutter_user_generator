import 'package:flutter/material.dart';
import 'package:user_generator/features/home/domain/entity/home.dart';

class DetailUserScreen extends StatelessWidget {
  final User user;

  const DetailUserScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(128.0),
              child: Image.network(user.photoUrl, width: 200, height: 200, fit: BoxFit.contain)
            ),
            SizedBox(height: 8),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("User Details",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Fullname : ${user.name}", textAlign: TextAlign.left),
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email : ${user.email}", textAlign: TextAlign.left),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Colors.lightGreen,
                      child: Text("Email Me!"),
                    ),
                  )
                ],
              )
            )
          ],
        ),
      )
    );
  }
}