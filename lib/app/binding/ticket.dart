import 'package:get/get.dart';

import 'package:enft/app/controller/ticket.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketController>(() => TicketController());
  }
}
