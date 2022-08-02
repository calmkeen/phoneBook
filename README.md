# phoneBook
전화번호부를 클린코드 식으로 꾸며 보았다.


[진행상황]
현재
Listload는 tableView
information 입력은 addView - modal방식으로 구현했다.



https://user-images.githubusercontent.com/78361650/178940419-d735fc1c-1e14-4757-9a4a-aff4ba182318.mp4

realm db에 데이터를 넣은 모습

<img width="1111" alt="image" src="https://user-images.githubusercontent.com/78361650/179462955-5385d0ac-6c9a-4b67-b5ca-42c1757bb6c1.png">


07/26 


https://user-images.githubusercontent.com/78361650/180957453-1dc3568d-7dfb-431a-b1bb-fd5a65e6c876.mov




1. contentview가 present로 밖에 뷰가 나오지 않는다.
이에 관해 stackoverflow등 여러군데에 질의를 올려 검색중
https://stackoverflow.com/questions/73118345/pushing-a-navigation-controller-is-not-supported-in-swift-move-from-modal-to-n
2. tableReload 기능이 바로 동작하지 않는다.
_ completion, btn clousre 호출 다안되었다.
아래와 같이 빌드를 다시 할경우에만 새로 호출되어 table이 갱신된다.


https://user-images.githubusercontent.com/78361650/180958121-82d11de4-e048-4304-aa04-6cb81353a345.mov

navigation으로 이동을 고집하는 이유는 아이폰의 phoneBook과 동일하게 만들기 위해서 이다.

tableView를 refresh하게 했다.


https://user-images.githubusercontent.com/78361650/182298058-6e7cd5a3-f37c-45f8-8867-41d42d227aa3.mov

