class Batch {
  String batchId;
  DateTime expirationDate;
  String storageLocation;
  Enum? status;
  Batch({
    required this.batchId,
    required this.expirationDate,
    required this.storageLocation,
    this.status,
  });
}
