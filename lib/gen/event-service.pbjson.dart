///
//  Generated code. Do not modify.
//  source: event-service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    const {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'metadata', '3': 3, '4': 3, '5': 11, '6': '.eventstore.Event.MetadataEntry', '10': 'metadata'},
    const {'1': 'payload', '3': 4, '4': 1, '5': 9, '10': 'payload'},
    const {'1': 'id', '3': 5, '4': 1, '5': 9, '10': 'id'},
  ],
  '3': const [Event_MetadataEntry$json],
};

const Event_MetadataEntry$json = const {
  '1': 'MetadataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Notification$json = const {
  '1': 'Notification',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    const {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'target', '3': 3, '4': 1, '5': 9, '10': 'target'},
    const {'1': 'payload', '3': 4, '4': 1, '5': 9, '10': 'payload'},
    const {'1': 'id', '3': 5, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'serviceId', '3': 6, '4': 1, '5': 9, '10': 'serviceId'},
  ],
};

const DeliveryStatus$json = const {
  '1': 'DeliveryStatus',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

const SubscribeRequest$json = const {
  '1': 'SubscribeRequest',
  '2': const [
    const {'1': 'subscriptions', '3': 1, '4': 3, '5': 11, '6': '.eventstore.Key', '10': 'subscriptions'},
  ],
};

const Key$json = const {
  '1': 'Key',
  '2': const [
    const {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    const {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
    const {'1': 'lastId', '3': 3, '4': 1, '5': 9, '10': 'lastId'},
  ],
};

