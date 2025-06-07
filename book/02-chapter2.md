# 제2장: 설치와 초기 설정

> "시작이 반이다" - 한국 속담

이제 Claude Code를 설치해보겠습니다. 이 장에서는 **각 운영체제별로 단계별 설치 가이드**를 제공하며, 설치 과정에서 발생할 수 있는 문제들과 해결 방법도 함께 다룹니다.

설치 과정은 다음과 같이 구성됩니다:
1. 시스템 요구사항 확인
2. 운영체제별 설치 진행
3. 기본 설정 및 최적화
4. 문제 해결 및 검증

## 2.1 시스템 요구사항

### 최소 요구사항

먼저 시스템이 Claude Code를 실행할 수 있는지 확인해보겠습니다. 최소 요구사항은 일반적인 개발 환경과 유사하며, 대부분의 현대적인 시스템에서 실행 가능합니다.

| 구성 요소 | 최소 요구사항 | 권장 사항 |
|----------|-------------|----------|
| 운영체제 | macOS 12+, Windows 10+, Ubuntu 20.04+ | 최신 버전 |
| RAM | 8GB | 16GB 이상 |
| 저장공간 | 2GB 여유 공간 | 10GB 이상 |
| 인터넷 | 안정적인 연결 필요 | 고속 인터넷 |
| Node.js | 18.0 이상 | 20.0 이상 |

### 사전 준비사항

설치 전 시스템 환경을 확인하겠습니다. 터미널을 열고 다음 명령어들을 실행하여 필요한 도구들이 설치되어 있는지 확인하세요.

**터미널 실행 방법:**
- **Mac**: `Cmd + Space` → "터미널" 검색
- **Windows**: `Win + R` → "cmd" 입력
- **Linux**: `Ctrl + Alt + T`

```bash
# Node.js 버전 확인
node --version

# npm 버전 확인
npm --version

# Git 설치 확인 (선택사항이지만 권장)
git --version
```

