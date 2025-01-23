import 'package:acougue/model/stock.dart';
import 'package:flutter/material.dart';

import 'model/batch.dart';
import 'package:intl/intl.dart';

class MyButcherHome extends StatelessWidget {
  MyButcherHome({super.key});

  List<Batch> testBatches = [
    Batch(
      batchId: 'FRI2501B21',
      expirationDate: DateTime(2025, 01, 25),
      storageLocation: 'F01E02P03',
    ),
    Batch(
      batchId: 'FRI2544S12',
      expirationDate: DateTime(2025, 01, 26),
      storageLocation: 'F01E01P02',
    ),
    Batch(
      batchId: 'MAR0125T33',
      expirationDate: DateTime(2024, 01, 24),
      storageLocation: 'F02E05P04',
    ),
    Batch(
      batchId: 'MAR0245M64',
      expirationDate: DateTime(2025, 01, 27),
      storageLocation: 'F01E03P02',
    ),
    Batch(
      batchId: 'JBS0456M41',
      expirationDate: DateTime(2025, 01, 28),
      storageLocation: 'F03E03P01',
    ),
    Batch(
      batchId: 'JBS0154D63',
      expirationDate: DateTime(2025, 04, 14),
      storageLocation: 'F03E02P01',
    ),
    Batch(
      batchId: 'JBS0245F22',
      expirationDate: DateTime(2025, 01, 29),
      storageLocation: 'F03E04P01',
    ),
    Batch(
      batchId: 'BRF2154G17',
      expirationDate: DateTime(2025, 01, 07),
      storageLocation: 'F01E01P01',
    ),
    Batch(
      batchId: 'BRF3789S23',
      expirationDate: DateTime(2025, 03, 15),
      storageLocation: 'F02E02P03',
    ),
    Batch(
      batchId: 'BRF1564R88',
      expirationDate: DateTime(2025, 01, 30),
      storageLocation: 'F01E04P02',
    ),
    Batch(
      batchId: 'BRF0878W11',
      expirationDate: DateTime(2025, 01, 08),
      storageLocation: 'F03E02P01',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Stock stock = Stock();
    //! inicio do teste
    var testeStock = stock.expiratedBatches(testBatches);
    for (var element in testeStock) {
      print(element.batchId);
      print(getFormattedDate(element.expirationDate));
      print(element.status);
    }

    //! fim do teste

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
              alignment: Alignment.bottomRight,
              child: Text(
                "Hoje:  ${getFormattedDate(DateTime.now())}",
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
      body: ListView.builder(
        itemCount: testeStock.length,
        itemBuilder: (context, index) {
          final batch = testeStock[index];
          return ListTile(
            leading: switch (batch.status) {
              BatchStatus.expired => const Icon(
                  Icons.error,
                  color: Colors.black,
                  size: 30,
                ),
              BatchStatus.expiresSoon => const Icon(
                  // Icons.crisis_alert,
                  Icons.warning_rounded,
                  color: Color.fromARGB(255, 181, 8, 8),
                  size: 30,
                ),
              BatchStatus.notExpired => const Icon(
                  Icons.check_box,
                  color: Colors.green,
                  size: 30,
                ),
              // TODO: Handle this case.
              Enum() => throw UnimplementedError(),
              // TODO: Handle this case.
              null => throw UnimplementedError(),
            },
            tileColor: Colors.grey[200],
            title: Text('Lote: ${batch.batchId}'),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("val.: ${getFormattedDate(batch.expirationDate)}"),
                // Text(batch.batchId),
                Text("local: ${batch.storageLocation}"),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                testeStock.removeAt(index);
              },
              icon: Icon(Icons.delete_forever),
              color: const Color.fromARGB(255, 5, 30, 141),
              iconSize: 30,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Adicionar Lote'),
        tooltip: 'Cadastrar um novo Lote',
        hoverElevation: 120.0,
      ),
    );
  }

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
