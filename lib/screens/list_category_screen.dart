import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/category_service.dart';
import '../models/categorias.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    if (categoryService.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Categorías'),
      ),
      body: ListView.builder(
        itemCount: categoryService.categorys.length,
        itemBuilder: (context, index) {
          final category = categoryService.categorys[index];
          return ListTile(
            title: Text(category.categoryName),
            subtitle: Text('Estado: ${category.categoryState}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navegar a la pantalla de edición de categoría
                Navigator.pushNamed(context, 'edit_cat', arguments: category);
              },
            ),
            onLongPress: () async {
              // Confirmar y eliminar categoría
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Eliminar Categoría'),
                  content: const Text('¿Estás seguro de que deseas eliminar esta categoría?'),
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

              if (confirm == true) {
                await categoryService.deleteCategory(category, context);
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación de categoría
          Navigator.pushNamed(context, 'edit_cat', arguments: ListadoCategoria(
            categoryId: 0,
            categoryName: '',
            categoryState: 'Activo',
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