**Node.js가 설치되어 있지 않거나 버전이 낮다면:**
1. [Node.js 공식 사이트](https://nodejs.org)에서 LTS 버전을 다운로드하세요
2. 또는 패키지 매니저를 사용하세요:
   - **Mac**: `brew install node` (Homebrew 필요)
   - **Windows**: `choco install nodejs` (Chocolatey 필요)
   - **Linux**: `sudo apt install nodejs npm` (Ubuntu/Debian)

> **권장사항**: LTS(Long Term Support) 버전을 사용하면 안정성과 호환성을 보장받을 수 있습니다.

## 2.2 설치 가이드 (OS별)

이제 운영체제별로 Claude Code를 설치하겠습니다. 각 OS에 최적화된 설치 방법을 제공합니다.

### macOS에서 설치하기

macOS에서는 두 가지 설치 방법을 제공합니다.

**방법 1: npm을 통한 설치 (권장)**

가장 간단하고 안정적인 방법입니다:

```bash
# Claude Code 설치
npm install -g @anthropic-ai/claude-code

# 설치 확인
claude --version
```

**방법 2: Homebrew를 통한 설치**

```bash
# Homebrew tap 추가
brew tap anthropic-ai/claude-code

# Claude Code 설치
brew install claude-code

# 설치 확인
claude --version
```

**macOS 특화 설정**

```bash
# 터미널 권한 설정 (필요한 경우)
# 시스템 환경설정 > 보안 및 개인정보 > 개인정보 > 전체 디스크 접근 권한
# Terminal.app 또는 사용 중인 터미널 앱 추가

# Spotlight 검색 제외 (선택사항)
# .claude-code 디렉토리를 Spotlight 검색에서 제외하여 성능 향상
```

### Windows에서 설치하기

Windows에서도 간단하게 설치할 수 있습니다.

**방법 1: npm을 통한 설치 (권장)**

> **중요**: Windows에서는 PowerShell을 **관리자 권한**으로 실행해야 합니다.
> - `Win + X`를 누르고 "Windows PowerShell(관리자)" 선택
> - 또는 시작 메뉴에서 PowerShell을 우클릭 → "관리자 권한으로 실행"

```powershell
# Claude Code 설치
npm install -g @anthropic-ai/claude-code

# 설치 확인 (버전이 출력되면 성공!)
claude --version
```

**방법 2: Windows 설치 프로그램 사용**

1. Claude Code 공식 사이트에서 Windows 설치 프로그램(.exe) 다운로드
2. 다운로드한 파일 실행
3. 설치 마법사 지시에 따라 진행
4. 시스템 PATH에 자동으로 추가됨

**Windows 특화 설정**

```powershell
# Windows Defender 예외 추가 (성능 향상)
Add-MpPreference -ExclusionPath "$env:APPDATA\claude-code"

# 긴 경로 지원 활성화
git config --system core.longpaths true
```

### Linux (Ubuntu/Debian)에서 설치하기

```bash
# 시스템 패키지 업데이트
sudo apt update && sudo apt upgrade

# Node.js 설치 (아직 없는 경우)
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs

# Claude Code 설치
sudo npm install -g @anthropic-ai/claude-code

# 설치 확인
claude --version

# 권한 설정 (필요한 경우)
sudo chmod +x /usr/local/bin/claude
```

## 2.3 첫 번째 명령어 실행하기

설치가 완료되었습니다. 이제 Claude Code의 기본 설정을 진행하겠습니다.

### API 키 설정

Claude Code를 사용하려면 API 키 설정이 필요합니다. 무료 사용량으로 시작할 수 있습니다.

**1단계: API 키 발급받기**
1. [Anthropic Console](https://console.anthropic.com)에 접속하세요
2. 계정을 만들거나 로그인하세요
3. "API Keys" 섹션에서 새 키를 생성하세요

**2단계: API 키 설정하기**
```bash
# API 키 설정 명령어 실행
claude login

# 프롬프트가 나타나면 복사한 API 키를 붙여넣기
# (키를 입력할 때는 화면에 표시되지 않는 것이 정상입니다)
```

> **보안 주의사항**: API 키는 개인 계정과 연결되므로 타인과 공유하지 않도록 주의하세요.

### 첫 번째 대화

이제 Claude Code와 첫 대화를 시작해보겠습니다.

```bash
# 첫 인사 (Claude가 답변하면 성공!)
claude "안녕하세요, Claude! 처음 뵙겠습니다."

# 간단한 작업 요청해보기
claude "현재 시스템 정보를 알려주세요"

# 디렉토리 탐색해보기
claude "현재 폴더에 어떤 파일들이 있는지 보여주세요"
```

**응답이 정상적으로 출력되면 설치와 기본 설정이 완료된 것입니다.** Claude Code 사용 준비가 완료되었습니다.

### 대화형 모드 vs 명령 모드

**명령 모드 (일회성 작업)**
```bash
claude "package.json 파일을 읽고 요약해줘"
```

**대화형 모드 (지속적인 작업)**
```bash
# 대화형 모드 시작
claude

# 이제 지속적으로 대화 가능
> 새로운 React 프로젝트를 시작하고 싶어
> TypeScript를 사용하고, 테스트 환경도 설정해줘
> Material-UI도 추가해줘
```

## 2.4 기본 설정 최적화

### 전역 설정 파일

Claude Code는 `~/.claude-code/config.json` 파일을 통해 설정을 관리합니다:

```json
{
  "api_key": "sk-ant-...",
  "default_model": "claude-3-opus-20240229",
  "theme": "dark",
  "editor": "vscode",
  "auto_commit": false,
  "language": "ko",
  "permissions": {
    "file_write": true,
    "file_read": true,
    "command_execution": true
  }
}
```

### 권한 설정

보안과 편의성의 균형을 위한 권한 설정:

```bash
# 모든 권한 부여 (개발 환경)
claude --allow-all

# 읽기 전용 모드 (코드 리뷰용)
claude --read-only

# 특정 권한만 부여
claude --allow-read --allow-write --deny-execute
```

### 에디터 통합

선호하는 에디터와 통합:

```bash
# VSCode 통합
claude config set editor vscode

# Vim 통합
claude config set editor vim

# 에디터에서 직접 Claude Code 호출
# VSCode: Cmd+Shift+P > "Claude: Ask"
```

### 프록시 설정 (기업 환경)

기업 환경에서 프록시를 사용하는 경우:

```bash
# HTTP 프록시 설정
export HTTP_PROXY=http://proxy.company.com:8080
export HTTPS_PROXY=http://proxy.company.com:8080

# Claude Code 전용 프록시 설정
claude config set proxy http://proxy.company.com:8080
```

## 2.5 문제 해결 가이드

### 자주 발생하는 문제와 해결 방법

**1. "command not found: claude"**
```bash
# npm 전역 경로 확인
npm config get prefix

# PATH에 추가 (bash/zsh)
echo 'export PATH="$PATH:$(npm config get prefix)/bin"' >> ~/.bashrc
source ~/.bashrc
```

**2. "EACCES: permission denied"**
```bash
# npm 전역 디렉토리 권한 수정
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

# 또는 npx 사용
npx @anthropic-ai/claude-code
```

**3. "API rate limit exceeded"**
```bash
# 레이트 리밋 상태 확인
claude status

# 대기 시간 설정
claude config set retry_delay 5000
```

**4. "SSL certificate problem"**
```bash
# 임시 해결 (보안 주의)
export NODE_TLS_REJECT_UNAUTHORIZED=0

# 영구 해결: 회사 인증서 설치
npm config set cafile /path/to/company-cert.pem
```

### 성능 최적화 팁

**1. 캐시 활성화**
```bash
# 응답 캐싱 활성화
claude config set cache_enabled true
claude config set cache_ttl 3600
```

**2. 컨텍스트 크기 조정**
```bash
# 큰 프로젝트의 경우 컨텍스트 확대
claude config set max_context_length 100000
```

**3. 로컬 모델 사용 (베타)**
```bash
# 로컬 추론 모드 (인터넷 불필요)
claude config set local_mode true
claude download-model claude-instant
```

## 실습: Hello World 프로젝트

이제 Claude Code가 설치되었으니, 간단한 프로젝트를 만들어봅시다:

```bash
# 새 디렉토리 생성
mkdir hello-claude && cd hello-claude

# Claude Code로 프로젝트 초기화
claude "Node.js로 간단한 Hello World 웹 서버를 만들어줘. 
포트 3000에서 실행되고, '/' 경로로 접속하면 'Hello from Claude Code!'를 
표시하도록 해줘. package.json과 README.md도 함께 만들어줘."

# 생성된 파일 확인
ls -la

# 서버 실행
npm install
npm start

# 브라우저에서 http://localhost:3000 접속
```

Claude Code와 함께 첫 번째 프로젝트를 성공적으로 만들었습니다.

## 다음 단계

이제 Claude Code가 설치되고 기본 설정이 완료되었습니다. 다음 장에서는:

- 파일 시스템 탐색과 조작
- 코드 작성과 수정
- 테스트와 디버깅
- Git 통합 사용법

등 Claude Code의 핵심 기능들을 자세히 알아보겠습니다.

**Pro Tip**: `claude help` 명령으로 언제든지 도움말을 확인할 수 있습니다. 
또한 `claude tutorial`을 실행하면 대화형 튜토리얼을 시작할 수 있습니다.