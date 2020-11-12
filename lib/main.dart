import 'package:admin_dental/patient_name.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'd.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  final url = "https://clink-cc4da.firebaseio.com/paitentsData.json";
  List<Patient> _patients = [];

  List<Patient> get patients {
    return [..._patients];
  }

//  void addPatientData (Patient patient) async{
//    final url = "https://dental-eb0fc.firebaseio.com/PatientData.json";
//    await http.post(
//      url,
//      body: json.encode({
//        'name': patient.name,
//        'phone': patient.phone,
//        'age': patient.age,
//        'note': patient.note,
//        'procedure':patient.procedure
//        // 'creatorId': userId,
//      }),
//    );
//  }
  @override
  Patient findById(String id) {
    return patients.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetPatients() async {
    var url = 'https://clink-cc4da.firebaseio.com/paitentsData.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      //url = 'https://realtime-bfba9.firebaseio.com/TimeAppointtment.json';
      final AppointtmentResponse = await http.get(url);
      json.decode(AppointtmentResponse.body);
      final List<Patient> loadedPatients = [];
      extractedData.forEach((prodId, prodData) {
        loadedPatients.add(Patient(
            id: prodId,
            name: prodData['name'],
            phone: prodData['phone'],
            age: prodData['age'],
            note: prodData['note'],
            procedure: prodData['procedure'],


        )

        );
      });
      _patients = loadedPatients;
    } catch (error) {
      throw (error);
    }
  }

  Future<void> _refreshPatients(BuildContext context) async {
    return fetchAndSetPatients();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appoittments"),
      ),
      body: FutureBuilder(
          future: _refreshPatients(context),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : RefreshIndicator(
                      onRefresh: () => _refreshPatients(context),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: patients.length,
                          itemBuilder: (_, i) => Column(
                            children: [
                              PatientDataItem(
                                  patients[i].id,
                                  patients[i].name,
                                  patients[i].phone,
                                  patients[i].age,
                                  patients[i].note,
                                  patients[i].procedure),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    )),
    );
  }
}
