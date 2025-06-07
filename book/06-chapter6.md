# 제6장: 언어별 활용 전략

> "언어는 사고를 형성한다" - 벤자민 리 워프

각 프로그래밍 언어는 고유한 철학, 문법, 그리고 생태계를 가지고 있습니다. Claude Code를 효과적으로 활용하려면 각 언어의 특성을 이해하고 그에 맞는 접근 방식을 사용해야 합니다.

## 6.1 TypeScript/JavaScript

### TypeScript 프로젝트 설정

```bash
claude "엄격한 타입 체크를 사용하는 TypeScript 프로젝트를 설정해줘.
tsconfig.json을 최적화하고, ESLint와 Prettier도 TypeScript에 맞게 구성해줘"
```

권장 tsconfig.json 설정:

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,
    "exactOptionalPropertyTypes": true,
    "forceConsistentCasingInFileNames": true,
    "skipLibCheck": true,
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```

### 타입 안전성 극대화

**1. 고급 타입 활용**

```bash
claude "이 JavaScript 코드를 TypeScript로 마이그레이션해줘.
유니온 타입, 제네릭, 조건부 타입을 활용해서
타입 안전성을 최대한 확보해줘"
```

**2. 타입 추론 개선**

```bash
claude "이 함수의 반환 타입이 너무 넓게 추론되고 있어.
타입 가드와 const assertion을 사용해서 더 정확한 타입을 추론하도록 해줘"
```

**3. Zod를 활용한 런타임 검증**

```bash
claude "API 응답을 Zod 스키마로 검증하는 시스템을 만들어줘.
타입스크립트 타입도 자동으로 생성되도록 해줘"
```

### JavaScript 모던 패턴

**1. 함수형 프로그래밍**

```bash
claude "이 명령형 코드를 함수형 스타일로 리팩토링해줘.
불변성을 유지하고, 순수 함수를 사용하며,
함수 조합으로 로직을 구성해줘"
```

**2. 비동기 처리 최적화**

```bash
claude "여러 API 호출을 효율적으로 처리하도록 최적화해줘.
Promise.all, Promise.allSettled를 적절히 사용하고,
에러 처리와 재시도 로직도 추가해줘"
```

### TypeScript/JavaScript CLAUDE.md 예시

```markdown
# TypeScript/JavaScript Guidelines

## 타입 정의 규칙
- 인터페이스 > 타입 별칭 (확장 가능한 경우)
- any 사용 금지 (unknown 사용)
- 명시적 반환 타입 선호

## 비동기 처리
```typescript
// 좋은 예
const fetchData = async (): Promise<Result<Data, Error>> => {
  try {
    const data = await api.get('/data');
    return { ok: true, value: data };
  } catch (error) {
    return { ok: false, error };
  }
};
```

## 불변성
- Object.freeze() 활용
- Spread 연산자로 복사
- Immer 라이브러리 사용 고려

## 에러 처리
- Error 클래스 상속하여 커스텀 에러 생성
- 에러 바운더리 활용
- 타입 안전한 에러 처리
```

## 6.2 Python

### Python 프로젝트 구조화

```bash
claude "Python 패키지 구조를 모범 사례에 따라 설정해줘.
pyproject.toml, 가상 환경, 타입 힌트, 
그리고 테스트 설정을 포함해줘"
```

### 타입 힌트와 정적 분석

**1. 타입 힌트 추가**

```bash
claude "이 Python 코드에 타입 힌트를 추가해줘.
mypy로 검사할 수 있도록 엄격하게 작성하고,
Generic과 Protocol도 적절히 활용해줘"
```

**2. Pydantic 활용**

```bash
claude "데이터 검증을 위해 Pydantic 모델을 만들어줘.
설정 관리, API 요청/응답, 데이터베이스 모델에 활용해줘"
```

### Python 성능 최적화

**1. 비동기 프로그래밍**

```bash
claude "이 동기 코드를 asyncio를 사용해서 비동기로 변환해줘.
동시성을 최대한 활용하고, 적절한 에러 처리도 추가해줘"
```

**2. 메모리 효율성**

```bash
claude "대용량 데이터를 처리하는 이 코드를 최적화해줘.
제너레이터, 청크 처리, 메모리 프로파일링을 활용해줘"
```

### Python CLAUDE.md 예시

```markdown
# Python Project Guidelines

