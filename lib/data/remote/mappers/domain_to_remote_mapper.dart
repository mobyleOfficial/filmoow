import 'package:domain/model/seen_status.dart';

extension SeenStatusToRemote on SeenStatus {
  String toRemoteModel() {
    switch (this) {
      case SeenStatus.seen:
        return 'SN';
      case SeenStatus.notSeen:
        return 'SN';
      case SeenStatus.wantToSee:
        return 'WS';
      default:
        return 'none';
    }
  }
}
