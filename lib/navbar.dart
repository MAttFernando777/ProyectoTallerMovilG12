import 'package:flutter/material.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,

        children: [
          UserAccountsDrawerHeader(
            accountName: Text('UNIVERSIDAD NACIONAL MAYOR DE SAN MARCOS'),
            accountEmail: Text('FACULTAD DE INGENIERIA DE SOFTWARE'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black12,

            ),
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('Noticias'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.cases),
            title: Text('Oportunidades Laborales'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.note_alt_rounded),
            title: Text('Matricula'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.mic),
            title: Text('Conferencias'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Investigación'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Cursos'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notification_important),
            title: Text('Convocatorias'),
            onTap: ()=>null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Trámites'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}