import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()

class Payment{

    @JsonKey(name: 'invoiceId')
  int? invoiceId;

      @JsonKey(name: 'createdOn')
  String? createdOn;

      @JsonKey(name: 'paymentMode')
  String? paymentMode;

      @JsonKey(name: 'paymentStatus')
  int? paymentStatus;

      @JsonKey(name: 'paidOn')
  String? paidOn;

    @JsonKey(name: 'invoicePath')
  String? invoicePath;

  Payment({
  
  this.invoiceId,
  this.createdOn,
  this.paymentMode,
  this.paymentStatus,
  this.paidOn,
this.invoicePath
  });

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentToJson(this);


}