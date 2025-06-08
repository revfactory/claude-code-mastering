#!/bin/bash

# 완전한 책 생성 스크립트
set -e

echo "📚 Claude Code 마스터하기 - 완전한 책 생성 시작..."

# 출력 디렉토리 생성
mkdir -p docs

# CSS 파일을 docs 폴더에 생성 (인라인 스타일)
cat > docs/style.css << 'EOF'
/* Claude Code 마스터하기 - PDF 스타일 */
body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans KR', sans-serif;
    line-height: 1.6;
    color: #333;
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
    background: white;
}

h1, h2, h3, h4, h5, h6 {
    color: #2c3e50;
    margin-top: 2rem;
    margin-bottom: 1rem;
    font-weight: 600;
}

h1 {
    border-bottom: 3px solid #3498db;
    padding-bottom: 0.5rem;
    font-size: 2.5rem;
}

h2 {
    border-bottom: 2px solid #95a5a6;
    padding-bottom: 0.3rem;
    font-size: 2rem;
}

h3 {
    color: #34495e;
    font-size: 1.5rem;
}

code {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 3px;
    padding: 2px 4px;
    font-family: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', Consolas, 'Courier New', monospace;
    font-size: 0.9em;
    color: #e74c3c;
}

pre {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 5px;
    padding: 1rem;
    overflow-x: auto;
    margin: 1rem 0;
}

pre code {
    background: none;
    border: none;
    padding: 0;
    color: #333;
}

blockquote {
    border-left: 4px solid #3498db;
    margin: 1rem 0;
    padding: 0.5rem 1rem;
    background-color: #f8f9fa;
    font-style: italic;
}

table {
    border-collapse: collapse;
    width: 100%;
    margin: 1rem 0;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px 12px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
    font-weight: 600;
}
EOF

# 통합 마크다운 파일 생성
COMPLETE_FILE="docs/claude-code-mastering-complete.md"

# 표지 생성
cat > "$COMPLETE_FILE" << 'EOF'
---
title: "Claude Code 마스터하기"
subtitle: "AI 페어 프로그래밍의 혁명"
author: "황민호 (robin.hwang@kakaocorp.com)"
date: "2025년 6월"
version: "1.0"
lang: ko
fontsize: 11pt
geometry: margin=1in
documentclass: book
toc: true
---

\newpage

# Claude Code 마스터하기
## AI 페어 프로그래밍의 혁명

**저자**: 황민호 (robin.hwang@kakaocorp.com)  
**출판일**: 2025년 6월  
**버전**: 1.0  

**© 2025 황민호 (robin.hwang@kakaocorp.com). All rights reserved.**  
**무단 배포 금지 - 개인 학습 및 연구 목적으로만 사용 가능**

---

\newpage

EOF

echo "✅ 표지 생성 완료"

# 파일 순서 배열
files=(
    "book/00-preface.md"
    "book/01-chapter1.md"
    "book/02-chapter2.md"
    "book/03-chapter3.md"
    "book/04-chapter4.md"
    "book/05-chapter5.md"
    "book/06-chapter6.md"
    "book/07-chapter7.md"
    "book/08-chapter8.md"
    "book/09-chapter9.md"
    "book/10-chapter10.md"
    "book/11-chapter11.md"
    "book/12-chapter12.md"
    "book/13-chapter13.md"
    "book/99-conclusion.md"
)

# 각 파일 내용 추가
for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
        echo "📄 추가 중: $file"
        echo "" >> "$COMPLETE_FILE"
        echo '\newpage' >> "$COMPLETE_FILE"
        echo "" >> "$COMPLETE_FILE"
        cat "$file" >> "$COMPLETE_FILE"
        echo "" >> "$COMPLETE_FILE"
    else
        echo "⚠️  파일을 찾을 수 없습니다: $file"
    fi
done

echo "✅ 통합 마크다운 생성 완료: $COMPLETE_FILE"

# HTML 생성
echo "🌐 HTML 생성 중..."
pandoc "$COMPLETE_FILE" \
    --from markdown \
    --to html5 \
    --css style.css \
    --standalone \
    --toc \
    --toc-depth=3 \
    --metadata title="Claude Code 마스터하기" \
    --output "docs/claude-code-mastering-complete.html"

# Mermaid 지원 추가 및 HTML 정리
echo "🎨 Mermaid 다이어그램 지원 추가 및 HTML 구조 정리 중..."
python3 -c "
import re
import sys

# HTML 파일 읽기
with open('docs/claude-code-mastering-complete.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Mermaid 코드 블록만 찾아서 변환 (%%{init으로 시작하는 것들만)
pattern = r'<pre class=\"mermaid\"><code>(%%\{init:.*?)</code></pre>'
replacement = r'<div class=\"mermaid\">\1</div>'
content = re.sub(pattern, replacement, content, flags=re.DOTALL)

# 2. 중복된 코드 태그 제거 (예: class=\"sourceCode bash\"><code class=\"sourceCode bash\")
pattern = r'class=\"sourceCode ([^\"]+)\"><code class=\"sourceCode \1\">'
replacement = r'class=\"sourceCode \1\"><code>'
content = re.sub(pattern, replacement, content)

# 파일에 다시 쓰기
with open('docs/claude-code-mastering-complete.html', 'w', encoding='utf-8') as f:
    f.write(content)
"

# Mermaid 스크립트 추가
sed -i '' 's|</body>|<!-- Mermaid 다이어그램 렌더링 -->\
<script src="https://cdn.jsdelivr.net/npm/mermaid@10.6.1/dist/mermaid.min.js"></script>\
<script>\
    mermaid.initialize({\
        startOnLoad: true,\
        theme: '\''base'\'',\
        themeVariables: {\
            primaryColor: '\''#f8fafc'\'',\
            primaryTextColor: '\''#1e293b'\'',\
            primaryBorderColor: '\''#e2e8f0'\'',\
            lineColor: '\''#94a3b8'\'',\
            secondaryColor: '\''#f1f5f9'\'',\
            tertiaryColor: '\''#e2e8f0'\''\
        },\
        flowchart: {\
            htmlLabels: false,\
            useMaxWidth: false\
        },\
        mindmap: {\
            htmlLabels: false,\
            useMaxWidth: false\
        }\
    });\
</script>\
</body>|' "output/complete/claude-code-mastering-complete.html"

echo "✅ HTML 생성 완료: docs/claude-code-mastering-complete.html"

# PDF 생성 (Puppeteer 사용)
echo "📄 PDF 생성 중..."
node scripts/html-to-pdf.js \
    "docs/claude-code-mastering-complete.html" \
    "docs/claude-code-mastering-complete.pdf"

echo "✅ PDF 생성 완료: docs/claude-code-mastering-complete.pdf"

# 파일 크기 확인
echo ""
echo "📊 생성된 파일 정보:"
ls -lh docs/
echo ""
echo "💾 파일 크기:"
du -h docs/*

echo ""
echo "🎉 완전한 책 생성 완료!"
echo "📍 위치: docs/"
echo "📖 PDF: docs/claude-code-mastering-complete.pdf"
echo "🌐 HTML: docs/claude-code-mastering-complete.html"

# index.html 업데이트
echo "📋 index.html 업데이트 중..."
cp docs/claude-code-mastering-complete.html docs/index.html