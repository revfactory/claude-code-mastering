# 제10장: 웹 애플리케이션 구축

> "실습은 이론을 현실로 만든다" - 벤자민 프랭클린

이 장에서는 Claude Code를 활용해 실제 웹 애플리케이션을 처음부터 끝까지 구축해보겠습니다. 실시간 채팅이 있는 협업 도구를 만들면서 지금까지 배운 모든 기법을 종합적으로 활용해봅시다.

## 10.1 프로젝트 설계와 아키텍처

### 프로젝트 개요: "CollabSpace"

실시간 협업 도구로 다음 기능들을 포함합니다:
- 사용자 인증 및 권한 관리
- 프로젝트 및 워크스페이스 관리
- 실시간 채팅
- 파일 공유
- 작업 관리 (칸반 보드)

### 아키텍처 설계

```bash
claude "CollabSpace라는 협업 도구의 아키텍처를 설계해줘.
다음 요구사항을 만족해야 해:
- 100명 동시 사용자 지원
- 실시간 통신
- 확장 가능한 구조
- 마이크로서비스 패턴
- 클라우드 네이티브"
```

### 기술 스택 선정

```bash
claude "설계한 아키텍처에 최적화된 기술 스택을 추천해줘.
프론트엔드, 백엔드, 데이터베이스, 인프라를 포함하고
각각의 선택 이유도 설명해줘"
```

선정된 기술 스택:
```
Frontend: Next.js 14, TypeScript, Tailwind CSS
Backend: Node.js, Express, Socket.io
Database: PostgreSQL, Redis
Auth: NextAuth.js
Infrastructure: Docker, AWS
```

## 10.2 프로젝트 초기 설정

### 모노레포 구조 생성

```bash
claude "Turborepo를 사용해서 모노레포 구조를 만들어줘.
apps/web (프론트엔드), apps/api (백엔드), 
packages/shared (공통 라이브러리) 구조로 설정해줘"
```

생성된 구조:
```
collab-space/
├── apps/
│   ├── web/          # Next.js 프론트엔드
│   └── api/          # Express 백엔드
├── packages/
│   ├── ui/           # 공통 UI 컴포넌트
│   ├── types/        # TypeScript 타입 정의
│   └── config/       # 공통 설정
├── docker/
├── docs/
└── CLAUDE.md
```

### CLAUDE.md 작성

```bash
claude "이 프로젝트의 CLAUDE.md를 작성해줘.
개발 규칙, 코딩 스타일, 아키텍처 가이드라인을 포함해줘"
```

```markdown
# CollabSpace Development Guidelines

## 프로젝트 구조
- 모노레포 (Turborepo)
- 마이크로서비스 아키텍처
- 실시간 통신 (Socket.io)

## 개발 규칙
- TypeScript 엄격 모드
- 함수형 프로그래밍 선호
- 테스트 커버리지 80% 이상

## API 설계
- RESTful + GraphQL
- 일관된 에러 응답
- 버전 관리 필수

## 실시간 통신
- Socket.io namespaces 활용
- 이벤트 타입 안전성 보장
- 연결 상태 관리
```

## 10.3 백엔드 개발

### 인증 시스템 구현

```bash
claude "JWT 기반 인증 시스템을 구현해줘.
회원가입, 로그인, 토큰 갱신, 권한 미들웨어를 포함하고
보안 베스트 프랙티스를 적용해줘"
```

### 데이터베이스 설계

```bash
claude "Prisma를 사용해서 데이터베이스 스키마를 설계해줘.
User, Workspace, Project, Message, Task 엔티티와
관계를 정의해줘"
```

생성된 스키마:
```prisma
// schema.prisma
model User {
  id        String   @id @default(cuid())
  email     String   @unique
  name      String
  avatar    String?
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt

  memberships WorkspaceMember[]
  messages    Message[]
  tasks       Task[]
}

model Workspace {
  id          String   @id @default(cuid())
  name        String
  description String?
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt

  members  WorkspaceMember[]
  projects Project[]
  channels Channel[]
}

model WorkspaceMember {
  id          String    @id @default(cuid())
  role        Role      @default(MEMBER)
  joinedAt    DateTime  @default(now())
  
  user        User      @relation(fields: [userId], references: [id])
  userId      String
  workspace   Workspace @relation(fields: [workspaceId], references: [id])
  workspaceId String

  @@unique([userId, workspaceId])
}

enum Role {
  OWNER
  ADMIN
  MEMBER
}
```

