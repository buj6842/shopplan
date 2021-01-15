<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask1부분 정리</title>
</head>
<body>
1. askboard.xml, askfiles.xml 추가
2. askboard.sql, askfiles 테이블 생성
3. askboard 패키지 별 생성
4. config.xml에 askboard , askfiles연결
5. web xml에 askboard 추가





<!--순서 정리  -->
<!-- 
1. 테이블 만들기
2. 모델 만들기
3. xml파일 만들기
4. 쿼리문 작성할 수 있는 것을 mapping에서 찾으려면 config에서 경로를 설정해준다.
5. config에서 사용하는 객체를 typeAlias로 준다.
6. mybatis 설정이 끝난 후 내가 원하는 쿼리를 작성 (askboard.xml)
7. 이 쿼리를 자바에서 사용하기 위해 askboarddao를 만들어서 사용
8. boarddao를 컨트롤러에서 사용하기 위해 font컨트롤러를 작성
9. 프론트 컨트롤러를 찾기 위해서 web.xml에 askboard프론트 컨트롤러에 경로를 써줌
확장자는 .bo << 이걸 써야 프론트 컨트롤러로 간다.
10. 해당 프론트 컨트롤러로 가서 get과 post 즉 sevlet을 상속받고 get과 post에서 똑같이 사용되는걸
메소드로 묶었다. >> 전체 uri에서 반복되는 것을 제외하고 우리가 필요한 command만 받아와서
해당 command가 "/askboard/AskBoardList.bo"  이거 일때 이거에 맞는 컨트롤러를 사용해 줄 것이며
그 컨트롤러에 있는 익스큐트메소드(?)는 액션포워드리턴타입이기때문에 해당 포워드에 맞는 전송방식을
밑에서 일괄처리를 한다. 일괄처리는 userfrontcontrollr(?)와 일치하기 때문에 복붙하기
>> 여기까지 됬으면 jsp로가서 jstl파일을 쓰면 된다.
 -->
 
 <!--1210 askwhrite  정리
 0206~부터 게시판 정리 다시보기
 form태그에서 전달받은 file타입의 파라미터는 
 멀티~객체로 제어해주어야한다.
 1. 원본 파일 2. 시스템 파일 이름 이 두가지를 눈여겨봐야함
 1번으로 2번을 찾아서 활용한다.
 -->


</body>
</html>