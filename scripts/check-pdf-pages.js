#!/usr/bin/env node

// PDF 페이지 수 확인 도구
const fs = require('fs');
const path = require('path');

function checkPDFPages(pdfPath) {
    try {
        const pdfBuffer = fs.readFileSync(pdfPath);
        const pdfString = pdfBuffer.toString('binary');
        
        // PDF에서 페이지 수 추출 (간단한 방법)
        const pageMatches = pdfString.match(/\/Type\s*\/Page[^s]/g);
        const pageCount = pageMatches ? pageMatches.length : 0;
        
        const fileSizeKB = Math.round(fs.statSync(pdfPath).size / 1024);
        
        console.log(`📄 ${path.basename(pdfPath)}`);
        console.log(`   페이지 수: ${pageCount} 페이지`);
        console.log(`   파일 크기: ${fileSizeKB} KB`);
        console.log(`   페이지당 평균: ${Math.round(fileSizeKB / pageCount)} KB/페이지`);
        console.log('');
        
        return pageCount;
    } catch (error) {
        console.error(`PDF 분석 실패: ${pdfPath}`, error.message);
        return 0;
    }
}

// PDF 파일들 분석
const pdfFiles = [
    'output/complete/claude-code-mastering-complete.pdf',
    'output/pdf/claude-code-mastering-full.pdf',
    'output/pdf/chapter-1.pdf'
];

console.log('📊 PDF 파일 분석 결과:\n');

let totalPages = 0;
pdfFiles.forEach(file => {
    if (fs.existsSync(file)) {
        const pages = checkPDFPages(file);
        totalPages += pages;
    } else {
        console.log(`❌ 파일을 찾을 수 없습니다: ${file}`);
    }
});

console.log(`총 페이지 수: ${totalPages} 페이지`);