### 실시간 통신 구현

```bash
claude "Socket.io를 사용해서 실시간 채팅을 구현해줘.
네임스페이스별 방 관리, 메시지 저장, 온라인 사용자 표시,
타이핑 인디케이터를 포함해줘"
```

### API 엔드포인트 개발

```bash
claude "RESTful API를 체계적으로 구현해줘.
라우터 구조, 미들웨어, 에러 처리, 입력 검증을 포함하고
OpenAPI 스펙도 자동 생성되도록 해줘"
```

## 10.4 프론트엔드 개발

### 프로젝트 설정

```bash
claude "Next.js 14 프로젝트를 설정해줘.
App Router, TypeScript, Tailwind CSS, 
상태 관리 (Zustand), UI 라이브러리 (shadcn/ui)를 포함해줘"
```

### 인증 구현

```bash
claude "NextAuth.js를 사용해서 프론트엔드 인증을 구현해줘.
소셜 로그인 (Google, GitHub), 세션 관리,
보호된 라우트를 포함해줘"
```

### 실시간 기능 구현

```bash
claude "Socket.io 클라이언트를 구현해줘.
연결 관리, 이벤트 리스너, 재연결 로직,
React 컴포넌트와의 통합을 포함해줘"
```

### UI 컴포넌트 개발

```bash
claude "채팅 인터페이스를 구현해줘.
메시지 목록, 입력창, 파일 업로드, 이모지 선택기,
반응형 디자인을 포함해줘"
```

### 상태 관리

```bash
claude "Zustand를 사용해서 전역 상태를 관리해줘.
사용자 정보, 워크스페이스, 채팅 메시지, 
실시간 연결 상태를 포함해줘"
```

## 10.5 실시간 기능 추가

### 채팅 시스템

```bash
claude "실시간 채팅 시스템을 완성해줘.
메시지 전송/수신, 읽음 확인, 메시지 편집/삭제,
파일 첨부, 멘션 기능을 포함해줘"
```

### 협업 기능

```bash
claude "실시간 협업 기능을 추가해줘.
동시 편집 표시, 커서 위치 공유, 
실시간 알림, 활동 피드를 구현해줘"
```

### 칸반 보드

```bash
claude "드래그 앤 드롭이 가능한 칸반 보드를 구현해줘.
실시간 동기화, 카드 이동, 상태 변경,
다중 사용자 편집을 지원해줘"
```

## 10.6 테스트 구현

### 백엔드 테스트

```bash
claude "백엔드 API에 대한 종합적인 테스트를 작성해줘.
단위 테스트, 통합 테스트, Socket.io 테스트를 포함하고
테스트 데이터베이스 설정도 해줘"
```

### 프론트엔드 테스트

```bash
claude "React 컴포넌트 테스트를 작성해줘.
React Testing Library, Jest를 사용하고
사용자 상호작용, 실시간 기능, 상태 변경을 테스트해줘"
```

### E2E 테스트

```bash
claude "Playwright를 사용해서 E2E 테스트를 작성해줘.
사용자 시나리오 (회원가입, 로그인, 채팅, 협업)를
전체적으로 테스트해줘"
```

## 10.7 성능 최적화

### 프론트엔드 최적화

```bash
claude "프론트엔드 성능을 최적화해줘.
코드 스플리팅, 이미지 최적화, 메모이제이션,
가상 스크롤링을 적용해줘"
```

### 백엔드 최적화

```bash
claude "백엔드 성능을 최적화해줘.
데이터베이스 쿼리 최적화, 캐싱 (Redis),
Connection pooling, 응답 압축을 적용해줘"
```

### 실시간 통신 최적화

```bash
claude "Socket.io 성능을 최적화해줘.
네임스페이스 관리, 메모리 사용량 최적화,
연결 수 제한, 메시지 큐잉을 구현해줘"
```