## 코드 스타일
- PEP 8 준수
- Black으로 포매팅
- isort로 import 정렬

## 타입 힌트
```python
from typing import List, Optional, Union, Protocol

def process_data(
    items: List[str],
    filter_func: Optional[Callable[[str], bool]] = None
) -> List[str]:
    """데이터를 처리합니다."""
    if filter_func:
        return [item for item in items if filter_func(item)]
    return items
```

## 에러 처리
- 구체적인 예외 사용
- 컨텍스트 매니저 활용
- 로깅 필수

## 테스트
- pytest 사용
- fixtures 활용
- 테스트 커버리지 80% 이상
```

## 6.3 Java/Kotlin

### Java 프로젝트 현대화

```bash
claude "이 레거시 Java 코드를 Java 17+ 기능을 활용해서 현대화해줘.
Records, Pattern Matching, Text Blocks를 사용하고,
Optional을 활용해서 null 안전성을 높여줘"
```

### Spring Boot 최적화

**1. 의존성 주입 패턴**

```bash
claude "Spring Boot 애플리케이션의 의존성 주입을 최적화해줘.
Constructor injection을 사용하고, 
순환 의존성을 제거하며, 테스트하기 쉽게 만들어줘"
```

**2. 반응형 프로그래밍**

```bash
claude "이 REST API를 Spring WebFlux로 마이그레이션해줘.
Mono와 Flux를 활용해서 논블로킹 처리를 구현해줘"
```

### Kotlin 관용구 활용

```bash
claude "이 Java 코드를 Kotlin으로 변환해줘.
data class, sealed class, extension functions,
그리고 코루틴을 활용해서 더 간결하고 안전하게 만들어줘"
```

### Java/Kotlin CLAUDE.md 예시

```markdown
# Java/Kotlin Guidelines

## Java 규칙
- Java 17+ 기능 적극 활용
- Lombok 사용 최소화
- Stream API 선호

## Kotlin 규칙
- Null 안전성 활용
- 불변성 우선
- 코루틴으로 비동기 처리

## Spring Boot
```kotlin
@RestController
@RequestMapping("/api/users")
class UserController(
    private val userService: UserService
) {
    @GetMapping("/{id}")
    suspend fun getUser(@PathVariable id: Long): ResponseEntity<UserDto> {
        return userService.findById(id)
            ?.let { ResponseEntity.ok(it) }
            ?: ResponseEntity.notFound().build()
    }
}
```

## 테스트
- JUnit 5 + MockK
- @SpringBootTest 최소화
- 테스트 픽스처 공유
```

## 6.4 Go

### Go 프로젝트 구조

```bash
claude "Go 모듈을 사용하는 프로젝트 구조를 만들어줘.
Clean Architecture를 적용하고, 
의존성 주입과 인터페이스를 활용해서 테스트하기 쉽게 만들어줘"
```

### Go 동시성 패턴

**1. 고루틴과 채널**

```bash
claude "이 순차 처리 코드를 고루틴과 채널을 사용해서 병렬화해줘.
적절한 에러 처리와 컨텍스트 취소도 구현해줘"
```

**2. 동시성 패턴**

```bash
claude "Worker Pool 패턴을 구현해줘.
작업 큐, 워커 고루틴, 결과 수집을 포함하고,
graceful shutdown도 지원해줘"
```

### Go CLAUDE.md 예시

```markdown
# Go Project Guidelines

## 프로젝트 구조
```
cmd/           # 메인 애플리케이션
internal/      # 내부 패키지
pkg/           # 공개 패키지
api/           # API 정의
```

## 코딩 규칙
- 에러는 항상 처리
- 인터페이스는 사용하는 쪽에서 정의
- 고루틴 리크 방지

## 에러 처리
```go
if err != nil {
    return fmt.Errorf("failed to process: %w", err)
}
```

