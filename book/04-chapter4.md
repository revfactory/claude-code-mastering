# 제4장: CLAUDE.md로 프로젝트 맞춤 설정

> "좋은 도구는 사용자에게 맞춰진다" - 도널드 노먼

이 장에서는 **CLAUDE.md 파일을 통한 프로젝트 맞춤 설정**에 대해 알아보겠습니다. 각 프로젝트의 고유한 특성과 요구사항에 맞춰 Claude Code를 최적화하는 방법을 체계적으로 학습하겠습니다.

CLAUDE.md는 Claude Code가 프로젝트의 컨텍스트를 이해하고, 팀의 코딩 규칙을 준수하며, 일관된 품질의 코드를 생성하도록 돕는 핵심 도구입니다.

**이 장에서 다룰 내용:**
1. CLAUDE.md의 역할과 중요성
2. 프로젝트 구조 및 아키텍처 문서화
3. 코딩 스타일 가이드 정의
4. 개발 환경 자동화 설정
5. 팀 협업을 위한 규칙 수립
6. 실전 프로젝트 예제와 최적화 전략

## 4.1 CLAUDE.md의 역할과 중요성

### CLAUDE.md란?

CLAUDE.md는 프로젝트 루트 디렉토리에 위치하는 특별한 마크다운 파일입니다. 이 파일은 Claude Code에게 프로젝트별 지침과 규칙을 제공하여, 보다 정확하고 일관된 결과를 도출할 수 있게 합니다:

```
프로젝트 루트/
├── CLAUDE.md          # Claude Code 설정 파일
├── README.md          # 일반 프로젝트 문서
├── package.json
└── src/
```

### 왜 중요한가?

CLAUDE.md를 통해 얻을 수 있는 주요 이점들을 살펴보겠습니다:

**1. 일관성 보장**
```markdown
# CLAUDE.md
## 코드 스타일
- 모든 함수는 화살표 함수로 작성
- 세미콜론 항상 사용
- 들여쓰기는 2칸
```

**2. 팀 규칙 자동 적용**
```markdown
## Git 커밋 규칙
- feat: 새로운 기능
- fix: 버그 수정
- docs: 문서 수정
- style: 코드 포매팅
```

**3. 프로젝트 특화 지식**
```markdown
## 도메인 용어
- SKU: 재고 관리 단위
- PDP: 상품 상세 페이지
- CAC: 고객 획득 비용
```

### CLAUDE.md vs README.md

| 구분 | README.md | CLAUDE.md |
|------|-----------|-----------|
| 대상 | 사람 (개발자) | Claude Code |
| 목적 | 프로젝트 소개 | AI 작업 지침 |
| 내용 | 설치, 사용법 | 코딩 규칙, 아키텍처 |
| 형식 | 자유로운 형식 | 구조화된 형식 |

## 4.2 프로젝트 구조 문서화

### 기본 구조 설명

프로젝트의 디렉토리 구조와 각 파일의 역할을 명확히 정의하면 Claude Code가 더 정확한 작업을 수행할 수 있습니다:

```markdown
# CLAUDE.md

## 프로젝트 구조

### 디렉토리 구조
```
src/
├── components/      # React 컴포넌트
│   ├── common/     # 공통 컴포넌트
│   ├── features/   # 기능별 컴포넌트
│   └── layouts/    # 레이아웃 컴포넌트
├── hooks/          # 커스텀 React 훅
├── services/       # API 통신 로직
├── store/          # Redux 스토어
├── utils/          # 유틸리티 함수
└── types/          # TypeScript 타입 정의
```

### 주요 파일 위치
- 환경 설정: `.env`, `.env.example`
- API 엔드포인트: `src/services/api.ts`
- 라우팅 설정: `src/routes/index.tsx`
- 전역 스타일: `src/styles/global.css`
```

### 아키텍처 패턴 명시

프로젝트에서 사용하는 주요 아키텍처 패턴과 디자인 원칙을 명시하면 일관성 있는 코드를 생성할 수 있습니다:

