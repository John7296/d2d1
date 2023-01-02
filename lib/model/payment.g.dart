// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      invoiceId: json['invoiceId'] as int?,
      createdOn: json['createdOn'] as String?,
      paymentMode: json['paymentMode'] as String?,
      paymentStatus: json['paymentStatus'] as int?,
      paidOn: json['paidOn'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'invoiceId': instance.invoiceId,
      'createdOn': instance.createdOn,
      'paymentMode': instance.paymentMode,
      'paymentStatus': instance.paymentStatus,
      'paidOn': instance.paidOn,
    };
