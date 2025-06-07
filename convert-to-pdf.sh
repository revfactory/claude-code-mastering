#!/bin/bash

# Claude Code 마스터하기 - MD to PDF 변환 스크립트
# 요구사항: pandoc, wkhtmltopdf 설치 필요

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 함수: 로그 출력
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 함수: 의존성 체크
check_dependencies() {
    log_info "의존성 확인 중..."
    
    if ! command -v pandoc &> /dev/null; then
        log_error "pandoc이 설치되지 않았습니다."
        log_info "설치 방법: brew install pandoc"
        exit 1
    fi
    
    if ! command -v wkhtmltopdf &> /dev/null; then
        log_warning "wkhtmltopdf가 설치되지 않았습니다. HTML 변환만 지원됩니다."
        log_info "PDF 변환을 위해서는 다음을 설치하세요: brew install wkhtmltopdf"
        USE_WKHTMLTOPDF=false
    else
        USE_WKHTMLTOPDF=true
    fi
    
    log_success "의존성 확인 완료"
}

# 함수: 디렉토리 생성
create_output_dirs() {
    mkdir -p output/pdf
    mkdir -p output/html
    mkdir -p output/combined
    log_success "출력 디렉토리 생성 완료"
}

# 함수: CSS 스타일 생성
create_css() {
    cat > output/style.css << 'EOF'
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

.page-break {
    page-break-before: always;
}

.chapter-title {
    text-align: center;
    margin: 2rem 0 3rem 0;
}

.toc {
    background-color: #f8f9fa;
    border: 1px solid #e9ecef;
    border-radius: 5px;
    padding: 1.5rem;
    margin: 2rem 0;
}

.toc ul {
    list-style-type: none;
    padding-left: 0;
}

.toc li {
    margin: 0.5rem 0;
    padding-left: 1rem;
}

.toc a {
    text-decoration: none;
    color: #3498db;
}

.toc a:hover {
    text-decoration: underline;
}

@media print {
    body {
        padding: 1rem;
    }
    
    .page-break {
        page-break-before: always;
    }
    
    h1 {
        page-break-before: always;
    }
    
    h1:first-child {
        page-break-before: avoid;
    }
}
EOF
    log_success "CSS 스타일 생성 완료"
}

# 함수: 단일 파일 변환
convert_single_file() {
    local input_file="$1"
    local output_name="$2"
    
    if [[ ! -f "$input_file" ]]; then
        log_error "파일을 찾을 수 없습니다: $input_file"
        return 1
    fi
    
    log_info "변환 중: $input_file"
    
    # HTML 변환
    pandoc "$input_file" \
        --from markdown \
        --to html5 \
        --css style.css \
        --standalone \
        --metadata title="Claude Code 마스터하기" \
        --output "output/html/${output_name}.html"
    
    log_success "HTML 변환 완료: output/html/${output_name}.html"
    
    # PDF 변환 (wkhtmltopdf 사용)
    if [[ "$USE_WKHTMLTOPDF" == true ]]; then
        wkhtmltopdf \
            --page-size A4 \
            --margin-top 0.75in \
            --margin-right 0.75in \
            --margin-bottom 0.75in \
            --margin-left 0.75in \
            --encoding UTF-8 \
            --print-media-type \
            --disable-smart-shrinking \
            "output/html/${output_name}.html" \
            "output/pdf/${output_name}.pdf"
        
        log_success "PDF 변환 완료: output/pdf/${output_name}.pdf"
    else
        # pandoc으로 PDF 변환 (LaTeX 엔진 사용)
        if command -v pdflatex &> /dev/null; then
            pandoc "$input_file" \
                --from markdown \
                --to pdf \
                --pdf-engine=pdflatex \
                --variable fontsize=11pt \
                --variable geometry:margin=1in \
                --variable mainfont="Noto Sans KR" \
                --variable CJKmainfont="Noto Sans KR" \
                --output "output/pdf/${output_name}.pdf"
            
            log_success "PDF 변환 완료 (LaTeX): output/pdf/${output_name}.pdf"
        else
            log_warning "PDF 변환을 건너뜁니다. wkhtmltopdf 또는 pdflatex가 필요합니다."
        fi
    fi
}

