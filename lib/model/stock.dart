import 'package:acougue/model/batch.dart';

class Stock {
  List<Batch>? batches;
  Stock({
    this.batches,
  });

  List<Batch> expiratedBatches(List<Batch> batchesToCheck) {
    List<Batch> batchesExpirated = [];
    for (Batch batchElement in batchesToCheck) {
      if (DateTime.now()
          .add(Duration(days: 5))
          .isAfter(batchElement.expirationDate)) {
        batchesExpirated.add(batchElement);
      }
    }
    return batchesExpirated;
  }
}