```markdown
## 아키텍처 패턴

### 상태 관리
- Redux Toolkit 사용
- 각 기능별로 slice 파일 생성
- RTK Query로 API 상태 관리

### 컴포넌트 구조
```typescript
// 모든 컴포넌트는 다음 구조를 따름
interface ComponentProps {
  // props 정의
}

export const ComponentName: React.FC<ComponentProps> = (props) => {
  // 훅은 최상단에
  // 로직
  // JSX 반환
}
```

### 데이터 흐름
1. 사용자 액션 → 2. Action dispatch → 3. Reducer 처리 → 4. State 업데이트 → 5. UI 리렌더링
```

## 4.3 코딩 스타일 가이드 정의

### 언어별 스타일 가이드

프로젝트에서 사용하는 프로그래밍 언어별로 일관된 코딩 스타일을 정의해야 합니다:

```markdown
## 코딩 스타일

### TypeScript/JavaScript
- 함수명: camelCase
- 컴포넌트명: PascalCase  
- 상수: UPPER_SNAKE_CASE
- 파일명: kebab-case.ts

### 명명 규칙 예시
```typescript
// 좋은 예
const getUserData = async (userId: string) => { }
const MAX_RETRY_COUNT = 3;
export const UserProfile: React.FC = () => { }

// 피해야 할 예
const get_user_data = async (userid) => { }
const maxretrycount = 3;
export const userprofile = () => { }
```

### Import 순서
1. React 관련
2. 외부 라이브러리
3. 내부 모듈
4. 상대 경로 import
5. 스타일 파일

```typescript
import React, { useState, useEffect } from 'react';
import { useSelector } from 'react-redux';
import axios from 'axios';

import { API_ENDPOINTS } from '@/constants';
import { UserService } from '@/services';

import { Button } from '../components';
import './styles.css';
```
```

### 코드 품질 기준

높은 품질의 코드를 유지하기 위한 구체적인 기준과 규칙을 설정합니다:

```markdown
## 코드 품질 기준

### 함수 작성 규칙
- 함수는 한 가지 일만 수행
- 함수 길이는 50줄 이하
- 매개변수는 3개 이하
- 복잡도(Cyclomatic Complexity) 10 이하

### 에러 처리
```typescript
// 모든 비동기 함수는 try-catch 사용
try {
  const data = await fetchData();
  return { success: true, data };
} catch (error) {
  console.error('Error fetching data:', error);
  return { success: false, error: error.message };
}
```

### 주석 작성
- 코드가 '무엇을' 하는지가 아닌 '왜' 하는지 설명
- JSDoc 형식으로 함수 문서화
- TODO 주석은 이슈 번호와 함께

```typescript
/**
 * 사용자 인증 토큰을 검증합니다
 * @param token - JWT 토큰
 * @returns 토큰이 유효한지 여부
 */
const validateToken = (token: string): boolean => {
  // TODO(#123): 토큰 만료 시간 검증 로직 추가
  return jwt.verify(token, SECRET_KEY);
}
```
```

## 4.4 개발 환경 자동화

### 개발 환경 설정

일관된 개발 환경을 위한 필수 도구와 설정을 명시합니다:

```markdown
## 개발 환경

### 필수 도구
- Node.js 18.0 이상
- pnpm 8.0 이상 (npm 대신 사용)
- VS Code + 추천 확장 프로그램

### 초기 설정 스크립트
```bash
# 의존성 설치
pnpm install

# 환경 변수 설정
cp .env.example .env

# 데이터베이스 마이그레이션
pnpm db:migrate

# 개발 서버 시작
pnpm dev
```

### VS Code 설정
`.vscode/settings.json` 파일이 자동으로 적용됩니다:
- 자동 포매팅 (저장 시)
- ESLint 자동 수정
- 추천 확장 프로그램 설치 알림
```

### 자동화 스크립트

반복적인 작업을 자동화하여 개발 효율성을 높이는 스크립트들을 정의합니다:

