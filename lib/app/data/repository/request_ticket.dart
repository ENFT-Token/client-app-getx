import 'package:enft/app/data/provider/request_ticket_api.dart';

class RequestTicketRepository {
  late final RequestTicketApi requestTicketApi;

  RequestTicketRepository({required this.requestTicketApi});

  // 실제 사용할 함수입니다. 개월 수를 int로 받는다고 생각했습니다.
  getTicketTerms() => [31, 61, 92, 182, 365];

  // 테스트용 함수입니다. 헬스장 이름 목록을 받아옵니다.
  getGymNames() => ['ENFT', 'MBTI', '아주대학교'];
}