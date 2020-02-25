import 'package:port_tracker/domain/interfaces/i-result.dart';

class DeliveryStatusResult extends IResult {
  DeliveryStatusResult(bool success, String id) {
    this.success = success;
    this.id = id;
  }
}
