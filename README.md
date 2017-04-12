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
|location|string|
|name|string|
|menuimg|img|
|category|string|
|feature|string|

### 다음 지도 API

[Daum Developers](https://developers.daum.net/)에서 서비스를 생성후 API를 발급받는다.
[Maps API](http://apis.map.daum.net/web/guide/)에서 guide, sample, docs를 보고 필요에 따라서 만든다.

- 여러개마커 이벤트 등록
- 다른 이미지로 마커생성
- 커스텀 오버레이
- 카테고리 별 보기(근처 술집 정도만!)

### Paperclip

paperclip gem을 이용해서 이미지를 추가함.

## 4월 12일 (Searchkick + 다음지도 적용)