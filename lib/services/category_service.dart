import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Categorias.dart';
import 'package:http/http.dart' as http;

class CategoryService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<ListadoCategoria> categorys = [];
  ListadoCategoria? SelectCategory;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoryService() {
    loadCategorys();
  }

  Future loadCategorys() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final Map<String, dynamic> data_decode = json.decode(response.body);
    print(response.body);
    final categoryMap = Category.fromJson(response.body);
    categorys = categoryMap.listadoCategorias;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateCategory(ListadoCategoria category) async {
    isEditCreate = true;
    notifyListeners();
    if (category.categoryId == 0) {
      await this.createCategory(category);
    } else {
      await this.updateCategory(category);
    }
    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateCategory(ListadoCategoria category) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = categorys
        .indexWhere((element) => element.categoryId == category.categoryId);
    categorys[index] = category;
    return '';
  }

  Future createCategory(ListadoCategoria category) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.categorys.add(category);
    return '';
  }

  Future deleteCategory(ListadoCategoria category, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: category.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.categorys.clear(); //borra todo el listado
    loadCategorys();
    Navigator.of(context).pushNamed('list_cat');
    return '';
  }
}
