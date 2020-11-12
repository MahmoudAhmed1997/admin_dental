
import 'dart:convert';

import 'package:admin_dental/patient_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientData {
  List<Patient> _patients = [


  ];


  List<Patient>get patients {

    return [..._patients];

  }

  void addPatientData (Patient patient) async{
    final url = "https://clink-cc4da.firebaseio.com/patientsData.json";
   await http.post(
      url,
      body: json.encode({
        'name': patient.name,
        'phone': patient.phone,
        'age': patient.age,
        'note': patient.note,
       // 'creatorId': userId,
      }),
    );
  }
}