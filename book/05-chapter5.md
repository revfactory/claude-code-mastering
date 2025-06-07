# 제5장: 프레임워크별 베스트 프랙티스

> "올바른 도구를 올바른 작업에 사용하라" - 프로그래밍 격언

각 프레임워크는 고유한 철학과 패턴을 가지고 있습니다. Claude Code를 효과적으로 활용하려면 이러한 특성을 이해하고 프레임워크에 맞는 접근 방식을 사용해야 합니다.

## 5.1 React/Next.js 프로젝트

### React 프로젝트 초기 설정

```bash
# Vite를 사용한 React 프로젝트 생성
claude "Vite로 새로운 React TypeScript 프로젝트를 만들어줘. 
Tailwind CSS, React Router, React Query를 포함하고,
폴더 구조도 모범 사례에 따라 설정해줘"
```

Claude Code는 다음과 같은 구조를 생성합니다:

```
src/
├── components/
│   ├── common/        # Button, Input 등 공통 컴포넌트
│   ├── features/      # 기능별 컴포넌트
│   └── layouts/       # Header, Footer 등
├── hooks/            # 커스텀 훅
├── pages/            # 라우트별 페이지 컴포넌트
├── services/         # API 통신
├── store/            # 전역 상태 관리
├── utils/            # 유틸리티 함수
└── types/            # TypeScript 타입 정의
```

### React 컴포넌트 개발 패턴

**1. 컴포넌트 생성 요청**

```bash
claude "UserProfile 컴포넌트를 만들어줘. 
프로필 이미지, 이름, 소개를 표시하고,
편집 모드를 지원해야 해. 
Storybook 스토리와 테스트 코드도 함께 작성해줘"
```

**2. 상태 관리 통합**

```bash
claude "사용자 인증 상태를 전역으로 관리하는 
Context와 커스텀 훅을 만들어줘.
로그인, 로그아웃, 토큰 갱신 기능이 필요해"
```

**3. 성능 최적화**

```bash
claude "이 컴포넌트의 불필요한 리렌더링을 방지하도록 
React.memo, useMemo, useCallback을 적용해줘"
```

### Next.js 특화 기능

**1. App Router 활용**

```bash
claude "Next.js 14 App Router로 블로그를 만들어줘.
동적 라우팅, 메타데이터 최적화, 
그리고 ISR(Incremental Static Regeneration)을 활용해줘"
```

**2. Server Components 패턴**

```bash
claude "이 페이지를 Server Component로 리팩토링해줘.
데이터 페칭은 서버에서, 인터랙션은 Client Component로 분리해줘"
```

**3. API Routes 설계**

```bash
claude "RESTful API를 Next.js API routes로 구현해줘.
미들웨어로 인증을 처리하고, Zod로 요청 검증을 추가해줘"
```

### React/Next.js CLAUDE.md 예시

```markdown
# React/Next.js Project Guidelines

## 컴포넌트 규칙
- 함수형 컴포넌트만 사용
- Props는 인터페이스로 정의
- 컴포넌트당 하나의 파일

## 상태 관리
- 로컬 상태: useState
- 서버 상태: React Query (TanStack Query)
- 전역 상태: Zustand

## 폴더 구조
```
components/
├── Button/
│   ├── Button.tsx
│   ├── Button.test.tsx
│   ├── Button.stories.tsx
│   └── index.ts
```

## 성능 최적화
- 이미지는 next/image 사용
- 동적 import로 코드 스플리팅
- Lighthouse 점수 90+ 유지
```

## 5.2 Node.js/Express 백엔드

### Express 서버 구조화

```bash
claude "Express.js로 확장 가능한 REST API 서버를 만들어줘.
계층화된 아키텍처(Controller-Service-Repository)를 사용하고,
TypeScript, JWT 인증, 에러 핸들링, 로깅을 포함해줘"
```

권장 프로젝트 구조:

```
src/
├── controllers/      # 요청/응답 처리
├── services/        # 비즈니스 로직
├── repositories/    # 데이터 접근
├── models/         # 데이터 모델
├── middlewares/    # 미들웨어
├── utils/          # 유틸리티
├── config/         # 설정
└── types/          # TypeScript 타입
```

### 백엔드 개발 패턴

**1. RESTful API 설계**

```bash
claude "사용자 관리를 위한 RESTful API를 설계해줘.
CRUD 작업, 페이지네이션, 필터링, 정렬을 지원하고,
OpenAPI(Swagger) 문서도 자동 생성되도록 해줘"
```

