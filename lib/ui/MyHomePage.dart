import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Myhomepage> {
  final List<Poli> poliList = [
    Poli(namaPoli: "Poli Anak"),
    Poli(namaPoli: "Poli Kandungan"),
    Poli(namaPoli: "Poli Gigi"),
    Poli(namaPoli: "Poli THT"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: ListView.builder(
        itemCount: poliList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliList[index]),
                ),
              );
            },
            child: PoliItem(poli: poliList[index]),
          );
        },
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          _buildDrawerItem(Icons.home, 'Home', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.settings, 'Settings', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(Icons.logout, 'Logout', () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Color.fromARGB(188, 123, 97, 182),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Account Dummy',
            style: TextStyle(
              color: Color.fromARGB(255, 165, 207, 11),
              fontSize: 18,
            ),
          ),
          Text(
            'dummy@bsi.ac.id',
            style: TextStyle(
              color: Color.fromARGB(179, 236, 9, 9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
