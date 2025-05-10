// ignore: file_names
import 'dart:convert';

class Category {
    Category({
        required this.listadoCategorias,
    });

    factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

    List<ListadoCategoria> listadoCategorias;

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        listadoCategorias: 
        List<ListadoCategoria>.from(json["Listado Categorias"].map((x) => ListadoCategoria.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "Listado Categorias": List<dynamic>.from(listadoCategorias.map((x) => x.toJson())),
    };
}
//Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

//String categoryToJson(Category data) => json.encode(data.toMap());

class ListadoCategoria {
    ListadoCategoria({
        required this.categoryId,
        required this.categoryName,
        required this.categoryState,
    });
    
    int categoryId;
    String categoryName;
    String categoryState;

    factory ListadoCategoria.fromJson(String str) => ListadoCategoria.fromMap(json.decode(str));


    factory ListadoCategoria.fromMap(Map<String, dynamic> json) => ListadoCategoria(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
    );

    Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_state": categoryState,
    };

    ListadoCategoria copy() => ListadoCategoria(
      categoryId: categoryId, 
      categoryName: categoryName, 
      categoryState: categoryState);
}