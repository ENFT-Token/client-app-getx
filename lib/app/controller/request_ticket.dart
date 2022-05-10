import 'package:get/get.dart';

import 'package:enft/app/data/repository/request_ticket.dart';

// 시나리오
// 1. 게시글에서 A 헬스장 사장님이 헬스장 이용권 홍보 및 판매 게시글을 올린다.
// 2. 사용자는 그 글을 보고 마음에 들어 발급 요청 버튼을 누른다.
// 3. 사용자는 헬스장 이용권 기간과 지불할 클레이튼을 입력한다.
// 4. 사용자는 완료 버튼을 눌러 발급 요청을 하고, 클레이튼을 지불한다.
// 5. A 헬스장 사장님은 발급 요청을 확인하고, 발급을 승인한다.
// 6. 사용자는 이용권을 받는다.
// 7. 만약 승인하지 않는다면, 클레이튼을 환불받는다.

// 개발
// 1. 사용자가 발급 요청 버튼을 누를 때, 헬스장 이름은 고정이며 헬스장 이용권 기간 목록 데이터를 받아와야 한다.
// 2. 헬스장 이름은 텍스트, 헬스장 이용권 기간 목록은 드롭다운, 클레이튼은 텍스트폼이다.
// 3. 완료 버튼을 누르면 발급 요청과 더불어 클레이튼을 지불한다.

class RequestTicketController extends GetxController {
  late final RequestTicketRepository repository;

  RequestTicketController({required this.repository});

  @override
  onInit() async {
    getTicketTerms();
    getGymNames();
  }

  // 이 변수는 테스트용 변수입니다.
  List<String> _gymNames = [];

  // 이 변수들은 실제로 사용 될 변수입니다.
  RxString _selectGymName = "".obs;
  RxInt _selectTicketTerm = 0.obs;
  List<int> _ticketTerms = [];
  RxDouble _paymentKlay = 0.0.obs;

  get gymNames => _gymNames;

  get ticketTerms => _ticketTerms;

  get selectGymName => _selectGymName.value;

  set selectGymName(value) => _selectGymName.value = value;

  get selectTicketTerm => _selectTicketTerm.value;

  set selectTicketTerm(value) => _selectTicketTerm.value = value;

  get paymentKlay => _paymentKlay.value;

  set paymentKlay(value) => _paymentKlay.value = value;

  // 실제 사용할 함수입니다.
  getTicketTerms() {
    _ticketTerms = repository.getTicketTerms();
    selectTicketTerm = ticketTerms[0];
  }

  // 테스트용 함수입니다.
  getGymNames() {
    _gymNames = repository.getGymNames();
    selectGymName = gymNames[0];
  }
}
