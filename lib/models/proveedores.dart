
import 'dart:convert';

Providers providersFromJson(String str) => Providers.fromJson(json.decode(str));

String providersToJson(Providers data) => json.encode(data.toJson());

class Providers {
    List<ProveedoresListado> proveedoresListado;

    Providers({
        required this.proveedoresListado,
    });

    factory Providers.fromJson(Map<String, dynamic> json) => Providers(
        proveedoresListado: List<ProveedoresListado>.from(json["Proveedores Listado"].map((x) => ProveedoresListado.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Proveedores Listado": List<dynamic>.from(proveedoresListado.map((x) => x.toJson())),
    };
}

class ProveedoresListado {
    int providerid;
    String providerName;
    String providerLastName;
    String providerMail;
    //ProviderState providerState;

    ProveedoresListado({
        required this.providerid,
        required this.providerName,
        required this.providerLastName,
        required this.providerMail,
        //required this.providerState, 
    });

    factory ProveedoresListado.fromJson(Map<String, dynamic> json) => ProveedoresListado(
        providerid: json["providerid"],
        providerName: json["provider_name"],
        providerLastName: json["provider_last_name"],
        providerMail: json["provider_mail"],
        //providerState: providerStateValues.map[json["provider_state"]]!,
    );

    Map<String, dynamic> toJson() => {
        "providerid": providerid,
        "provider_name": providerName,
        "provider_last_name": providerLastName,
        "provider_mail": providerMail,
        //"provider_state": providerStateValues.reverse[providerState],
    };
}

enum ProviderState {
    // ignore: constant_identifier_names
    ACTIVO
}

final providerStateValues = EnumValues({
    "Activo": ProviderState.ACTIVO
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// //Providers providersFromJson(String str) => Providers.fromJson(json.decode(str));
// //String providersToJson(Providers data) => json.encode(data.toJson());

// class Providers {
//     Providers({
//         required this.proveedoresListado,
//     });
    
//     List<ProveedoresListado> proveedoresListado;

//     factory Providers.fromJson(String str) => Providers.fromMap(json.decode(str));


//     factory Providers.fromMap(Map<dynamic, dynamic> json) => Providers(
//         proveedoresListado: List<ProveedoresListado>.from(json["Proveedores Listado"].map((x) => ProveedoresListado.fromJson(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "Proveedores Listado": List<dynamic>.from(proveedoresListado.map((x) => x.toJson())),
//     };
// }

// class ProveedoresListado {

//     ProveedoresListado({
//         required this.providerid,
//         required this.providerName,
//         required this.providerLastName,
//         required this.providerMail,
//         required this.providerState,
//     });

//     int providerid;
//     String providerName;
//     String providerLastName;
//     String providerMail;
//     ProviderState providerState;

//     factory ProveedoresListado.fromJson(String str) => ProveedoresListado.fromMap(json.decode(str));

//     factory ProveedoresListado.fromMap(Map<String, dynamic> json) => ProveedoresListado(
//         providerid: json["providerid"],
//         providerName: json["provider_name"],
//         providerLastName: json["provider_last_name"],
//         providerMail: json["provider_mail"],
//         providerState: providerStateValues.map[json["provider_state"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "providerid": providerid,
//         "provider_name": providerName,
//         "provider_last_name": providerLastName,
//         "provider_mail": providerMail,
//         "provider_state": providerStateValues.reverse[providerState],
//     };

// ProveedoresListado copy() => ProveedoresListado(
//   providerid: providerid, 
//   providerName: providerName, 
//   providerLastName: providerLastName, 
//   providerMail: providerMail, 
//   providerState: providerState);

// }

// enum ProviderState {
//     ACTIVO
// }

// final providerStateValues = EnumValues({
//     "Activo": ProviderState.ACTIVO
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
    
// }


