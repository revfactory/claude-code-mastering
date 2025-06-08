## 블로그 스타일로 정리: Windows에서 Claude Code 완벽하게 설정하고 활용하기

**요약:** Windows 11/10 환경에서는 네이티브 클라이언트를 지원하지 않지만, WSL 2를 활용하면 Claude Code의 강력한 기능을 안정적으로 사용할 수 있습니다. 이 가이드에서는 WSL 2와 Node.js 18 LTS 환경을 구성하고, Claude Code CLI를 설치 및 인증하여 터미널에서 `claude` 명령을 사용하는 전체 과정을 안내합니다.

-----

### 1\. 사전 준비 및 시스템 요구사항

Claude Code를 원활하게 사용하기 위해 필요한 최소 사양은 다음과 같습니다. Anthropic 공식 문서에서도 Windows 환경에서는 WSL을 통한 실행을 명시하고 있습니다.

| 항목 | 최소 조건 |
| :--- | :--- |
| **OS** | Windows 10 (21H2) 또는 Windows 11 + **WSL 2** |
| **RAM** | 4 GB 이상 |
| **네트워크** | OAuth 인증 및 모델 호출을 위한 인터넷 연결 |
| **소프트웨어** | WSL 2, Node.js 18+, Git(선택), ripgrep(선택) |

### 2\. WSL 2 설치 및 업그레이드

**PowerShell을 관리자 권한으로 실행**한 뒤, 아래 명령어를 입력하면 설치가 시작됩니다.

```powershell
wsl --install
```

이 명령 하나로 WSL 설치부터 Ubuntu 22.04 LTS와 같은 기본 배포판 설치까지 자동으로 진행됩니다. 설치가 완료되면 시스템을 재부팅하세요.

만약 기존에 WSL 1을 사용하고 있었다면, 다음 명령어를 통해 WSL 2로 버전을 업그레이드할 수 있습니다.

```powershell
wsl --set-version <배포판이름> 2
```

설치가 올바르게 완료되었는지 확인하려면 다음 명령어를 실행해 상태를 점검하세요.

```powershell
wsl --status && wsl --list --verbose
```

