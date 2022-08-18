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
              subtitle: Text(user.story),
              trailing: user.country.isNotEmpty
                  ? Text(user.country)
                  : SizedBox.shrink(),
            ),
            // ListTile with Phone
            ListTileWidget(
              icon: Icons.phone,
              text: user.phone,
            ),
            // ListTile with Email
            ListTileWidget(
              icon: Icons.mail,
              text: user.mail,
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final IconData? icon;
  final String text;

  ListTileWidget({
    this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return this.text.isNotEmpty
        ? ListTile(
            leading: Icon(this.icon),
            title: Text(this.text),
          )
        : SizedBox.shrink();
  }
}
