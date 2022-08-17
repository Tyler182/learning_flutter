import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_example/pages/register_form_page.dart';

class userInfoPage extends StatelessWidget {

const userInfoPage({required this.user});
  
  final User user;

  @override
  Widget build(BuildContext context) {
    print(user.country);
    return Scaffold(
      appBar: AppBar(
        title: Text('User info page'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // ListTile with Name, User story, Country
            ListTile(
              leading: Icon(Icons.person),
              title: Text('${user.name}'),
              subtitle: Text('${user.story}'),
              trailing: Text('${user.country}'),
            ),
            // ListTile with Phone
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('${user.phone}'),
            ),
            // ListTile with Email
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('${user.mail}'),
            ),
          ],
        ),
      ),
    );
  }
}
