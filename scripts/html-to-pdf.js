#!/usr/bin/env node

// HTML to PDF 변환 도구 (Node.js + Puppeteer)
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

// Puppeteer가 설치되어 있는지 확인
function checkPuppeteer() {
    try {
        require('puppeteer');
        return true;
    } catch (error) {
        return false;
    }
}

// PDF 생성 함수
async function generatePDF(htmlFile, outputFile) {
    if (!checkPuppeteer()) {
        console.log('Puppeteer가 설치되지 않았습니다. 설치 중...');
        
        return new Promise((resolve, reject) => {
            exec('npm install puppeteer', (error, stdout, stderr) => {
                if (error) {
                    console.error('Puppeteer 설치 실패:', error);
                    reject(error);
                    return;
                }
                console.log('Puppeteer 설치 완료');
                generatePDFWithPuppeteer(htmlFile, outputFile).then(resolve).catch(reject);
            });
        });
    } else {
        return generatePDFWithPuppeteer(htmlFile, outputFile);
    }
}

// Puppeteer로 PDF 생성
async function generatePDFWithPuppeteer(htmlFile, outputFile) {
    const puppeteer = require('puppeteer');
    
    const browser = await puppeteer.launch({
        headless: 'new',
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const page = await browser.newPage();
    
    // HTML 파일 로드
    const htmlPath = path.resolve(htmlFile);
    await page.goto(`file://${htmlPath}`, { waitUntil: 'networkidle0' });
    
    // PDF 생성
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
        preferCSSPageSize: true
    });
    
    await browser.close();
    console.log(`PDF 생성 완료: ${outputFile}`);
}

// 메인 함수
async function main() {
    const args = process.argv.slice(2);
    
    if (args.length !== 2) {
        console.log('사용법: node html-to-pdf.js <input.html> <output.pdf>');
        process.exit(1);
    }
    
    const [inputFile, outputFile] = args;
    
    if (!fs.existsSync(inputFile)) {
        console.error(`파일을 찾을 수 없습니다: ${inputFile}`);
        process.exit(1);
    }
    
    try {
        await generatePDF(inputFile, outputFile);
        console.log('변환 완료!');
    } catch (error) {
        console.error('변환 실패:', error);
        process.exit(1);
    }
}

// 스크립트가 직접 실행된 경우
if (require.main === module) {
    main();
}

module.exports = { generatePDF };