## 테스트
- 테이블 기반 테스트
- 인터페이스로 모킹
- 통합 테스트 포함
```

## 6.5 Rust

### Rust 안전성 활용

```bash
claude "이 C++ 코드를 Rust로 재작성해줘.
소유권, 생명주기, 트레이트를 활용해서
메모리 안전성을 보장하면서도 성능을 유지해줘"
```

### Rust 에러 처리

**1. Result 타입 활용**

```bash
claude "이 함수들의 에러 처리를 개선해줘.
Result 타입과 ? 연산자를 사용하고,
커스텀 에러 타입도 정의해줘"
```

**2. 비동기 Rust**

```bash
claude "Tokio를 사용해서 비동기 웹 서버를 만들어줘.
동시 요청 처리, 타임아웃, 그리고 graceful shutdown을 구현해줘"
```

### Rust CLAUDE.md 예시

```markdown
# Rust Project Guidelines

## 안전성 규칙
- unsafe 최소화
- unwrap() 사용 금지
- clippy 경고 모두 해결

## 에러 처리
```rust
use thiserror::Error;

#[derive(Error, Debug)]
pub enum AppError {
    #[error("IO error: {0}")]
    Io(#[from] std::io::Error),
    
    #[error("Parse error: {0}")]
    Parse(String),
}
```

## 성능
- 불필요한 복사 피하기
- 제로 코스트 추상화 활용
- 벤치마크로 검증

## 의존성
- 최소한의 크레이트 사용
- 버전 고정
- 보안 감사 정기 실행
```

## 언어 간 상호 운용성

### 다국어 프로젝트

```bash
claude "Python 백엔드와 TypeScript 프론트엔드를 연결하는
타입 안전한 API 클라이언트를 생성해줘.
OpenAPI 스펙을 기반으로 자동 생성되도록 해줘"
```

### FFI (Foreign Function Interface)

```bash
claude "Rust로 작성된 고성능 라이브러리를 
Python에서 사용할 수 있도록 바인딩을 만들어줘.
PyO3를 사용하고, 타입 변환도 안전하게 처리해줘"
```

## 언어별 최적화 전략

### 1. 성능 중심 언어 (C++, Rust, Go)

```bash
# 벤치마크 기반 최적화
claude "이 함수의 성능을 프로파일링하고 최적화해줘.
벤치마크를 작성하고, 병목 지점을 찾아서 개선해줘"
```

### 2. 생산성 중심 언어 (Python, Ruby, JavaScript)

```bash
# 개발 속도 최적화
claude "이 프로토타입을 빠르게 구현해줘.
일단 작동하게 만든 후, 필요한 부분만 최적화해줘"
```

### 3. 안전성 중심 언어 (Rust, Haskell, Kotlin)

```bash
# 타입 시스템 활용
claude "이 비즈니스 로직을 타입 시스템으로 보장해줘.
런타임 에러가 발생할 수 없도록 컴파일 타임에 검증해줘"
```

## 실전 팁: 언어 선택 가이드

```bash
# 프로젝트 요구사항 분석
claude "이 프로젝트의 요구사항을 분석하고,
가장 적합한 프로그래밍 언어를 추천해줘.
성능, 개발 속도, 팀 역량, 생태계를 고려해줘"
```

### 언어별 적합한 도메인

| 언어 | 적합한 도메인 | 강점 |
|------|-------------|------|
| Python | 데이터 과학, AI/ML, 스크립팅 | 풍부한 라이브러리 |
| JavaScript/TS | 웹 개발, 풀스택 | 유니버설 언어 |
| Go | 마이크로서비스, DevOps | 단순함과 성능 |
| Rust | 시스템 프로그래밍, WebAssembly | 안전성과 성능 |
| Java/Kotlin | 엔터프라이즈, Android | 성숙한 생태계 |

## 마치며

각 언어의 강점을 이해하고 활용하는 것이 중요합니다. Claude Code는 각 언어의 관용구와 베스트 프랙티스를 이해하고 있으므로, 언어별 특성을 최대한 활용할 수 있습니다.

핵심 원칙:
1. **언어 철학 존중**: 각 언어가 추구하는 가치 이해
2. **생태계 활용**: 언어별 표준 도구와 라이브러리 사용
3. **관용구 따르기**: 커뮤니티의 코딩 스타일 준수
4. **강점 극대화**: 각 언어의 장점을 살리는 설계

다음 장에서는 이러한 언어별 특성을 활용한 효율적인 개발 워크플로우를 구축하는 방법을 알아보겠습니다.