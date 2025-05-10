import 'package:flutter/material.dart';
import '../models/categorias.dart';

class CategoryCard extends StatelessWidget {
  final ListadoCategoria category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.green[50], // Fondo verde claro
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${category.categoryId}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green, // Texto verde
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Nombre: ${category.categoryName}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Estado: ${category.categoryState}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green, // Texto verde
              ),
            ),
          ],
        ),
      ),
    );
  }
}
