> **WSL 기본 팁**
>
>   * Windows의 파일 시스템(`C:\` 드라이브 등)은 WSL 내에서 `/mnt/c/` 경로를 통해 접근할 수 있습니다.
>   * 터미널 기반 작업이 주 목적이라면 별도의 GUI(X-Server) 설정은 필요 없습니다.

### 3\. Node.js 18 LTS 설치

Node.js 버전을 유연하게 관리하고 버전 충돌을 피하기 위해 **NVM(Node Version Manager)** 사용을 권장합니다. WSL 셸(Ubuntu)을 열고 아래 명령어를 순서대로 실행하세요.

```bash
# NVM 설치 스크립트 실행
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# 변경 사항 적용
source ~/.bashrc

# Node.js 18 LTS 버전 설치 및 사용
nvm install 18
nvm use 18
```

> **중요:** `which node` 와 `which npm` 명령어를 실행했을 때, 경로가 `/home/<username>/.nvm/...` 과 같이 WSL 내부로 잡혀야 합니다. 만약 `/mnt/c/...` 경로가 표시된다면 Windows에 설치된 Node.js와 경로가 섞인 것이므로, 위의 NVM 설치 방법을 통해 WSL 내부에 독립적으로 구성하는 것이 좋습니다.

### 4\. Claude Code CLI 설치 및 인증

Node.js 준비가 완료되었다면 npm을 통해 Claude Code CLI를 전역으로 설치합니다.

```bash
npm install -g @anthropic-ai/claude-code
```

> **팁:** `sudo` 없이 설치 시 권한 오류가 발생한다면, `npm config set prefix '~/.npm-global'` 명령을 실행하여 사용자 디렉터리에 패키지를 설치하도록 설정한 후 다시 시도해 보세요.

**최초 실행 및 인증**

설치 후 `claude` 명령을 처음 실행하면 인증 절차가 시작됩니다.

```bash
claude
# 또는 프롬프트를 바로 전달할 수도 있습니다.
claude "summarize this project"
```

명령을 실행하면 웹 브라우저가 자동으로 열립니다. Anthropic Console(유료 구독자) 또는 Claude Pro/Max 계정으로 로그인하여 OAuth 인증을 완료하세요. 인증에 성공하면 터미널에 REPL 프롬프트가 나타나며, 이후부터는 `claude` 명령을 자유롭게 사용할 수 있습니다.

**설치 오류 대응**

| 증상 | 해결 방법 |
| :--- | :--- |
| `OS detection failed` | `npm config set os linux` 실행 후 `npm install -g @anthropic-ai/claude-code --force --no-os-check` 명령으로 강제 설치 |
| `exec: node: not found` | Node.js 설치가 잘못된 경우입니다. 3번 항목의 NVM 설치를 다시 진행하고 `which node` 경로를 확인하세요. |

### 5\. 기본 CLI 사용법

Claude Code CLI는 다양한 방식으로 활용할 수 있습니다.

| 패턴 | 예시 |
| :--- | :--- |
| **REPL(대화형 모드) 시작** | `claude` |
| **단일 질문 실행** | `claude -p "이 함수의 역할과 개선점을 설명해줘"` |
| **파일 내용 파이프라이닝** | `cat error.log | claude "이 로그의 핵심 원인을 요약해줘"` |
| **최근 대화 이어가기** | `claude -c` |
| **특정 세션 ID로 대화 복원** | `claude -r abc123 "finish writing the pull request message"` |

전체 명령어, 플래그, 슬래시 커맨드 목록은 [공식 CLI 사용법 문서](https://www.google.com/search?q=https://docs.anthropic.com/claude/docs/cli-usage-and-controls)를 참고하세요.

### 6\. VS Code 연동 (선택 사항)

VS Code와의 연동을 통해 개발 생산성을 크게 높일 수 있습니다.

1.  **자동 설치**: VS Code에 내장된 터미널에서 `claude`를 한 번 실행하면, Claude Code 공식 확장이 자동으로 설치됩니다.
2.  **수동 설치**: [Visual Studio Marketplace](https://www.google.com/search?q=https://marketplace.visualstudio.com/items%3FitemName%3DAnthropic.claude-code)에서 "Claude Code Editor" 확장을 직접 설치할 수도 있습니다.

연동 후에는 단축키 **`Alt + Ctrl + K`** (macOS: `Opt + Ctrl + K`)를 눌러 현재 열려있는 파일을 즉시 Claude의 컨텍스트로 전달할 수 있어, 대규모 코드베이스를 탐색하고 이해하는 데 매우 유용합니다.

### 7\. 실제 사용 팁

상황에 따라 유용한 추천 명령어는 다음과 같습니다.

| 상황 | 추천 명령 |
| :--- | :--- |
| **프로젝트 구조 첫 요약** | `claude summarize this project` |
| **코드 리뷰 요청** | `claude /review` |
| **긴 대화 내용 간소화** | `claude /compact` |
| **PR(Pull Request) 코멘트 확인** | `claude /pr_comments` |

또한, GitHub Actions 같은 워크플로에 `@claude` 멘션을 추가하여 코드 리뷰를 자동화하는 것도 가능합니다.

### 8\. 권장 디렉터리 위치

Claude CLI를 실행할 프로젝트 폴더는 일반 사용자 디렉터리 내에 두는 것이 좋습니다.

* **좋은 위치**: `C:\Users\<username>\Documents` (WSL 경로: `/mnt/c/Users/<username>/Documents`)
* **나쁜 위치**: `C:\Windows\System32` 와 같은 시스템 폴더는 권한 문제로 인해 파일 접근이나 일부 기능이 제한될 수 있습니다.

### 9\. 참고 자료

* **공식 시작 가이드**: [Getting Started with the Claude Code CLI](https://www.google.com/search?q=https://docs.anthropic.com/claude/docs/getting-started-with-the-claude-code-cli)
* **커뮤니티 설치 가이드**: [sosamol.com](https://www.google.com/search?q=https://sosamol.com/6090a59/)
* **자동 설치 스크립트 예시**: [GitHub Repository](https://www.google.com/search?q=https://github.com/anthropics/claude-code-cli/tree/main/scripts)

위 절차를 따르면 Windows 환경에서도 Claude Code를 완벽하게 활용하여 코드베이스 이해, 리팩터링, 테스트 케이스 생성 등 복잡한 개발 작업을 효율적으로 자동화할 수 있습니다.