import 'package:flutter/material.dart';

import 'model/batch.dart';
import 'upper_case_text_formatter.dart';

class BatchRegister extends StatefulWidget {
  List<Batch> batches;

  BatchRegister({
    required this.batches,
  });

  @override
  State<BatchRegister> createState() => _BatchRegisterState();
}

class _BatchRegisterState extends State<BatchRegister> {
  final _formKey = GlobalKey<FormState>();

  List<Batch> newBatches = [];

  TextEditingController batchIdController = TextEditingController();

  TextEditingController expirationDateController = TextEditingController();

  TextEditingController storageLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text(
                'Açougue JacoBeef',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Cadastro de Lotes",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          // padding: EdgeInsets.all(16.0),
          color: Colors.grey[200],
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: batchIdController,
                  inputFormatters: [UpperCaseTextFormatter()],
                  // onChanged: (value) => value.toUpperCase(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16.0),
                    label: Text('Lote'),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: expirationDateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16.0),
                    label: Text('Data de Validade'),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: storageLocationController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16.0),
                    label: Text('Localização'),
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final newBatch = Batch(
              batchId: batchIdController.text,
              expirationDate: DateTime.parse(expirationDateController.text),
              storageLocation: storageLocationController.text,
            );
            setState(() {
              newBatches.add(newBatch);
            });
            Navigator.of(context).pop(newBatches);
          }

          //todo  talvez aqui precise de um setState
        },
        label: Text(
          'Cadastrar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        tooltip: 'Cadastra o Lote',
        hoverElevation: 120.0,
        backgroundColor: const Color.fromARGB(255, 73, 10, 190),
        foregroundColor: Colors.white,
      ),
    );
  }
}


// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     return newValue.copyWith(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }