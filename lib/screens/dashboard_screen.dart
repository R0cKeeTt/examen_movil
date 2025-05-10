import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildDashboardTile(
              context,
              label: 'Listado de Productos',
              routeName: 'list',
            ),
            const SizedBox(height: 16),
            _buildDashboardTile(
              context,
              label: 'Categorías',
              routeName: 'cat',
            ),
            const SizedBox(height: 16),
            _buildDashboardTile(
              context,
              label: 'Proveedores',
              routeName: 'prov',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardTile(BuildContext context, {required String label, required String routeName}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
