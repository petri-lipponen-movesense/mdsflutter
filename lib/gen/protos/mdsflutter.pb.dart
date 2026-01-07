// This is a generated file - do not edit.
//
// Generated from protos/mdsflutter.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class RequestResult extends $pb.GeneratedMessage {
  factory RequestResult({
    $core.int? requestId,
    $core.int? statusCode,
    $core.String? data,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (statusCode != null) result.statusCode = statusCode;
    if (data != null) result.data = data;
    return result;
  }

  RequestResult._();

  factory RequestResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestResult',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'requestId', protoName: 'requestId')
    ..aI(2, _omitFieldNames ? '' : 'statusCode', protoName: 'statusCode')
    ..aOS(3, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestResult copyWith(void Function(RequestResult) updates) =>
      super.copyWith((message) => updates(message as RequestResult))
          as RequestResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestResult create() => RequestResult._();
  @$core.override
  RequestResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestResult>(create);
  static RequestResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get requestId => $_getIZ(0);
  @$pb.TagNumber(1)
  set requestId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get data => $_getSZ(2);
  @$pb.TagNumber(3)
  set data($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
}

class RequestError extends $pb.GeneratedMessage {
  factory RequestError({
    $core.int? requestId,
    $core.int? statusCode,
    $core.String? error,
  }) {
    final result = create();
    if (requestId != null) result.requestId = requestId;
    if (statusCode != null) result.statusCode = statusCode;
    if (error != null) result.error = error;
    return result;
  }

  RequestError._();

  factory RequestError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestError',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'requestId', protoName: 'requestId')
    ..aI(2, _omitFieldNames ? '' : 'statusCode', protoName: 'statusCode')
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestError copyWith(void Function(RequestError) updates) =>
      super.copyWith((message) => updates(message as RequestError))
          as RequestError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestError create() => RequestError._();
  @$core.override
  RequestError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestError>(create);
  static RequestError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get requestId => $_getIZ(0);
  @$pb.TagNumber(1)
  set requestId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
}

class Notification extends $pb.GeneratedMessage {
  factory Notification({
    $core.int? subscriptionId,
    $core.String? data,
  }) {
    final result = create();
    if (subscriptionId != null) result.subscriptionId = subscriptionId;
    if (data != null) result.data = data;
    return result;
  }

  Notification._();

  factory Notification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Notification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Notification',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'subscriptionId',
        protoName: 'subscriptionId')
    ..aOS(2, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Notification copyWith(void Function(Notification) updates) =>
      super.copyWith((message) => updates(message as Notification))
          as Notification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Notification create() => Notification._();
  @$core.override
  Notification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Notification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Notification>(create);
  static Notification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subscriptionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get data => $_getSZ(1);
  @$pb.TagNumber(2)
  set data($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => $_clearField(2);
}

class NotificationError extends $pb.GeneratedMessage {
  factory NotificationError({
    $core.int? subscriptionId,
    $core.int? statusCode,
    $core.String? error,
  }) {
    final result = create();
    if (subscriptionId != null) result.subscriptionId = subscriptionId;
    if (statusCode != null) result.statusCode = statusCode;
    if (error != null) result.error = error;
    return result;
  }

  NotificationError._();

  factory NotificationError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotificationError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotificationError',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'subscriptionId',
        protoName: 'subscriptionId')
    ..aI(2, _omitFieldNames ? '' : 'statusCode', protoName: 'statusCode')
    ..aOS(3, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationError copyWith(void Function(NotificationError) updates) =>
      super.copyWith((message) => updates(message as NotificationError))
          as NotificationError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationError create() => NotificationError._();
  @$core.override
  NotificationError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotificationError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationError>(create);
  static NotificationError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subscriptionId => $_getIZ(0);
  @$pb.TagNumber(1)
  set subscriptionId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubscriptionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubscriptionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get error => $_getSZ(2);
  @$pb.TagNumber(3)
  set error($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
