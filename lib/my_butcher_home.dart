import 'package:acougue/model/stock.dart';
import 'package:flutter/material.dart';

import 'model/batch.dart';
import 'package:intl/intl.dart';

class MyButcherHome extends StatelessWidget {
  MyButcherHome({super.key});

  List<Batch> testBatches = [
    Batch(
      batchId: 'FRI2501B23',
      expirationDate: DateTime(2025, 01, 22),
      storageLocation: 'F01E02P03',
    ),
    Batch(
      batchId: 'FRI2544S15',
      expirationDate: DateTime(2025, 01, 23),
      storageLocation: 'F01E01P02',
    ),
    Batch(
      batchId: 'MAR0125T32',
      expirationDate: DateTime(2025, 01, 24),
      storageLocation: 'F02E05P04',
    ),
    Batch(
      batchId: 'MAR0245M67',
      expirationDate: DateTime(2026, 01, 30, 17, 00),
      storageLocation: 'F03E03P01',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    {
      Stock stock = Stock();

      var teste = stock.expiratedBatches(testBatches);
      for (var element in teste) {
        print(element.batchId);
      }
    }
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedDate = formatter.format(now);
    print(formattedDate); // something like 2021-06-19

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text(
                'Açougue JacoBeef',
                style: TextStyle(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Hoje:  $formattedDate",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Adicionar Lote'),
        tooltip: 'Cadastrar um novo Lote',
        hoverElevation: 120.0,
      ),
    );
  }
}
