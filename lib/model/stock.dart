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
        batchElement.status = BatchStatus.expiresSoon;
      } else if (DateTime.now().isBefore(batchElement.expirationDate)) {
        batchElement.status = BatchStatus.expired;
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
