import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/provider_service.dart';
import '../models/proveedores.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Proveedores'),
      ),
      body: ListView.builder(
        itemCount: providerService.providers.length,
        itemBuilder: (context, index) {
          final provider = providerService.providers[index];
          return ListTile(
            title: Text(provider.providerName),
            //subtitle: Text('Estado: ${provider.providerState}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navegar a la pantalla de edición de proveedor
                Navigator.pushNamed(context, 'edit_prov', arguments: provider);
              },
            ),
            onLongPress: () async {
              // Confirmar y eliminar proveedor
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Eliminar Proveedor'),
                  content: const Text('¿Estás seguro de que deseas eliminar este proveedor?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              );

              // if (confirm == true) {
              //   await providerService.deleteProvider(provider, context);
              // }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación de proveedor
          Navigator.pushNamed(context, 'edit_prov', arguments: ProveedoresListado(
            providerid: 0,
            providerName: '',
            providerLastName: '',
            providerMail: '',
            //providerState: 'Activo',
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}