# 함수: 전체 책 변환
convert_full_book() {
    log_info "전체 책 변환 시작..."
    
    # 모든 마크다운 파일을 하나로 합치기
    local combined_file="output/combined/claude-code-mastering-full.md"
    
    # 표지 생성
    cat > "$combined_file" << 'EOF'
# Claude Code 마스터하기
## AI 페어 프로그래밍의 혁명

---

**저자**: Claude & Human Collaboration  
**출판일**: 2024년 12월  
**버전**: 1.0  

---

<div class="page-break"></div>

EOF
    
    # 목차 추가
    echo "# 목차" >> "$combined_file"
    echo "" >> "$combined_file"
    
    # 파일 순서 정의
    local files=(
        "book/00-preface.md:서문"
        "book/01-chapter1.md:제1장: Claude Code란 무엇인가?"
        "book/02-chapter2.md:제2장: 설치와 초기 설정"
        "book/03-chapter3.md:제3장: 기본 사용법 마스터"
        "book/04-chapter4.md:제4장: CLAUDE.md로 프로젝트 맞춤 설정"
        "book/05-chapter5.md:제5장: 프레임워크별 베스트 프랙티스"
        "book/06-chapter6.md:제6장: 언어별 활용 전략"
        "book/07-chapter7.md:제7장: 효율적인 개발 워크플로우"
        "book/08-chapter8.md:제8장: 멀티태스킹과 병렬 처리"
        "book/09-chapter9.md:제9장: 자동화와 CI/CD 통합"
        "book/10-chapter10.md:제10장: 웹 애플리케이션 구축"
        "book/13-chapter13.md:제13장: 팀에서 Claude Code 활용하기"
        "book/99-conclusion.md:결론: AI와 함께하는 개발의 미래"
        "book/appendix.md:부록"
    )
    
    # 목차 생성
    for file_info in "${files[@]}"; do
        local title="${file_info#*:}"
        echo "- [$title](#)" >> "$combined_file"
    done
    
    echo "" >> "$combined_file"
    echo '<div class="page-break"></div>' >> "$combined_file"
    echo "" >> "$combined_file"
    
    # 각 파일 내용 추가
    for file_info in "${files[@]}"; do
        local file_path="${file_info%:*}"
        local title="${file_info#*:}"
        
        if [[ -f "$file_path" ]]; then
            echo '<div class="page-break"></div>' >> "$combined_file"
            echo "" >> "$combined_file"
            cat "$file_path" >> "$combined_file"
            echo "" >> "$combined_file"
            log_info "추가됨: $file_path"
        else
            log_warning "파일을 찾을 수 없습니다: $file_path"
        fi
    done
    
    log_success "통합 마크다운 생성 완료: $combined_file"
    
    # 통합 파일 변환
    convert_single_file "$combined_file" "claude-code-mastering-full"
}

# 함수: 사용법 출력
show_usage() {
    echo "Claude Code 마스터하기 - MD to PDF 변환 도구"
    echo ""
    echo "사용법:"
    echo "  $0 [옵션] [파일]"
    echo ""
    echo "옵션:"
    echo "  -h, --help     이 도움말 출력"
    echo "  -a, --all      전체 책 변환"
    echo "  -c, --chapter  특정 장 변환 (예: -c 1)"
    echo ""
    echo "예시:"
    echo "  $0 --all                    # 전체 책 변환"
    echo "  $0 --chapter 1              # 1장만 변환"
    echo "  $0 book/01-chapter1.md      # 특정 파일 변환"
    echo ""
    echo "요구사항:"
    echo "  - pandoc (필수)"
    echo "  - wkhtmltopdf (PDF 변환용, 권장)"
    echo "  - pdflatex (대안 PDF 엔진)"
}

# 메인 함수
main() {
    log_info "Claude Code 마스터하기 - MD to PDF 변환 시작"
    
    check_dependencies
    create_output_dirs
    create_css
    
    case "${1:-}" in
        -h|--help)
            show_usage
            exit 0
            ;;
        -a|--all)
            convert_full_book
            ;;
        -c|--chapter)
            if [[ -z "${2:-}" ]]; then
                log_error "장 번호를 지정해주세요. 예: -c 1"
                exit 1
            fi
            local chapter_num=$(printf "%02d" "$2")
            local chapter_file="book/${chapter_num}-chapter${2}.md"
            convert_single_file "$chapter_file" "chapter-${2}"
            ;;
        "")
            show_usage
            ;;
        *)
            if [[ -f "$1" ]]; then
                local filename=$(basename "$1" .md)
                convert_single_file "$1" "$filename"
            else
                log_error "알 수 없는 옵션 또는 파일: $1"
                show_usage
                exit 1
            fi
            ;;
    esac
    
    log_success "변환 완료!"
    echo ""
    log_info "출력 파일 위치:"
    echo "  📁 HTML: output/html/"
    echo "  📁 PDF:  output/pdf/"
    echo "  📁 통합: output/combined/"
}

# 스크립트 실행
main "$@"