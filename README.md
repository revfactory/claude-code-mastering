# Claude Code 마스터하기
## AI 페어 프로그래밍의 혁명

**저자**: 황민호 (robin.hwang@kakaocorp.com)  
**출판일**: 2025년 6월  

한국어로 작성된 Claude Code 완전 가이드북입니다.

## 📚 책 구성

### 🏗️ 기초편 (제1-3장)
- **제1장**: Claude Code란 무엇인가?
- **제2장**: 설치와 초기 설정
- **제3장**: 기본 사용법 마스터

### ⚙️ 설정편 (제4-6장)
- **제4장**: CLAUDE.md로 프로젝트 맞춤 설정
- **제5장**: 프레임워크별 베스트 프랙티스
- **제6장**: 언어별 활용 전략

### 🚀 고급편 (제7-9장)
- **제7장**: 효율적인 개발 워크플로우
- **제8장**: 멀티태스킹과 병렬 처리
- **제9장**: 자동화와 CI/CD 통합

### 💼 실전편 (제10장)
- **제10장**: 웹 애플리케이션 구축 (실전 프로젝트)

### 👥 팀 협업편 (제11-13장)
- **제11장**: GitHub Actions와 Claude Code Action
- **제12장**: 팀에서 Claude Code 활용하기
- **제13장**: 조직별 Claude Code 활용 사례 연구

### 📖 마무리
- **결론**: AI와 함께하는 개발의 미래

## 📁 파일 구조

```
claude-code-mastering/
├── 📄 README.md                              # 이 파일
├── 📁 docs/                                  # GitHub Pages 배포 파일들
│   ├── 📄 index.html                         # GitHub Pages 메인 페이지
│   ├── 📄 claude-code-mastering-complete.html  # 전체 책 HTML
│   ├── 📄 claude-code-mastering-complete.md    # 통합 마크다운
│   ├── 📄 claude-code-mastering-complete.pdf   # 전체 책 PDF
│   └── 📄 style.css                          # HTML/PDF 스타일
├── 📁 book/                                  # 완성된 책 내용 (마크다운)
│   ├── 📄 00-preface.md                      # 서문
│   ├── 📄 01-chapter1.md                     # 제1장: Claude Code란 무엇인가?
│   ├── 📄 02-chapter2.md                     # 제2장: 설치와 초기 설정
│   ├── 📄 03-chapter3.md                     # 제3장: 기본 사용법 마스터
│   ├── 📄 04-chapter4.md                     # 제4장: CLAUDE.md로 프로젝트 맞춤 설정
│   ├── 📄 05-chapter5.md                     # 제5장: 프레임워크별 베스트 프랙티스
│   ├── 📄 06-chapter6.md                     # 제6장: 언어별 활용 전략
│   ├── 📄 07-chapter7.md                     # 제7장: 효율적인 개발 워크플로우
│   ├── 📄 08-chapter8.md                     # 제8장: 멀티태스킹과 병렬 처리
│   ├── 📄 09-chapter9.md                     # 제9장: 자동화와 CI/CD 통합
│   ├── 📄 10-chapter10.md                    # 제10장: 웹 애플리케이션 구축
│   ├── 📄 11-chapter11.md                    # 제11장: GitHub Actions와 Claude Code Action
│   ├── 📄 12-chapter12.md                    # 제12장: 팀에서 Claude Code 활용하기
│   ├── 📄 13-chapter13.md                    # 제13장: 조직별 Claude Code 활용 사례 연구
│   └── 📄 99-conclusion.md                   # 결론: AI와 함께하는 개발의 미래
├── 📁 scripts/                               # 변환 스크립트들
│   ├── 🔧 create-complete-book.sh            # 통합 책 생성 스크립트
│   ├── 🔧 html-to-pdf.js                     # HTML→PDF 변환 도구
│   ├── 🔧 enhanced-pdf-generator.js          # 고급 PDF 생성기
│   └── 🔧 check-pdf-pages.js                 # PDF 페이지 검증 도구
├── 📁 raw/                                   # 원본 자료 및 초안
│   ├── 📄 claude-code-action.md              # Claude Code Action 가이드
│   ├── 📄 claude-code-best-practices-ko.md   # 원본 베스트 프랙티스
│   ├── 📄 claude-code-book-outline.md        # 책 목차 구성
│   └── 📄 usecase.md                         # 활용 사례 초안
```

