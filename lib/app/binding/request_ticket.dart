import 'package:get/get.dart';

import 'package:enft/app/controller/request_ticket.dart';
import 'package:enft/app/data/provider/request_ticket_api.dart';
import 'package:enft/app/data/repository/request_ticket.dart';

class RequestTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        RequestTicketController(repository: RequestTicketRepository(
            requestTicketApi: RequestTicketApi())));
  }
}