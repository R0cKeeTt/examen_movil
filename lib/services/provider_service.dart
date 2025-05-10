import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/proveedores.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProviderService extends ChangeNotifier{
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';
  
  List <ProveedoresListado> providers= [];
  ProveedoresListado? SelectProvider;
  bool isLoading = true;
  bool isEditCreate = true;

  ProviderService(){
    loadProvider();
  }

  loadProvider() async{
    
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/'
    );
    
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final Map<String, dynamic> data_decode = json.decode(response.body);
    print(response.body);
    final providerMap = Providers.fromJson(data_decode);

    providers = providerMap.proveedoresListado;
    notifyListeners();
  }


}