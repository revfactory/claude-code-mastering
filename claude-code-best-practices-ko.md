# Claude Code 베스트 프랙티스

## 소개

Claude Code는 Anthropic의 공식 CLI 도구로, 엔지니어들이 코드베이스와 상호작용하는 방식을 혁신하고자 설계되었습니다. 이 문서는 Claude Code를 최대한 활용하기 위한 베스트 프랙티스를 안내합니다.

## 핵심 원칙

### 1. 유연하고 커스터마이징 가능한 접근 방식

Claude Code는 의도적으로 **low-level**이고 **unopinionated**하게 설계되었습니다:
- 특정 워크플로우를 강제하지 않음
- 원시 모델 접근을 제공
- 실험과 개인화를 장려

### 2. 설정 및 커스터마이징

**`CLAUDE.md` 파일 작성하기**

프로젝트 루트에 `CLAUDE.md` 파일을 생성하여 Claude에게 프로젝트별 지침을 제공할 수 있습니다:

```markdown
# 프로젝트 개요
이 프로젝트는 React와 TypeScript를 사용하는 웹 애플리케이션입니다.

# 개발 환경 설정
npm install
npm run dev

# 테스트 실행
npm test

# 코드 스타일 가이드라인
- 함수형 컴포넌트 사용
- TypeScript 타입 명시
- 의미 있는 변수명 사용

# Git 커밋 메시지 규칙
- feat: 새로운 기능
- fix: 버그 수정
- refactor: 코드 리팩토링
```

## 권장 워크플로우

### 1. 탐색, 계획, 코딩, 커밋 (Explore, Plan, Code, Commit)

```bash
# 1. 관련 파일 읽기
claude "src/ 디렉토리의 구조를 보여주고 주요 컴포넌트들을 설명해줘"

# 2. 상세한 계획 수립
claude "사용자 인증 기능을 추가하기 위한 계획을 세워줘"

# 3. 솔루션 구현
claude "계획에 따라 인증 기능을 구현해줘"

# 4. 변경사항 커밋 및 PR 생성
claude "변경사항을 커밋하고 PR을 생성해줘"
```

### 2. 테스트 주도 개발 (TDD)

```bash
# 1. 테스트 먼저 작성
claude "UserService에 대한 단위 테스트를 작성해줘"

# 2. 테스트 실패 확인
claude "테스트를 실행하고 실패하는지 확인해줘"

# 3. 테스트를 통과하는 코드 구현
claude "테스트를 통과하도록 UserService를 구현해줘"

# 4. 변경사항 커밋
claude "TDD로 구현한 변경사항을 커밋해줘"
```

### 3. 비주얼 반복 작업

```bash
# 1. 스크린샷 제공
claude "이 디자인 목업을 구현해줘" [스크린샷 첨부]

# 2. 초기 구현
claude "제공된 디자인에 따라 컴포넌트를 구현해줘"

# 3. 반복 및 개선
claude "버튼 스타일을 Material Design으로 변경해줘"
```

## 고급 기법

### 1. 멀티 인스턴스 활용

여러 Claude 인스턴스를 동시에 실행하여 병렬 작업 수행:

```bash
# 터미널 1: 프론트엔드 작업
claude "React 컴포넌트를 리팩토링해줘"

# 터미널 2: 백엔드 작업
claude "API 엔드포인트를 최적화해줘"

# 터미널 3: 테스트 작성
claude "통합 테스트를 작성해줘"
```

### 2. Git Worktree 활용

```bash
# 새로운 기능을 위한 worktree 생성
git worktree add ../feature-auth feature/authentication

# worktree에서 Claude 실행
cd ../feature-auth
claude "인증 기능을 구현해줘"
```

### 3. Headless 모드로 자동화

```bash
# CI/CD 파이프라인에서 자동 코드 리뷰
claude --headless "이 PR의 코드를 리뷰하고 개선사항을 제안해줘"

# 자동 문서 생성
claude --headless "API 문서를 자동으로 생성해줘"
```

### 4. 커스텀 슬래시 명령어

```bash
# .claude-code-settings.json에 커스텀 명령어 추가
{
  "customCommands": {
    "/deploy": "npm run build && npm run deploy",
    "/test-all": "npm test && npm run e2e"
  }
}
```

## 베스트 프랙티스

### 1. 명확하고 구체적인 지시

**좋은 예:**
```bash
claude "UserProfile 컴포넌트에서 사용자 이미지가 없을 때 기본 아바타를 표시하도록 수정해줘"
```

**나쁜 예:**
```bash
claude "프로필 수정해줘"
```

### 2. 시각적 참조 활용

- 디자인 목업 스크린샷 제공
- 버그 재현 화면 캡처
- 원하는 UI 변경사항 시각화

### 3. 조기 수정 및 피드백

```bash
# 초기 구현 확인
claude "지금까지 구현한 내용을 요약해줘"

# 필요시 방향 수정
claude "접근 방식을 변경해서 함수형 컴포넌트로 다시 구현해줘"
```

### 4. 컨텍스트 관리

```bash
# 긴 작업 후 컨텍스트 정리
claude /clear

# 새로운 작업 시작
claude "이제 다른 기능을 구현해보자"
```

### 5. 복잡한 작업을 위한 체크리스트

```bash
claude "다음 체크리스트에 따라 리팩토링을 진행해줘:
- [ ] 중복 코드 제거
- [ ] 함수 분리
- [ ] 타입 안전성 개선
- [ ] 테스트 커버리지 확인"
```

## 안전 권장사항

### 1. 권한 관리

```bash
# 주의해서 사용
claude --dangerously-skip-permissions

# 권장: 필요한 권한만 부여
claude --allow-write --allow-bash
```

### 2. 컨테이너 활용

```bash
# 인터넷 접속이 차단된 컨테이너에서 실행
docker run --network none claude-code
```

### 3. 도구 권한 신중히 관리

- 필요한 도구만 활성화
- 민감한 작업 시 권한 재확인
- 정기적으로 권한 설정 검토

## 실험과 개인화

Claude Code의 가장 큰 장점은 **유연성**입니다:

- 자신만의 워크플로우 개발
- 프로젝트에 맞는 커스터마이징
- 다양한 접근 방식 실험
- 팀과 베스트 프랙티스 공유

## 결론

Claude Code는 단순한 도구가 아닌, 개발 방식을 혁신할 수 있는 파트너입니다. 이 베스트 프랙티스를 출발점으로 삼아 자신만의 최적화된 워크플로우를 만들어보세요.

**기억하세요**: 완벽한 워크플로우는 없습니다. 지속적으로 실험하고, 개선하고, 자신과 팀에게 가장 적합한 방식을 찾아가세요.