```markdown
## 자동화 스크립트

### 자주 사용하는 명령어
```json
{
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "test": "jest --watch",
    "test:ci": "jest --ci --coverage",
    "lint": "eslint . --fix",
    "type-check": "tsc --noEmit",
    "pre-commit": "lint-staged",
    "generate:component": "plop component",
    "analyze": "ANALYZE=true next build"
  }
}
```

### 코드 생성 템플릿
`pnpm generate:component` 실행 시:
1. 컴포넌트 이름 입력
2. 컴포넌트 타입 선택 (일반/페이지/레이아웃)
3. 자동으로 파일 생성:
   - ComponentName.tsx
   - ComponentName.test.tsx
   - ComponentName.stories.tsx
   - index.ts

### Git Hooks
- pre-commit: 린트 및 포매팅 검사
- commit-msg: 커밋 메시지 형식 검증
- pre-push: 테스트 실행
```

## 4.5 팀 협업을 위한 규칙 설정

### 코드 리뷰 가이드라인

효과적인 코드 리뷰를 위한 체계적인 가이드라인을 수립합니다:

```markdown
## 코드 리뷰 가이드라인

### PR 작성 규칙
1. 제목: `[타입] 간단한 설명`
2. 본문 필수 포함 사항:
   - 변경 사항 요약
   - 관련 이슈 번호
   - 테스트 방법
   - 스크린샷 (UI 변경 시)

### 리뷰 체크리스트
- [ ] 코드가 프로젝트 컨벤션을 따르는가?
- [ ] 테스트가 충분히 작성되었는가?
- [ ] 성능 영향은 고려되었는가?
- [ ] 보안 취약점은 없는가?
- [ ] 문서는 업데이트되었는가?

### 머지 기준
- 최소 1명의 승인 필요
- 모든 CI 체크 통과
- 충돌 해결 완료
```

### 브랜치 전략

체계적인 Git 브랜치 관리를 위한 전략과 규칙을 정의합니다:

```markdown
## Git 브랜치 전략

### 브랜치 명명 규칙
- feature/기능명: 새 기능 개발
- fix/이슈번호: 버그 수정
- hotfix/설명: 긴급 수정
- refactor/대상: 리팩토링

### 브랜치 플로우
```
main
  ├── develop
  │     ├── feature/user-auth
  │     ├── feature/payment
  │     └── fix/123
  └── hotfix/critical-bug
```

### 머지 전략
- feature → develop: Squash merge
- develop → main: Merge commit
- hotfix → main: Cherry-pick
```

### 팀 커뮤니케이션

효율적인 팀 협업을 위한 커뮤니케이션 및 문서화 규칙을 수립합니다:

```markdown
## 팀 커뮤니케이션

### 이슈 템플릿
버그 리포트:
- 재현 단계
- 예상 동작
- 실제 동작
- 환경 정보

기능 요청:
- 사용자 스토리
- 수락 기준
- 기술적 고려사항

### 일일 스탠드업
매일 오전 10시, 다음 내용 공유:
1. 어제 한 일
2. 오늘 할 일
3. 블로커

### 기술 결정 기록
`docs/adr/` 디렉토리에 Architecture Decision Records 작성
- 배경
- 고려한 옵션들
- 결정 사항
- 결과
```

## 실전 예제: 대규모 전자상거래 프로젝트

실제 프로덕션 환경에서 사용할 수 있는 체계적이고 포괄적인 CLAUDE.md 예시를 살펴보겠습니다:

```markdown
# E-Commerce Project Guidelines for Claude Code

## 프로젝트 개요
대규모 전자상거래 플랫폼 (일 100만 MAU)

## 핵심 기술 스택
- Frontend: Next.js 14, TypeScript, Tailwind CSS
- State: Zustand + React Query
- Backend: Node.js, Express, PostgreSQL
- Infrastructure: AWS, Docker, K8s

## 도메인 지식

### 비즈니스 용어
- SKU: Stock Keeping Unit (재고 관리 코드)
- GMV: Gross Merchandise Volume (총 거래액)
- AOV: Average Order Value (평균 주문 금액)
- Cart Abandonment: 장바구니 이탈

### 핵심 도메인 모델
```typescript
interface Product {
  id: string;
  sku: string;
  name: string;
  price: Money;
  inventory: Inventory;
  category: Category;
}

