## 축제 웹 기획
- 모바일 온리 혹은 목업 기획시 모바일에서 시작
- 1차 4월 11일 ~ 4/20
- 2차 5월 1일 ~ 5월 14일


### 4월 11일 기획 + 기본뼈대 생성

#### 컨텐츠
- 학과별 주점()
- 학교근처 주점(1차, 2-3차)
- 학교근처 24시간 해장국집
- 축제 타임테이블

#### 스택
- ruby on rails mvc
- react (view?)
- daum map API(nearby가 구현되는지?)
- searchkick
- paperclip
- sqlite(mysql도 필요에 따라 가능 하지만 불필요할듯)
- AWS EC2, S3(이미지 디비)
- private_pub(thin): 헌팅메신저를 만들어야함. 가입시 메시지 사용여부를 true false할수 있게.
- devise(omniauth facebook 전화번호로 가입시 이메일을 입력하도록? 네이버도 가능한가?)
- 구글 에드센스, 에널리틱스

#### DB

1. 과이름/동아리이름
2. 위치
3. 메뉴(사진)
4. 카테고리(주점, 낮부스, 주변주점 / 해장국)
(주변주점이랑 협상을 해서 쿠폰같은거 나오도록 하면 더 좋을거같음.)
5. 특징 ( 안주저렴, 합석, 컨셉같은거..)

| 이름 | 속성 |
|--------|--------|
|id|integer|
|x|string|
|y|string|
|name|string|
|menuimg|img|
|category|string|
|feature|string|

#### 다음 지도 API

[Daum Developers](https://developers.daum.net/)에서 서비스를 생성후 API를 발급받는다.
[Maps API](http://apis.map.daum.net/web/guide/)에서 guide, sample, docs를 보고 필요에 따라서 만든다.

- 여러개마커 이벤트 등록
- 다른 이미지로 마커생성
- 커스텀 오버레이
- 카테고리 별 보기(근처 술집 정도만!)

#### Paperclip

paperclip gem을 이용해서 이미지를 추가함.

### 4월 12일 (페이지구성 + Searchkick + 다음지도 적용 + devise(omniauth facebook))

#### 페이지구성

0. 전체 : 네브바, footer
1. post index : 축제 타임테이블구성 + 버튼(낮부스, 주점, 주변술집, 번개) - 고민중(모바일 버튼 낮밤에 따라 다르게 나오는 것)
2. post search - 카테고리 + 특징으로 구별해서 목록을 보여주는 페이지(이미지, 과주점 or 동아리부스 이름정도)
3. post show - 자세한 정보 및 위치
4. devise index - 번개버튼누르면 로그인하도록!
5. meeting index - 번개로그인하면 회원가입한 사람들목록 + 채팅기능

#### 다음지도

1. 중심 : 건국대학교 서울캠퍼스(37.5419759,127.0745398)
2. 확대정도 : 3 (2.5가 딱 적당한데 없다ㅠㅠ)

생각이 바꼈다. 지도를 보여주고 위치를 보여주기 보다는 목록을 보여주고 클릭을하면 지도로 위치를 보여주는!

#### devise
1. devise

#### searchkick
0. 검색내용을 form에 입력받아서 검색키워드를 지정하는 기능구현이 필요하다.
1. 검색한 결과를 json으로 map API에 넘겨서 좌표 마커를 불러오는 기능이 필요하다.

### 4월 13일

#### omniauth facebook

1. 페이스북 로그인 기능

#### figaro
1. SECRET_KEY와 ID를 보안을 위해서 figaro gem사용.

### 4월 16일

#### searchkick
0. 결과를 json에 저장하지 않기로함
1. 대신에 script 태그 내에서 필요한 변수명을 지정해서 넘겨줌
2. 검색을 폼 이외에도 체크박스를 이용할수 있게 해야한다.
3. 체크박스로 추가한 키워드도 인식해서 검색의 정확성을 높일수 있게하고 검색대상에서 좌표는 빼야한다.

#### daum map API
0. searchkick 결과로 넘겨받은 변수명으로 최초 마커 좌표를 띄움
1. 마커에 마우스올리면 생기는 윈도우가 필요하다.

#### private_pub(thin) - 채팅

채팅기능을 만들기 위해서 `private_pub`, `thin` gem을 사용 할 것이다.
우선적으로 프로젝트에 적용하기전에 따로 만들어 보았다.
[chatty](http://josephndungu.com/tutorials/gmail-like-chat-application-in-ruby-on-rails)를 참조했다.

### 4월 17일

#### private_pub(thin) - 채팅

채팅기능 프로젝트에 적용(Rails 5 , 최신 gem)

#### bootstrap4(alpha)

- navbar
- routes
- 채팅 페이지
- show 페이지
- search 페이지

#### searchkick
#### daum map api

searchkick을 통해 DB에 저장된 좌표정보를 불러와 지도에 표시하는 것 완료.
카테고리(낮부스, 밤주점, 주변가게)별 마커이미지 다르게 설정.

#### 민우오빠랑 할 때 수정해야될 것

1. `application.yml` 이 올라가있음.  deploy할때 이 파일 삭제하고 `bundle exec figaro install`하기.
2. facebook developer 웹 주소 - 앱 오빠나 미연이걸로 바꿔서 application.yml 키랑 ID바꿔서 하세여
3. daum map api 웹 주소 바꾸기
4. DB저장할 때 카테고리 목록, 특징 저장할 단어 결정하기

자세한 디자인과 DB는 미연이와 민우오빠가!


### 4월 18일

대략적인 디자인은 수정완료. 모바일을 기준으로 디자인을 적용시켰다.(search form , checkbox, button)

채팅을 할려면 터미널 창에서 `rackup private_pub.ru -s thin -E production`을 꼭 해줘야한다.


### 4월 26일 

- user flow 생각해두기
- 프로젝트 가동시 필요한 커맨드

```
rails db:seed RAILS_ENV=development
rails searchkick:reindex CLASS=Post
```

- AWS디플로이 할때 반드시 신경써야 하는부분
    - 시크릿키들을 환경변수에 추가한다.
    - assets가 엉키지 않아야 한다.
    - 페이지 렌더링에 신경써야 한다.


### 5월 5일 어린이날

- user-flow 만들어둠.

#### TODO
- 네비바를 삭제하고 좌측상단 버튼클릭시 search modal
    + 로고가 필요없어짐.
    + 사용자 경험이 깔끔해짐.
    + 드롭다운을 사용하지 않아 ui가 이뻐
    + 빨라짐
- 우측하단에 채팅 전용 버튼을 만든다.
    + 로그인시 페북사진으로 대체(메시지가 오면 숫자가 조그만하게 뜸) / 로그아웃시 채팅모양버튼(채팅하라는 작은메시지가 뜸)
    + 로그인시 해당버튼을 누르면 체팅목록으로 이동 / 로그아웃시 로그인화면으로 이동(패북온리)
- 메시지 페이지
    + 사진과 함께 체팅목록이 쭉
    + 우측상단에 설정에서 페북사진사용여부를 선택할수 있음.
    + 탈퇴하기 버튼(탈퇴시 해당아이디로 재가입 불가능함을 공지)
- 메인페이지는 모든목록을 view순위로 정열 (infinite scroll)
- 서치결과는 메인페이지와 ui가 같음.
- posts/show는 날씨앱을 최대한 밴치마킹(컨셉에 따라 색상이 다름)
    + 찾아가기 버튼을 만들어 위치를 궁긍할때만 맵을 사용하도록(맵의 사용을 최대한 줄임.)