**2. 데이터베이스 통합**

```bash
claude "Prisma ORM을 사용해서 User, Post, Comment 모델을 만들어줘.
관계 설정, 마이그레이션, 시드 데이터도 포함해줘"
```

**3. 인증/인가 구현**

```bash
claude "JWT 기반 인증 시스템을 구현해줘.
액세스 토큰과 리프레시 토큰을 사용하고,
역할 기반 접근 제어(RBAC)도 추가해줘"
```

### 마이크로서비스 아키텍처

```bash
claude "이 모놀리식 앱을 마이크로서비스로 분해해줘.
User Service, Product Service, Order Service로 나누고,
API Gateway와 서비스 간 통신 방법도 설계해줘"
```

### Node.js/Express CLAUDE.md 예시

```markdown
# Node.js/Express API Guidelines

## API 설계 원칙
- RESTful 원칙 준수
- 일관된 응답 형식
- 적절한 HTTP 상태 코드 사용

## 응답 형식
```json
{
  "success": true,
  "data": {},
  "message": "Success",
  "timestamp": "2024-01-01T00:00:00Z"
}
```

## 에러 처리
- 모든 에러는 중앙 에러 핸들러로
- 에러 로깅 필수
- 클라이언트에게는 일반화된 메시지

## 보안
- 모든 엔드포인트 rate limiting
- SQL Injection 방지
- 입력 검증 필수
```

## 5.3 Python/Django 애플리케이션

### Django 프로젝트 설정

```bash
claude "Django REST Framework로 블로그 API를 만들어줘.
사용자 인증, 포스트 CRUD, 댓글, 태그 기능을 포함하고,
테스트 코드와 API 문서화도 설정해줘"
```

### Django 개발 패턴

**1. 모델 설계**

```bash
claude "전자상거래를 위한 Django 모델을 설계해줘.
Product, Category, Order, User 모델과 관계를 정의하고,
Admin 인터페이스도 커스터마이징해줘"
```

**2. ViewSet과 Serializer**

```bash
claude "Product 모델에 대한 ViewSet과 Serializer를 만들어줘.
필터링, 검색, 정렬을 지원하고,
중첩된 관계도 효율적으로 처리해줘"
```

**3. 비동기 태스크**

```bash
claude "Celery를 사용해서 이메일 발송과 
이미지 처리를 비동기로 처리하도록 설정해줘"
```

### Python/Django CLAUDE.md 예시

```markdown
# Django Project Guidelines

## 앱 구조
- 기능별로 앱 분리
- 앱당 최대 10개 모델
- 순환 의존성 금지

## 모델 설계
- 모든 모델에 created_at, updated_at
- soft delete 사용 (is_deleted 필드)
- 관계는 명시적으로 정의

## API 설계
- ViewSet 사용 권장
- 커스텀 액션은 @action 데코레이터
- 페이지네이션 기본 20개

## 테스트
- 모델, 뷰, 시리얼라이저 각각 테스트
- Factory Boy로 테스트 데이터 생성
- 커버리지 80% 이상
```

## 5.4 모바일 앱 개발 (React Native/Flutter)

### React Native 프로젝트

```bash
claude "Expo로 크로스 플랫폼 모바일 앱을 만들어줘.
네비게이션, 상태 관리, 네이티브 기능 접근을 설정하고,
iOS와 Android 스타일 차이도 처리해줘"
```

### React Native 개발 패턴

**1. 네비게이션 구조**

```bash
claude "React Navigation으로 복잡한 네비게이션을 구현해줘.
Tab Navigator, Stack Navigator, Drawer를 조합하고,
딥링킹도 설정해줘"
```

**2. 네이티브 모듈 통합**

```bash
claude "카메라와 위치 정보에 접근하는 기능을 구현해줘.
권한 요청 처리와 에러 핸들링도 포함해줘"
```

### Flutter 프로젝트

```bash
claude "Flutter로 Material Design 앱을 만들어줘.
다국어 지원, 다크 모드, 반응형 레이아웃을 포함하고,
Clean Architecture 패턴을 적용해줘"
```

### 모바일 앱 CLAUDE.md 예시

