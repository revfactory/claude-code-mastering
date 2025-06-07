# 제3장: 기본 사용법 마스터

> "천 리 길도 한 걸음부터" - 노자

Claude Code의 기본기를 탄탄히 다지는 것은 매우 중요합니다. 이 장에서는 일상적인 개발 작업에서 Claude Code를 효과적으로 활용하는 방법을 실습 위주로 학습합니다.

## 3.1 기본 명령어 구조

### 명령어 해부학

Claude Code 명령어의 기본 구조를 이해해봅시다:

```bash
claude [옵션] [명령/질문]
  ^      ^         ^
  |      |         |
  |      |         +-- 자연어로 작성하는 요청
  |      +------------ 동작 방식을 제어하는 플래그
  +------------------ 기본 명령어
```

### 주요 옵션들

```bash
# 도움말 보기
claude --help
claude -h

# 버전 확인
claude --version
claude -v

# 대화 기록 지우기
claude --clear
claude -c

# 특정 모델 사용
claude --model claude-3-opus "복잡한 알고리즘 구현해줘"
claude -m claude-3-haiku "간단한 설명만 해줘"

# 출력 형식 제어
claude --json "프로젝트 구조를 JSON으로 출력해줘"
claude --markdown "README 파일 내용을 마크다운으로 보여줘"
```

### 자연어 명령의 힘

Claude Code의 가장 큰 장점은 자연스러운 언어로 소통할 수 있다는 점입니다:

```bash
# 기술적인 요청
claude "UserService 클래스에 이메일 검증 메서드를 추가해줘"

# 탐색적인 질문
claude "이 프로젝트에서 인증은 어떻게 처리되고 있어?"

# 창의적인 요청
claude "이 함수를 더 효율적으로 만들 수 있는 방법이 있을까?"

# 복합적인 작업
claude "버그를 찾아서 수정하고, 테스트도 작성한 다음, 커밋 메시지까지 만들어줘"
```

## 3.2 파일 탐색과 읽기

### 프로젝트 구조 파악하기

새로운 프로젝트를 시작할 때 가장 먼저 해야 할 일:

```bash
# 전체 프로젝트 구조 보기
claude "프로젝트 구조를 트리 형태로 보여줘"

# 특정 디렉토리 탐색
claude "src 폴더 안에 어떤 파일들이 있는지 보여줘"

# 파일 타입별로 찾기
claude "모든 TypeScript 파일을 찾아줘"

# 최근 수정된 파일 찾기
claude "최근 24시간 내에 수정된 파일들을 보여줘"
```

### 효율적인 파일 읽기

```bash
# 단일 파일 읽기
claude "package.json 파일을 읽어줘"

# 여러 파일 동시에 읽기
claude "모든 설정 파일들(config로 시작하는)을 읽고 요약해줘"

# 특정 부분만 읽기
claude "app.js 파일에서 라우터 설정 부분만 보여줘"

# 파일 비교
claude "개발 환경과 프로덕션 환경 설정 파일을 비교해줘"
```

### 코드 분석 요청

```bash
# 함수 분석
claude "calculateTotalPrice 함수가 어떻게 동작하는지 설명해줘"

# 의존성 분석
claude "이 프로젝트가 사용하는 주요 라이브러리들과 용도를 설명해줘"

# 아키텍처 분석
claude "이 프로젝트의 전체적인 아키텍처를 다이어그램으로 설명해줘"

# 보안 취약점 검사
claude "보안상 문제가 될 수 있는 코드가 있는지 검사해줘"
```

## 3.3 코드 작성과 수정

### 새 파일 생성

```bash
# 기본적인 파일 생성
claude "utils 폴더에 날짜 관련 유틸리티 함수들을 만들어줘"

# 템플릿 기반 생성
claude "Express 라우터 템플릿으로 user 라우터를 만들어줘"

# 테스트 파일 자동 생성
claude "UserService에 대한 Jest 테스트 파일을 만들어줘"

# 문서 생성
claude "API 엔드포인트 문서를 Swagger 형식으로 만들어줘"
```

### 코드 수정 패턴

**1. 단순 수정**
```bash
claude "모든 var를 const나 let으로 바꿔줘"
```

**2. 리팩토링**
```bash
claude "이 함수를 더 작은 함수들로 분리해줘"
```

**3. 기능 추가**
```bash
claude "이 컴포넌트에 로딩 상태 처리를 추가해줘"
```

**4. 버그 수정**
```bash
claude "null 참조 오류가 발생할 수 있는 부분을 찾아서 수정해줘"
```

### 코드 스타일 통일

```bash
# 포매팅
claude "프로젝트 전체를 Prettier 규칙에 맞게 포매팅해줘"

# 네이밍 컨벤션
claude "camelCase를 snake_case로 변경해줘"

# 주석 추가
claude "복잡한 로직에 설명 주석을 추가해줘"

# 타입 추가
claude "JavaScript 파일에 TypeScript 타입을 추가해줘"
```

## 3.4 테스트 실행과 디버깅

### 테스트 작성

```bash
# 단위 테스트
claude "calculateDiscount 함수에 대한 단위 테스트를 작성해줘"

# 통합 테스트
claude "사용자 등록 API에 대한 통합 테스트를 작성해줘"

# 엣지 케이스
claude "이 함수의 엣지 케이스를 찾아서 테스트를 추가해줘"

# 테스트 커버리지
claude "테스트 커버리지를 확인하고 누락된 부분에 테스트를 추가해줘"
```

### 디버깅 전략

**1. 오류 메시지 분석**
```bash
claude "이 오류 메시지가 무엇을 의미하는지 설명하고 해결 방법을 제시해줘:
TypeError: Cannot read property 'name' of undefined"
```

