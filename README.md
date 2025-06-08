# Claude Code 마스터하기
## AI 페어 프로그래밍의 혁명

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
- **부록**: 빠른 참조 가이드, 템플릿, 용어사전

## 📁 파일 구조

```
claude-code-mastering/
├── 📄 README.md                              # 이 파일
├── 📄 claude-code-best-practices-ko.md       # 원본 베스트 프랙티스 
├── 📄 claude-code-book-outline.md            # 책 목차 구성
├── 🔧 convert-to-pdf.sh                      # MD→PDF 변환 스크립트
├── 🔧 html-to-pdf.js                         # HTML→PDF 변환 도구
├── 📁 book/                                  # 소책자 원본 (마크다운)
│   ├── 📄 00-preface.md                      # 서문
│   ├── 📄 01-chapter1.md                     # 제1장
│   ├── 📄 02-chapter2.md                     # 제2장
│   ├── 📄 03-chapter3.md                     # 제3장
│   ├── 📄 04-chapter4.md                     # 제4장
│   ├── 📄 05-chapter5.md                     # 제5장
│   ├── 📄 06-chapter6.md                     # 제6장
│   ├── 📄 07-chapter7.md                     # 제7장
│   ├── 📄 08-chapter8.md                     # 제8장
│   ├── 📄 09-chapter9.md                     # 제9장
│   ├── 📄 10-chapter10.md                    # 제10장
│   ├── 📄 11-chapter11.md                    # 제11장
│   ├── 📄 12-chapter12.md                    # 제12장
│   ├── 📄 13-chapter13.md                    # 제13장
│   ├── 📄 99-conclusion.md                   # 결론
│   └── 📄 appendix.md                        # 부록
└── 📁 output/                                # 변환된 파일들
    ├── 📁 html/                              # HTML 버전
    │   ├── 📄 01-chapter1.html
    │   ├── 📄 chapter-1.html
    │   └── 📄 claude-code-mastering-full.html  # 전체 책 HTML
    ├── 📁 pdf/                               # PDF 버전
    │   ├── 📄 chapter-1.pdf                  # 1장 PDF
    │   └── 📄 claude-code-mastering-full.pdf  # 전체 책 PDF (855KB)
    ├── 📁 combined/                          # 통합 마크다운
    │   └── 📄 claude-code-mastering-full.md
    └── 📄 style.css                          # HTML/PDF 스타일
```

## 🚀 빠른 시작

### 📖 읽기

**온라인으로 읽기:**
- [전체 책 HTML](output/html/claude-code-mastering-full.html) - 브라우저에서 읽기
- [개별 장 마크다운](book/) - GitHub에서 읽기

**다운로드해서 읽기:**
- [전체 책 PDF](output/pdf/claude-code-mastering-full.pdf) - 오프라인 읽기용
- [1장 PDF](output/pdf/chapter-1.pdf) - 샘플 장

### 🔧 PDF 변환

**요구사항:**
```bash
# macOS
brew install pandoc node

# 또는 Docker 사용
docker run --rm -v $(pwd):/workspace node:latest bash -c "cd /workspace && npm install puppeteer"
```

**사용법:**
```bash
# 실행 권한 부여
chmod +x convert-to-pdf.sh

# 전체 책 변환
./convert-to-pdf.sh --all

# 특정 장 변환
./convert-to-pdf.sh --chapter 1

# 개별 파일 변환
./convert-to-pdf.sh book/01-chapter1.md

# 도움말
./convert-to-pdf.sh --help
```

## 🎯 주요 특징

- ✅ **완전한 한국어 지원** - 한국 개발자를 위한 맞춤 번역
- ✅ **실무 중심 내용** - 바로 적용 가능한 실전 예제
- ✅ **단계별 학습** - 초보자부터 고급자까지 체계적 구성
- ✅ **팀 협업 가이드** - 개인을 넘어 팀 차원의 활용법
- ✅ **최신 기술 반영** - 2025년 최신 개발 트렌드 포함
- ✅ **다양한 형식 지원** - Markdown, HTML, PDF 제공

## 🤝 기여하기

이 프로젝트는 오픈소스입니다! 기여를 환영합니다.

**기여 방법:**
1. 📝 오타나 개선사항 발견 시 Issue 등록
2. 🔀 Pull Request로 직접 수정 제안
3. 🌟 별표를 눌러 프로젝트 응원
4. 📢 동료 개발자들에게 공유

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자유롭게 사용, 수정, 배포하실 수 있습니다.

## 🙏 감사의 말

- **Anthropic**: Claude Code 개발
- **개발 커뮤니티**: 피드백과 아이디어 제공
- **오픈소스 도구들**: Pandoc, Puppeteer 등

---

**행복한 AI 개발 되세요!** 🤖💻

> "AI는 개발자를 대체하는 것이 아니라, 개발자의 능력을 확장하는 도구입니다."