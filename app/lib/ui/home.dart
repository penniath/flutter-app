import 'package:app/service/device/session_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _email;
  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  _loadEmail() async {
    var email = await getEmail();
    setState(() {
      _email = email;
    });
  }

  _logout(BuildContext context) async {
    await deleteEmail();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.blueAccent,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Text(_email)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Text('Salir'),
                  ],
                ),
                onTap: () => _logout(context),
              ),
            ),
          ],
        ),
      ),
      body: Text(_email),
    );
  }
}