interface Order {
  id: string;
  userId: string;
  items: OrderItem[];
  status: OrderStatus;
  payment: Payment;
  shipping: Shipping;
}
```

## 성능 요구사항
- 페이지 로드: 3초 이내
- API 응답: 200ms 이내
- 99.9% 가용성

## 보안 규칙
- 모든 사용자 입력 검증
- SQL Injection 방지
- XSS 방지
- 민감 정보 암호화

## 테스트 전략
- 단위 테스트: 80% 커버리지
- 통합 테스트: 핵심 플로우
- E2E 테스트: 구매 플로우

## 배포 프로세스
1. feature 브랜치에서 개발
2. PR 생성 및 리뷰
3. develop 브랜치 머지
4. 스테이징 자동 배포
5. QA 검증
6. 프로덕션 배포 (승인 필요)

## Claude Code 특별 지침
- 성능을 항상 고려하여 코드 작성
- 확장 가능한 아키텍처 유지
- 마이크로서비스 경계 준수
- 비동기 처리 우선
- 에러 로깅 필수
```

## 프로 팁: CLAUDE.md 최적화

### 1. 섹션별 우선순위

중요도에 따라 CLAUDE.md의 내용을 구조화하면 Claude Code가 더 효과적으로 규칙을 인식할 수 있습니다:

```markdown
# CLAUDE.md

## 🚨 중요 규칙 (항상 준수)
- 절대 main 브랜치에 직접 푸시 금지
- 모든 API 키는 환경 변수로
- 테스트 없는 코드 커밋 금지

## 📋 일반 가이드라인
- 가능하면 함수형 프로그래밍
- 주석은 최소화, 코드로 설명

## 💡 권장사항
- 새로운 라이브러리 도입 전 팀 논의
- 성능 최적화는 측정 후 진행
```

### 2. 동적 업데이트

CLAUDE.md를 업데이트했을 때 Claude Code가 새로운 규칙을 인식하도록 할 수 있습니다:

```bash
# CLAUDE.md 업데이트 시 Claude Code에게 알리기
claude "CLAUDE.md 파일이 업데이트되었어. 
새로운 규칙들을 확인하고 요약해줘"
```

### 3. 환경별 설정 관리

다양한 개발 환경에 따른 다른 설정을 체계적으로 관리할 수 있습니다:

```markdown
## 환경별 설정

### 개발 환경
- 로그 레벨: DEBUG
- 더미 데이터 사용 가능
- 에러 상세 정보 표시

### 프로덕션 환경
- 로그 레벨: ERROR
- 실제 데이터만 사용
- 에러 메시지 일반화
```

## 마치며

이 장에서는 CLAUDE.md를 통한 프로젝트 맞춤 설정 방법을 체계적으로 학습했습니다.

**핥심 학습 내용:**
- **구조화된 규칙 정의**: 프로젝트 구조, 코딩 스타일, 품질 기준
- **개발 환경 자동화**: 빌드, 테스트, 배포 프로세스 체계화
- **팀 협업 규칙**: 코드 리뷰, 브랜치 전략, 커뮤니케이션 지침
- **도메인 지식 공유**: 비즈니스 용어, 아키텍처 패턴, 성능 요구사항

**실무 적용 포인트:**
- 우선순위에 따른 규칙 구조화로 효과적인 지침 전달
- 환경별 설정 분리로 유연한 프로젝트 관리
- 동적 업데이트를 통한 지속적인 규칙 개선

**CLAUDE.md의 핵심 가치:**
1. **일관성**: 모든 팀원이 동일한 품질의 코드 생성
2. **효율성**: 반복 설명 없이 즉시 컨텍스트 이해
3. **품질 보장**: 베스트 프랙티스 자동 적용
4. **빠른 온보딩**: 새로운 팀원의 신속한 적응 지원

다음 장에서는 다양한 프레임워크별로 Claude Code를 효과적으로 활용하는 구체적인 전략과 베스트 프랙티스를 알아보겠습니다.