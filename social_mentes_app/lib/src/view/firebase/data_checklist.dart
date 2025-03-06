import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getDataChecklist(String competence, String level) async {
  try {
    String documentId = "level $level";
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('skill')
        .doc(documentId)
        .get();

    final Object? rawData = documentSnapshot.data();
    
    if (rawData is! Map<String, dynamic>) {
      print("Erro: O documento não contém um mapa válido.");
      return [];
    }

    final Map<String, dynamic> data = rawData; 
    if (!data.containsKey(competence) || data[competence] is! List) {
      print("Campo '$competence' não encontrado ou não é uma lista.");
      return [];
    }

    List<Map<String, dynamic>> checklist = 
        (data[competence] as List)
            .whereType<Map<String, dynamic>>() 
            .toList();

    print("Dados do checklist: $checklist");
    return checklist;

  } catch (e, stacktrace) {
    print("Erro ao buscar os dados: $e");
    print(stacktrace); 
    return [];
  }
}