## 🚀 빠른 시작

### 📖 읽기

**온라인으로 읽기**
- [📄 GitHub Pages에서 읽기](https://revfactory.github.io/claude-code-mastering/) - 완전한 HTML 버전 (Mermaid 다이어그램 포함)
- [📖 개별 장 마크다운](book/) - GitHub에서 읽기

**다운로드해서 읽기**
- [📄 전체 책 PDF](docs/claude-code-mastering-complete.pdf) - 오프라인 읽기용
- [📄 전체 책 HTML](docs/claude-code-mastering-complete.html) - 로컬 HTML 버전

### 🔧 책 생성

**요구사항**
```bash
# macOS/Linux
brew install pandoc node

# 또는 시스템 패키지 매니저 사용
# Ubuntu: sudo apt install pandoc nodejs npm
# CentOS: sudo yum install pandoc nodejs npm

# PDF 생성을 위한 Puppeteer 설치 (필요시)
npm install puppeteer
```

**사용법**
```bash
# 1. 실행 권한 부여
chmod +x scripts/create-complete-book.sh

# 2. 완전한 책 생성 (HTML + PDF)
./scripts/create-complete-book.sh

# 3. 생성된 파일들 확인
# - docs/claude-code-mastering-complete.html  (전체 책 HTML)
# - docs/claude-code-mastering-complete.pdf   (전체 책 PDF)
# - docs/claude-code-mastering-complete.md    (통합 마크다운)
# - docs/index.html (GitHub Pages용 - 자동 업데이트)
```

**참고사항**
- PDF 생성에는 Puppeteer가 필요합니다 (`npm install puppeteer`)
- HTML만 생성하려면 스크립트에서 PDF 생성 부분을 주석 처리하세요
- Mermaid 다이어그램은 HTML에서만 정상 렌더링됩니다

## 🎯 주요 특징

- ✅ **완전한 한국어 지원** - 한국 개발자를 위한 맞춤 가이드
- ✅ **실무 중심 내용** - 바로 적용 가능한 실전 예제
- ✅ **단계별 학습** - 초보자부터 고급자까지 체계적 구성
- ✅ **팀 협업 가이드** - 개인을 넘어 팀 차원의 활용법
- ✅ **최신 기술 반영** - 2025년 최신 개발 트렌드 포함
- ✅ **다양한 형식 지원** - Markdown, HTML, PDF 제공
- ✅ **Mermaid 다이어그램** - 시각적 이해를 돕는 풍부한 도표
- ✅ **GitHub Pages 지원** - 온라인에서 바로 읽기 가능

## 🤝 기여하기

이 프로젝트는 오픈소스입니다! 기여를 환영합니다.

**기여 방법**
1. 📝 오타나 개선사항 발견 시 Issue 등록
2. 🔀 Pull Request로 직접 수정 제안
3. 🌟 별표를 눌러 프로젝트 응원
4. 📢 동료 개발자들에게 공유

## 📄 저작권 및 라이선스

**© 2025 황민호 (robin.hwang@kakaocorp.com). All rights reserved.**

**무단 배포 금지**: 이 저작물의 무단 복제, 배포, 전송, 출판은 저작권법에 의해 금지되어 있습니다.

**허용 범위**
- ✅ 개인적 학습 및 연구 목적의 열람
- ✅ 비상업적 교육 목적의 인용 (출처 명시 시)
- ✅ GitHub Issues를 통한 오탈자 제보 및 개선 제안

**금지 사항**
- ❌ 상업적 목적의 사용, 복제, 배포
- ❌ 저작자 동의 없는 2차 저작물 제작
- ❌ 전체 또는 일부 내용의 무단 전재

## 🙏 감사의 말

- **Anthropic**: Claude Code 개발 및 지원
- **개발 커뮤니티**: 피드백과 아이디어 제공
- **오픈소스 도구들**: Pandoc, Puppeteer, Mermaid.js 등

---

**행복한 AI 개발 되세요!** 🤖💻

> "AI는 개발자를 대체하는 것이 아니라, 개발자의 능력을 확장하는 도구입니다."