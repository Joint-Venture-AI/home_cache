class Document {
  final String id;
  final String type;
  final List<FileModel> files;
  final String addedBy;
  final DateTime updatedAt;
  final DateTime createdAt;
  final String? deletedAt;
  final DocumentDetails details;

  Document({
    required this.id,
    required this.type,
    required this.files,
    required this.addedBy,
    required this.updatedAt,
    required this.createdAt,
    this.deletedAt,
    required this.details,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        type: json["type"],
        files: (json["files"] as List<dynamic>)
            .map((e) => FileModel.fromJson(e))
            .toList(),
        addedBy: json["added_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        deletedAt: json["deleted_at"],
        details: DocumentDetails.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "files": files.map((e) => e.toJson()).toList(),
        "added_by": addedBy,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "deleted_at": deletedAt,
        "details": details.toJson(),
      };
}

class FileModel {
  final String fileId;
  final String fileUrl;

  FileModel({
    required this.fileId,
    required this.fileUrl,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        fileId: json["file_id"],
        fileUrl: json["file_url"],
      );

  Map<String, dynamic> toJson() => {
        "file_id": fileId,
        "file_url": fileUrl,
      };
}

class DocumentDetails {
  final String documentId;

  // Warranty fields
  final String? name;
  final String? brand;
  final String? warrantyStartDate;
  final String? warrantyEndDate;
  final String? serialNumber;
  final String? serviceContactInfo;

  // Receipt/Insurance fields
  final String? vendorStoreName;
  final String? dateOfPurchase;
  final num? totalAmountPaid;
  final String? paymentMethod;
  final String? orderNumber;

  DocumentDetails({
    required this.documentId,
    this.name,
    this.brand,
    this.warrantyStartDate,
    this.warrantyEndDate,
    this.serialNumber,
    this.serviceContactInfo,
    this.vendorStoreName,
    this.dateOfPurchase,
    this.totalAmountPaid,
    this.paymentMethod,
    this.orderNumber,
  });

  factory DocumentDetails.fromJson(Map<String, dynamic> json) =>
      DocumentDetails(
        documentId: json["document_id"],
        name: json["name"],
        brand: json["brand"],
        warrantyStartDate: json["warranty_start_date"],
        warrantyEndDate: json["warranty_end_date"],
        serialNumber: json["serial_number"],
        serviceContactInfo: json["service_contact_info"],
        vendorStoreName: json["vendor_store_name"],
        dateOfPurchase: json["date_of_purchase"],
        totalAmountPaid: json["total_amount_paid"] != null
            ? num.tryParse(json["total_amount_paid"].toString())
            : null,
        paymentMethod: json["payment_method"],
        orderNumber: json["order_number"],
      );

  Map<String, dynamic> toJson() => {
        "document_id": documentId,
        "name": name,
        "brand": brand,
        "warranty_start_date": warrantyStartDate,
        "warranty_end_date": warrantyEndDate,
        "serial_number": serialNumber,
        "service_contact_info": serviceContactInfo,
        "vendor_store_name": vendorStoreName,
        "date_of_purchase": dateOfPurchase,
        "total_amount_paid": totalAmountPaid,
        "payment_method": paymentMethod,
        "order_number": orderNumber,
      };
}