## 10.8 보안 강화

### 인증/인가 보안

```bash
claude "보안을 강화해줘.
CSRF 방지, Rate limiting, 
입력 검증, SQL Injection 방지,
XSS 방지를 구현해줘"
```

### 실시간 통신 보안

```bash
claude "Socket.io 보안을 강화해줘.
네임스페이스별 권한 검사, 메시지 검증,
스팸 방지, 악성 사용자 차단을 구현해줘"
```

## 10.9 배포 및 인프라

### Docker 컨테이너화

```bash
claude "애플리케이션을 Docker로 컨테이너화해줘.
멀티 스테이지 빌드, 최적화된 이미지 크기,
개발/프로덕션 환경 분리를 적용해줘"
```

### CI/CD 파이프라인

```bash
claude "GitHub Actions를 사용해서 CI/CD 파이프라인을 구축해줘.
테스트 자동화, 보안 스캔, 
자동 배포, 롤백 절차를 포함해줘"
```

### AWS 배포

```bash
claude "AWS에 배포 가능한 인프라를 구성해줘.
ECS, RDS, ElastiCache, CloudFront,
로드 밸런서, 오토 스케일링을 포함해줘"
```

## 10.10 모니터링과 로깅

### 애플리케이션 모니터링

```bash
claude "종합적인 모니터링 시스템을 구축해줘.
성능 메트릭, 에러 추적, 
사용자 행동 분석, 실시간 알림을 포함해줘"
```

### 로깅 시스템

```bash
claude "구조화된 로깅 시스템을 구현해줘.
로그 레벨, 상관 관계 ID,
중앙 집중식 로그 수집을 포함해줘"
```

## 실전 개발 시나리오

### 주차별 개발 계획

**1주차: 기반 구조**
```bash
# Day 1-2: 프로젝트 설정
claude "모노레포 구조와 기본 설정을 완료해줘"

# Day 3-4: 인증 시스템
claude "백엔드 인증과 프론트엔드 로그인을 구현해줘"

# Day 5: 데이터베이스 설계
claude "Prisma 스키마와 기본 API를 완성해줘"
```

**2주차: 핵심 기능**
```bash
# Day 1-3: 실시간 채팅
claude "Socket.io 기반 채팅 시스템을 구현해줘"

# Day 4-5: 워크스페이스 관리
claude "워크스페이스 CRUD와 멤버 관리를 구현해줘"
```

**3주차: 고급 기능**
```bash
# Day 1-3: 칸반 보드
claude "드래그 앤 드롭 칸반 보드를 구현해줘"

# Day 4-5: 파일 관리
claude "파일 업로드와 공유 기능을 구현해줘"
```

**4주차: 최적화와 배포**
```bash
# Day 1-2: 성능 최적화
claude "프론트엔드와 백엔드 성능을 최적화해줘"

# Day 3-4: 테스트 구현
claude "종합적인 테스트 스위트를 작성해줘"

# Day 5: 배포
claude "프로덕션 배포를 완료해줘"
```

## 개발 과정에서 배운 교훈

### 1. 점진적 개발의 중요성

```bash
claude "MVP부터 시작해서 점진적으로 기능을 추가하는 방식이
왜 효과적인지 설명해줘"
```

### 2. 실시간 기능의 복잡성

```bash
claude "실시간 기능 구현 시 주의해야 할 점들과
해결 방법을 정리해줘"
```

### 3. 확장 가능한 아키텍처

```bash
claude "처음부터 확장성을 고려한 설계가
어떤 이점을 가져다주는지 분석해줘"
```

## 마치며

이 장에서 우리는 Claude Code를 활용해 완전한 웹 애플리케이션을 구축했습니다. 핵심 교훈:

1. **체계적 접근**: 설계 → 구현 → 테스트 → 최적화 → 배포
2. **실시간 협업**: Claude Code와의 효율적인 소통
3. **품질 유지**: 테스트와 코드 리뷰의 중요성
4. **성능 고려**: 처음부터 성능을 염두에 둔 개발

다음 장에서는 팀 환경에서 Claude Code를 효과적으로 활용하는 방법을 알아보겠습니다.