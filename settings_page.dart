import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:jodel/util/icon_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: SafeArea(
            child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: "General",
              children: <Widget>[
                buildLogout(),
                buildDeleteAccount(),
              ],
            )
          ],
        )),
      );

  Widget buildLogout() => SimpleSettingsTile(
        title: 'Logout',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.logout,
          color: Colors.blueAccent,
        ),
        onTap: () => (),
      );
  Widget buildDeleteAccount() => SimpleSettingsTile(
        title: 'Delete Account',
        subtitle: '',
        leading: IconWidget(
          icon: Icons.delete,
          color: Colors.redAccent,
        ),
      );
}
