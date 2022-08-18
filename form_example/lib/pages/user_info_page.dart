import 'package:flutter/material.dart';
import 'package:form_example/pages/register_form_page.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User info page'),
      ),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // ListTile with Name, User story, Country
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(user.name),
              subtitle: Text(user.story),
              trailing: user.country.isNotEmpty
                  ? Text(user.country)
                  : const SizedBox.shrink(),
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

  const ListTileWidget({
    Key? key,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? ListTile(
            leading: Icon(icon),
            title: Text(text),
          )
        : const SizedBox.shrink();
  }
}