**2. 로그 추가**
```bash
claude "문제가 발생하는 것 같은 부분에 디버그 로그를 추가해줘"
```

**3. 단계별 추적**
```bash
claude "이 함수의 실행 흐름을 단계별로 추적할 수 있도록 코드를 수정해줘"
```

**4. 성능 분석**
```bash
claude "이 코드의 성능 병목 지점을 찾아서 최적화해줘"
```

### 실시간 디버깅 세션

```bash
# 대화형 디버깅 시작
claude

> 서버가 시작되지 않아. 포트 3000에서 이미 사용 중이라는 오류가 나와.
< 포트 3000을 사용하는 프로세스를 확인해보겠습니다...

> 확인했더니 이전에 실행한 서버가 종료되지 않았어.
< 프로세스를 종료하고 서버를 재시작하는 스크립트를 만들어드릴까요?

> 좋아, 그리고 앞으로 이런 일이 발생하지 않도록 graceful shutdown도 구현해줘.
< 알겠습니다. 서버 종료 시 정리 작업을 수행하는 코드를 추가하겠습니다...
```

## 3.5 Git 연동과 버전 관리

### 기본 Git 작업

```bash
# 상태 확인
claude "git 상태를 확인하고 변경사항을 요약해줘"

# 스테이징
claude "수정된 파일 중 테스트 관련 파일만 스테이징해줘"

# 커밋
claude "의미 있는 커밋 메시지를 작성해서 커밋해줘"

# 브랜치 관리
claude "새로운 기능을 위한 브랜치를 만들고 체크아웃해줘"
```

### 고급 Git 작업

```bash
# 대화형 리베이스
claude "최근 3개 커밋을 정리해서 하나로 합쳐줘"

# 충돌 해결
claude "머지 충돌을 해결해줘. 두 변경사항을 모두 유지하는 방향으로"

# 히스토리 분석
claude "이 버그가 언제 도입됐는지 git bisect로 찾아줘"

# 체리픽
claude "hotfix 브랜치의 버그 수정 커밋만 main으로 체리픽해줘"
```

### Pull Request 작성

```bash
# PR 생성
claude "이 기능에 대한 Pull Request를 생성해줘. 
변경사항을 요약하고, 테스트 방법도 포함해줘"

# 코드 리뷰 대응
claude "리뷰어가 지적한 사항들을 수정하고 답변을 작성해줘"

# PR 템플릿 활용
claude "프로젝트의 PR 템플릿에 맞춰서 설명을 작성해줘"
```

## 실전 예제: Todo 앱 만들기

이제까지 배운 내용을 종합해서 간단한 Todo 앱을 만들어봅시다:

### 1단계: 프로젝트 설정

```bash
# 프로젝트 생성
claude "React와 TypeScript로 Todo 앱 프로젝트를 생성해줘. 
Vite를 사용하고, ESLint와 Prettier도 설정해줘"
```

### 2단계: 컴포넌트 개발

```bash
# 컴포넌트 생성
claude "TodoList, TodoItem, AddTodo 컴포넌트를 만들어줘. 
각 컴포넌트는 TypeScript 인터페이스도 포함해야 해"
```

### 3단계: 상태 관리

```bash
# 상태 관리 추가
claude "Context API를 사용해서 Todo 상태 관리를 구현해줘. 
추가, 삭제, 완료 토글 기능이 필요해"
```

### 4단계: 스타일링

```bash
# UI 개선
claude "Tailwind CSS를 사용해서 모던한 디자인을 적용해줘. 
다크 모드도 지원하도록 해줘"
```

### 5단계: 테스트

```bash
# 테스트 작성
claude "주요 기능들에 대한 React Testing Library 테스트를 작성해줘"
```

### 6단계: 배포 준비

```bash
# 빌드 및 최적화
claude "프로덕션 빌드를 위한 설정을 최적화하고, 
Vercel에 배포하기 위한 설정 파일을 만들어줘"
```

## 프로 팁: 효율성 극대화

### 1. 별칭(Alias) 설정

```bash
# ~/.bashrc 또는 ~/.zshrc에 추가
alias cc="claude"
alias ccc="claude --clear"
alias ccr="claude 'npm run'"
```

### 2. 템플릿 활용

```bash
# 자주 사용하는 명령어 템플릿 만들기
echo "새로운 React 컴포넌트를 만들어줘. 
함수형 컴포넌트로, TypeScript와 함께, 
기본 props 인터페이스도 포함해줘" > ~/.claude-templates/react-component.txt

# 템플릿 사용
claude < ~/.claude-templates/react-component.txt
```

### 3. 컨텍스트 유지

```bash
# 긴 작업을 할 때는 대화형 모드 사용
claude
> 이제부터 대규모 리팩토링을 시작할 거야
> 먼저 현재 아키텍처를 분석해줘
> ... (계속되는 대화)
```

## 마치며

이 장에서는 Claude Code의 기본적인 사용법을 익혔습니다. 핵심은:

1. **자연스러운 대화**: 기술적인 명령어가 아닌 일상 언어로 소통
2. **컨텍스트 이해**: Claude Code는 프로젝트 전체를 이해하고 작업
3. **반복 작업 자동화**: 단순 작업은 Claude Code에게 맡기고 창의적인 일에 집중
4. **지속적인 학습**: Claude Code와의 대화를 통해 새로운 패턴과 방법 발견

다음 장에서는 CLAUDE.md 파일을 통해 프로젝트별로 Claude Code를 커스터마이징하는 방법을 알아보겠습니다. 
각 프로젝트의 고유한 요구사항에 맞춰 Claude Code를 최적화하는 법을 배워봅시다!