// This is a generated file - do not edit.
//
// Generated from protos/mdsflutter.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use requestResultDescriptor instead')
const RequestResult$json = {
  '1': 'RequestResult',
  '2': [
    {'1': 'requestId', '3': 1, '4': 1, '5': 5, '10': 'requestId'},
    {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    {'1': 'data', '3': 3, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `RequestResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestResultDescriptor = $convert.base64Decode(
    'Cg1SZXF1ZXN0UmVzdWx0EhwKCXJlcXVlc3RJZBgBIAEoBVIJcmVxdWVzdElkEh4KCnN0YXR1c0'
    'NvZGUYAiABKAVSCnN0YXR1c0NvZGUSEgoEZGF0YRgDIAEoCVIEZGF0YQ==');

@$core.Deprecated('Use requestErrorDescriptor instead')
const RequestError$json = {
  '1': 'RequestError',
  '2': [
    {'1': 'requestId', '3': 1, '4': 1, '5': 5, '10': 'requestId'},
    {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `RequestError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestErrorDescriptor = $convert.base64Decode(
    'CgxSZXF1ZXN0RXJyb3ISHAoJcmVxdWVzdElkGAEgASgFUglyZXF1ZXN0SWQSHgoKc3RhdHVzQ2'
    '9kZRgCIAEoBVIKc3RhdHVzQ29kZRIUCgVlcnJvchgDIAEoCVIFZXJyb3I=');

@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = {
  '1': 'Notification',
  '2': [
    {'1': 'subscriptionId', '3': 1, '4': 1, '5': 5, '10': 'subscriptionId'},
    {'1': 'data', '3': 2, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode(
    'CgxOb3RpZmljYXRpb24SJgoOc3Vic2NyaXB0aW9uSWQYASABKAVSDnN1YnNjcmlwdGlvbklkEh'
    'IKBGRhdGEYAiABKAlSBGRhdGE=');

@$core.Deprecated('Use notificationErrorDescriptor instead')
const NotificationError$json = {
  '1': 'NotificationError',
  '2': [
    {'1': 'subscriptionId', '3': 1, '4': 1, '5': 5, '10': 'subscriptionId'},
    {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    {'1': 'error', '3': 3, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `NotificationError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationErrorDescriptor = $convert.base64Decode(
    'ChFOb3RpZmljYXRpb25FcnJvchImCg5zdWJzY3JpcHRpb25JZBgBIAEoBVIOc3Vic2NyaXB0aW'
    '9uSWQSHgoKc3RhdHVzQ29kZRgCIAEoBVIKc3RhdHVzQ29kZRIUCgVlcnJvchgDIAEoCVIFZXJy'
    'b3I=');
