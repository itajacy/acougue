import 'package:acougue/model/stock.dart';
import 'package:flutter/material.dart';

import 'batch_register.dart';
import 'model/batch.dart';
import 'package:intl/intl.dart';

class MyButcherHome extends StatefulWidget {
  MyButcherHome({super.key});

  @override
  State<MyButcherHome> createState() => _MyButcherHomeState();
}

class _MyButcherHomeState extends State<MyButcherHome> {
  List<Batch> testBatches = [
    Batch(
      batchId: '01FRI2501B21',
      expirationDate: DateTime(2025, 01, 05),
      storageLocation: 'F01E02P03',
    ),
    Batch(
      batchId: '02FRI2544S12',
      expirationDate: DateTime(2025, 01, 11),
      storageLocation: 'F01E01P02',
    ),
    Batch(
      batchId: '03MAR0125T33',
      expirationDate: DateTime(2025, 01, 26),
      storageLocation: 'F02E05P04',
    ),
    Batch(
      batchId: '04MAR0245M64',
      expirationDate: DateTime(2025, 01, 27),
      storageLocation: 'F01E03P02',
    ),
    Batch(
      batchId: '05JBS0456M41',
      expirationDate: DateTime(2025, 04, 08),
      storageLocation: 'F03E03P01',
    ),
    Batch(
      batchId: '06JBS0154D63',
      expirationDate: DateTime(2025, 04, 14),
      storageLocation: 'F03E02P01',
    ),
  ];

  Stock stock = Stock();
  @override
  Widget build(BuildContext context) {
    List<Batch> stockList = stock.expiratedBatches(testBatches);

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
        itemCount: stockList.length,
        itemBuilder: (context, index) {
          final batch = stockList[index];
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
              Enum() => throw UnimplementedError('erro de status de lote'),
              // TODO: Handle this case.
              null => throw UnimplementedError('Erro de Status de Lote nulo'),
            },
            tileColor: (batch.status == BatchStatus.expiresSoon)
                ? Colors.red[200]
                : Colors.grey[300],
            title: Text(
              'Lote: ${batch.batchId}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            shape: Border.all(color: Colors.white, width: 4),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(batch.status == BatchStatus.expired
                    ? "VENCIDO"
                    : "val.: ${getFormattedDate(batch.expirationDate)}"),
                // Text(batch.batchId),
                Text("local: ${batch.storageLocation}"),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                stockList.removeAt(index);
                setState(() {
                  testBatches = stockList;
                });
              },
              icon: Icon(Icons.delete_forever),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(Colors.black87),
                foregroundColor: WidgetStatePropertyAll<Color>(Colors.white),
                shadowColor: WidgetStatePropertyAll<Color>(Colors.black),
                elevation: WidgetStatePropertyAll<double>(6),
              ),
              iconSize: 30,
              highlightColor: const Color.fromARGB(255, 173, 99, 30),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Aguarda o retorno da BatchRegister
          final updatedBatches = await Navigator.of(context).push<List<Batch>>(
            MaterialPageRoute(
              builder: (context) => BatchRegister(batches: testBatches),
            ),
          );
         
          if (updatedBatches != null) {
            setState(() {
              testBatches = updatedBatches;
            });
          }
        },
        label: Text(
          'Adicionar Lote',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        tooltip: 'Cadastrar um novo Lote',
        hoverElevation: 120.0,
        backgroundColor: const Color.fromARGB(255, 73, 10, 190),
        foregroundColor: Colors.white,
      ),
    );
  }

  String getFormattedDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }
}