```markdown
# Mobile App Guidelines

## 아키텍처
- MVVM 패턴 사용
- 비즈니스 로직은 ViewModel에
- View는 상태만 표시

## 성능
- 리스트는 가상화 필수
- 이미지 최적화 및 캐싱
- 애니메이션 60fps 유지

## 플랫폼별 처리
```javascript
Platform.select({
  ios: { /* iOS 스타일 */ },
  android: { /* Android 스타일 */ }
})
```

## 테스트
- 컴포넌트 테스트: Jest
- E2E 테스트: Detox
- 플랫폼별 테스트 필수
```

## 5.5 데이터 과학 프로젝트

### Jupyter Notebook 환경

```bash
claude "머신러닝 프로젝트를 위한 Jupyter 환경을 설정해줘.
데이터 분석, 시각화, 모델 학습 파이프라인을 구축하고,
실험 추적도 설정해줘"
```

### 데이터 분석 워크플로우

**1. 데이터 전처리**

```bash
claude "이 CSV 데이터를 분석하고 전처리해줘.
결측치 처리, 이상치 탐지, 특성 엔지니어링을 수행하고,
각 단계를 시각화해줘"
```

**2. 모델 개발**

```bash
claude "여러 머신러닝 모델을 비교 평가해줘.
교차 검증, 하이퍼파라미터 튜닝을 수행하고,
결과를 표로 정리해줘"
```

**3. 모델 배포**

```bash
claude "학습된 모델을 FastAPI로 서빙하는 API를 만들어줘.
입력 검증, 예측, 모니터링 기능을 포함해줘"
```

### 데이터 과학 CLAUDE.md 예시

```markdown
# Data Science Project Guidelines

## 프로젝트 구조
```
project/
├── data/           # 원본 데이터
├── notebooks/      # 실험 노트북
├── src/           # 재사용 가능한 코드
├── models/        # 학습된 모델
└── reports/       # 분석 결과
```

## 코딩 규칙
- 노트북은 실험용, 프로덕션 코드는 .py로
- 모든 실험은 추적 가능하게
- 재현 가능성 보장 (시드 고정)

## 데이터 처리
- 원본 데이터는 수정하지 않음
- 전처리 파이프라인 문서화
- 데이터 버전 관리

## 모델 관리
- MLflow로 실험 추적
- 모델 버전 관리
- A/B 테스트 지원
```

## 프레임워크 독립적인 베스트 프랙티스

### 1. 초기 탐색 전략

```bash
# 새 프로젝트 시작 시
claude "이 프로젝트의 구조와 사용된 기술 스택을 분석해줘.
주요 파일들의 역할과 데이터 흐름을 설명해줘"
```

### 2. 점진적 개선

```bash
# 기존 코드 개선
claude "이 코드를 리팩토링해줘. 
먼저 테스트를 작성해서 동작을 보장한 후,
단계별로 개선해줘"
```

### 3. 문서화 자동화

```bash
# 문서 생성
claude "프로젝트의 README.md를 업데이트해줘.
설치 방법, 사용법, API 문서, 기여 가이드를 포함해줘"
```

### 4. 성능 프로파일링

```bash
# 성능 분석
claude "이 애플리케이션의 성능을 프로파일링하고,
병목 지점을 찾아서 최적화 방안을 제시해줘"
```

## 실전 팁: 프레임워크 전환

기존 프로젝트를 다른 프레임워크로 마이그레이션할 때:

```bash
# 1. 현재 상태 분석
claude "이 Express 앱의 핵심 기능과 구조를 분석해줘"

# 2. 마이그레이션 계획
claude "이 앱을 Fastify로 마이그레이션하는 계획을 세워줘.
단계별로 진행하되, 서비스 중단 없이 진행할 수 있도록 해줘"

# 3. 점진적 마이그레이션
claude "인증 모듈부터 Fastify로 마이그레이션해줘.
기존 Express 라우트와 공존할 수 있도록 프록시를 설정해줘"
```

## 마치며

각 프레임워크는 고유한 철학과 모범 사례를 가지고 있습니다. Claude Code를 효과적으로 활용하는 핵심은:

1. **프레임워크 철학 이해**: 각 프레임워크의 핵심 개념 숙지
2. **관용구 사용**: 프레임워크 커뮤니티의 관례 따르기
3. **도구 활용**: 프레임워크별 전용 도구와 라이브러리 활용
4. **지속적 학습**: 새로운 버전과 기능 추적

다음 장에서는 언어별로 Claude Code를 최적화하는 전략을 알아보겠습니다. 각 프로그래밍 언어의 특성을 살려 더욱 효과적으로 개발하는 방법을 탐구해봅시다.