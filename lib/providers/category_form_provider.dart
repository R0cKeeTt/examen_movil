import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categorias.dart';

class CategoryFormProvider with ChangeNotifier {
  final List<ListadoCategoria> _categorias = [];

  List<ListadoCategoria> get categorias => [..._categorias];

  void cargarCategorias(List<ListadoCategoria> lista) {
    _categorias.clear();
    _categorias.addAll(lista);
    notifyListeners();
  }

  void actualizarCategoria(ListadoCategoria actualizada) {
    final index = _categorias.indexWhere((c) => c.categoryId == actualizada.categoryId);
    if (index != -1) {
      _categorias[index] = actualizada;
      notifyListeners();
    }
  }

  void agregarCategoria(ListadoCategoria nueva) {
    _categorias.add(nueva);
    notifyListeners();
  }

  void eliminarCategoria(int id) {
    _categorias.removeWhere((c) => c.categoryId == id);
    notifyListeners();
  }
}
