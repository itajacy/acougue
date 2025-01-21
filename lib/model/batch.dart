// ignore_for_file: public_member_api_docs, sort_constructors_first
class Batch {
  String batchId;
  DateTime expirationDate = DateTime.now();
  DateTime registrationDate;
  String storageLocation;
  Batch({
    required this.batchId,
    required this.expirationDate,
    required this.registrationDate,
    required this.storageLocation,
  });

  String batchExpirationVerify(DateTime batchValidity) {
    String batchStatus;
    if (DateTime.now().isAfter(batchValidity)) {
      batchStatus = "Vencido";
    } else if (DateTime.now()
        .subtract(Duration(days: 5))
        .isBefore(batchValidity)) {
      batchStatus = "Vai Vencer";
    } else {
      batchStatus = "Dentro da Validade";
    }
    return batchStatus;
  }
}
