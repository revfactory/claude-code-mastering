#!/usr/bin/env node

// 향상된 PDF 생성기 (완전한 내용 보장)
const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

async function generateEnhancedPDF(htmlFile, outputFile) {
    console.log(`🔄 향상된 PDF 생성 시작: ${htmlFile} → ${outputFile}`);
    
    const browser = await puppeteer.launch({
        headless: 'new',
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage',
            '--disable-accelerated-2d-canvas',
            '--no-first-run',
            '--no-zygote',
            '--disable-gpu'
        ]
    });
    
    const page = await browser.newPage();
    
    // 뷰포트 설정 (A4 크기에 맞춤)
    await page.setViewport({
        width: 794,  // A4 width in pixels at 96 DPI
        height: 1123, // A4 height in pixels at 96 DPI
        deviceScaleFactor: 2
    });
    
    // HTML 파일 로드
    const htmlPath = path.resolve(htmlFile);
    await page.goto(`file://${htmlPath}`, { 
        waitUntil: 'networkidle0',
        timeout: 60000  // 60초 대기
    });
    
    // 페이지가 완전히 로드될 때까지 대기
    await page.evaluate(() => {
        return new Promise((resolve) => {
            if (document.readyState === 'complete') {
                resolve();
            } else {
                window.addEventListener('load', resolve);
            }
        });
    });
    
    // 추가 대기 (이미지나 동적 콘텐츠를 위해)
    await page.waitForTimeout(3000);
    
    // PDF 생성 (향상된 설정)
    await page.pdf({
        path: outputFile,
        format: 'A4',
        margin: {
            top: '20mm',
            right: '20mm',
            bottom: '20mm',
            left: '20mm'
        },
        printBackground: true,
        preferCSSPageSize: false,
        displayHeaderFooter: true,
        headerTemplate: '<div></div>',
        footerTemplate: `
            <div style="font-size: 10px; width: 100%; text-align: center; color: #666;">
                <span class="pageNumber"></span> / <span class="totalPages"></span>
            </div>
        `,
        scale: 0.9,  // 약간 축소하여 모든 내용이 들어가도록
        timeout: 120000  // 2분 대기
    });
    
    await browser.close();
    
    // 생성된 PDF 정보 출력
    const stats = fs.statSync(outputFile);
    const fileSizeKB = Math.round(stats.size / 1024);
    
    console.log(`✅ PDF 생성 완료: ${outputFile}`);
    console.log(`📊 파일 크기: ${fileSizeKB} KB`);
    
    return outputFile;
}

// 메인 함수
async function main() {
    const args = process.argv.slice(2);
    
    if (args.length < 2) {
        console.log('사용법: node enhanced-pdf-generator.js <input.html> <output.pdf>');
        process.exit(1);
    }
    
    const [inputFile, outputFile] = args;
    
    if (!fs.existsSync(inputFile)) {
        console.error(`❌ 파일을 찾을 수 없습니다: ${inputFile}`);
        process.exit(1);
    }
    
    try {
        await generateEnhancedPDF(inputFile, outputFile);
        console.log('🎉 변환 완료!');
    } catch (error) {
        console.error('❌ 변환 실패:', error.message);
        process.exit(1);
    }
}

// 스크립트가 직접 실행된 경우
if (require.main === module) {
    main();
}

module.exports = { generateEnhancedPDF };