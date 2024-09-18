# 은빛 탐험가 클린 버전
<div align = "center">
  <img width="150" alt="은빛탐험가 앱아이콘" src="https://github.com/user-attachments/assets/20777f5c-260e-4064-9edb-1da614543418">
  <br>
  <br>
  <img src="https://img.shields.io/badge/Swift-v5.0-red?logo=swift"/>
  <img src="https://img.shields.io/badge/Xcode-v15.0-blue?logo=Xcode"/>
  <img src="https://img.shields.io/badge/iOS-15.0+-black?logo=apple"/>
</div>
<br>

고령층의 디지털 격차 문제를 해결하기 위해 개발한 `AR 기술을 활용한 체험형 디지털 교육 어플리케이션`입니다. 고령층의 디지털 기기 및 기술에 대한 체험을 탐험이라는 컨셉으로 잡아 “은빛 탐험가”라는 이름으로 기획하였습니다.
<br>
<br>

## 🗄️ 프로젝트 정보
- **기간** : `2023.07.18 ~ 2023.08.18` (1개월) -> 리팩토링 기간 `2024.01.18 ~ 2024.05.07` (약 4개월)
- **개발 인원** : `iOS 4명`
- **기술 스택** : `UIKit(Codebase UI)` `ARKit` `SceneKit` `Combine` `CoreML` `VisionKit` `Vision`
- **프로젝트 주요 기능**

  - AR 기술을 활용해 3D 캐릭터와 함께 단계별로 `다양한 터치 제스처`에 대해 체험하고 학습할 수 있는 기능
  - 각각의 터치 제스처에 따른 `3D 캐릭터의 애니메이션 동작` 기능
  - 실제 카페 키오스크 UI를 통해 `메뉴 선택부터 스탬프 적립, 결제까지 키오스크 주문`에 대해 체험하고 학습할 수 있는 기능
  - AR 기술을 활용해 3D 키오스크 기기의 카드 투입구나 바코드 리더기 위치를 확인할 수 있는 기능
  - 사물의 작은 텍스트를 인식해 큰 텍스트로 변환하여 보여주는 `OCR 기능`
  - 인식된 텍스트를 음성으로 들려주는 `TTS 기능`
  
 
  ![터치 제스처 탐험하기](https://github.com/user-attachments/assets/4005b768-4b8e-4786-a2eb-31b6fe911d26)
  ![키오스크 탐험하기](https://github.com/user-attachments/assets/98429530-41c4-44f5-bde7-9a5d99284e6a)
  ![AI 탐험하기](https://github.com/user-attachments/assets/62bdfd74-880a-4cb9-a786-27e4f0c0e072)

<br>

## 🧰 담당 기능 구현 방법

### 터치 제스처 탐험하기

- `ARKit`을 활용해 3D 캐릭터와 함께 단계별로 `다양한 터치 제스처를 체험`하는 기능
- `Tap`, `LongPress`, `Swipe`, `Pan`, `Pinch`, `Rotate` 제스처에 대해 `SceneKit`을 활용한 3D 캐릭터 애니메이션 구현

<br>

### 키오스크 탐험하기
  
- Codebase `UITableView`, `UICollectionView`, `UISegmentControl`, `UIStackView` 등을 활용해 실제 카페 키오스크 UI를 구현하여 메뉴 선택부터 스탬프 적립, 결제까지 체험할 수 있는 기능
- AR과 터치 제스처를 활용하여 키오스크 기기 자체에 대한 체험을 할 수 있는 기능

<br>

## 📌 고려 사항

### ARKit의 오브젝트 렌더링 위치 결정 방식

- 고민 지점
  
  - `ARWorldTrackingConfiguration`은 수평면이나 수직면을 자동으로 인식하여 해당 평면의 특정 좌표에 렌더링
  - 평면을 잘 인식하기 위해선 평면과의 거리를 벌리기 위해 `고령층이 아이패드를 높게 들어야 하는 UX적 단점` 존재
    
- 결과
  
  - `ARImageTrackingConfiguration`을 사용하여 평면이 아닌 특정 사물의 이미지를 인식하여 `인식된 사물 위에 렌더링`하는 방식으로 결정
  - 이로써 아이패드를 들지 않고 `폴리오 케이스나 거치대를 사용`하여도 오브젝트의 렌더링 위치를 결정 가능
  - `은빛 탐험 티켓`을 제작하여 `오브젝트 렌더링용 사물의 역할과 동시에 어플리케이션의 컨셉 강화 도구`로 사용
  <br>
  <div align="center">
    <img width="300" alt="은빛탐험티켓" src="https://github.com/user-attachments/assets/3ee9750c-fb3b-4fa0-bb2d-e85261e3c2f6">
  </div>
<br>

### MVC 아키텍처

- 고민 지점
  - 모든 코드가 ViewController에 존재함으로써 ViewController가 많은 책임을 가지게 됨
  - 따라서, 적절한 역할 분리를 통해 ViewController의 책임을 덜어내고자 `MVC 아키텍처` 적용
   
- 결과
  
  |Model|View|
  |-|-|
  |<img width="300" alt="Model" src="https://github.com/user-attachments/assets/af760ef1-d281-49a3-beca-cec3c905f27c">|<img width="600" alt="View" src="https://github.com/user-attachments/assets/b547ad71-e047-45c1-88bc-ec9025ba8597">|
  |Model과 ViewController간에 옵저버 패턴 적용|User Action을 ViewController에 전달 및 UI 업데이트를 계층적으로 수행|

  <br>
  
  |Controller(ViewController)|
  |:-:|
  |<img width="600" alt="VC" src="https://github.com/user-attachments/assets/70e256b1-8580-4e95-afc4-ab3d73a1f357">|
  |Delegate 패턴을 통해 RootView로부터 User Action을 전달받고 Model 변경
   Model의 변화를 감지 후 RootView에 UI 업데이트 지시|

<br>

### 3D 오브젝트에 대한 POP

- 고민 지점

  - 3D 오브젝트 객체의 추상화를 통해 다형성을 활용하기 위한 설계
  - 인터페이스 분리 원칙을 준수한 프로토콜 설계

- 결과

<img width="1000" alt="프로토콜 설계" src="https://github.com/user-attachments/assets/227e62a4-e521-4b51-bffa-c9fe88ae0575">

<br>
<br>

## 🚨 주요 이슈와 해결 과정

### 터치 제스처 탐험하기에서 단계별 UIGestureRecognizer와 SceneKit Animation간의 동기화 이슈

- 문제 상황

  - 다양한 UIGestureRecognizer와 그에 맞는 SceneKit Animation 메서드들이 단계에 따라 추가되고 사라져야함
  - 관련 코드들이 여러 파일에서 복잡하게 얽혀 있어 상태 관리에 어려움을 겪음
 
- 해결 방식
  - 상태 패턴 사용
