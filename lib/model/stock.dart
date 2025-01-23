import 'package:acougue/model/batch.dart';

class Stock {
  List<Batch>? batches;
  Stock({
    this.batches,
  });

  List<Batch> expiratedBatches(List<Batch> batchesToCheck) {
    List<Batch> batchesExpirated = [];
    for (Batch batchElement in batchesToCheck) {
      if (batchElement.expirationDate.isBefore(DateTime.now())) {
        batchElement.status = BatchStatus.expired;
      } else if (DateTime.now()
              .difference(batchElement.expirationDate)
              .inDays
              .abs() <=
          5) {
        batchElement.status = BatchStatus.expiresSoon;
      } else {
        batchElement.status = BatchStatus.notExpired;
      }
      batchesExpirated.add(batchElement);
    }
    batchesExpirated.sort(
      (a, b) => a.expirationDate.compareTo(b.expirationDate),
    );
    return batchesExpirated;
  }
}

enum BatchStatus {
  expired,
  expiresSoon,
  notExpired,
}
