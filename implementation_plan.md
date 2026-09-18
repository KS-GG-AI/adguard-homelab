# KS-GG-AI Ecosystem Implementation Plan (Cumulative: v4)

## 📜 Version Changelog & Diffs
- **v1**: KS-GG-AI GitHub Profile Enhancement & v0.4.0 Release (+94, -0)
- **v2**: adguardhome-homelab-stack Enhancement & v1.0.0 Release (+97, -0)
- **v3**: github-org-map-public Visuals & 10-Locale Documentation Enhancement (+120, -0)
- **v4**: Collapsible <details> default state across 2 repos, Profile Contact mapping (10 locales), and Repo naming alignment (+160, -0)

---

## 🏛️ [v1 Specification] KS-GG-AI GitHub Profile Enhancement & v0.4.0 Release Plan

### Overview
Enhance the official GitHub profile repository ([KS-GG-AI/KS-GG-AI](https://github.com/KS-GG-AI/KS-GG-AI)) to showcase recently shipped, production-grade projects (`adguardhome-homelab-stack` and `github-org-map-public`), integrate dark-themed GitHub activity and system architecture badges matching the profile's design palette (`#161126`), maintain 100% parity across all 10 supported languages, commit/push changes, and publish official release `v0.4.0`.

---

### User Review Required

> [!IMPORTANT]
> - **10개 언어 전체 동기화**: 메인 `README.md`(영어) 및 `profile/content/locales/` 내 9개 언어(`ko.md`, `zh-CN.md`, `es.md`, `hi.md`, `ar.md`, `pt-BR.md`, `ru.md`, `fr.md`, `id.md`) 전체에 '주요 시스템 쇼케이스' 및 '통계 배지'가 완역되어 동일하게 반영됩니다.
> - **GitHub 릴리즈 발행**: `v0.4.0 · Featured systems showcase and profile refinement` 타이틀로 영문/국문 바이링구얼 릴리즈 노트와 함께 공식 발행됩니다.

---

### Key Design & Architecture

#### 1. Featured Systems Showcase (주요 프로젝트 쇼케이스)
기존의 추상적 프로젝트 안내/로드맵 상단에 실제 제작 및 배포된 핵심 시스템 2종의 쇼케이스 카드를 추가합니다:

1. **`adguardhome-homelab-stack`** (Production-grade DNS & Networking Appliance)
   - **배지**: `Linux ZRAM (zstd)` · `TCP BBR` · `HTTP/2 & HTTP/3 (QUIC/DoQ)` · `20-Year TLS` · `Zero-SPOF Failover` · `10 Locales`
   - **설명**: 4대 Proxmox 물리 노드 독립 격리 운영, 7.5MB UDP 버퍼 튜닝, 초고속 1초 DNS 폴백, ByeDPI + PAC 스마트 라우팅.
   - **링크**: 레포지토리 바로가기 및 한국어 문서 링크 포함.

2. **`github-org-map-public`** (Automated Workspace & Privacy Map)
   - **배지**: `GitHub Actions Automation` · `SVG + GIF Generation` · `Privacy Masking`
   - **설명**: 조직/계정 단위 저장소 맵 자동 생성, 비공개 저장소 프라이버시 마스킹, 일일 정기 갱신 파이프라인.
   - **링크**: 레포지토리 바로가기.

#### 2. GitHub Dynamic Activity & Architecture Badges
- 프로필 상단 또는 스택 섹션 하단에 프로필 다크 톤앤매너(`bg_color=161126`, `border_color=312E4D`, `title_color=A78BFA`, `text_color=F5F3FF`, `icon_color=67E8F9`)와 일치하는 GitHub Stats 및 Top Languages 통계 카드 연동.
- 무결점 고속 렌더링을 위해 GitHub 자체 렌더러 지원 SVG 구조 적용.

#### 3. 10개 언어 완벽 패리티 (10-Locale Complete Parity)
- 언어별 폴더 상대경로(`../../assets/`, `../README.md` 등) 깨짐 방지 및 언어 전환 헤더 네비게이션 무결성 유지.

---

### Proposed Changes

#### Core Profile Documents

##### [MODIFY] [README.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/README.md)
- Featured Systems Showcase 섹션 추가 (`adguardhome-homelab-stack`, `github-org-map-public`).
- 다크 테마 GitHub Stats & Languages 배지 연동.
- Projects 섹션 구조 정돈 및 빠른 탐색 링크 강화.

##### [MODIFY] [profile/content/locales/ko.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/ko.md)
- 한국어 쇼케이스 카드 및 설명 완역 반영.

##### [MODIFY] [profile/content/locales/zh-CN.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/zh-CN.md)
- 간체 중국어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/es.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/es.md)
- 스페인어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/hi.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/hi.md)
- 힌디어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/ar.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/ar.md)
- 아랍어 쇼케이스 반영 (RTL 텍스트 정합성 유지).

##### [MODIFY] [profile/content/locales/pt-BR.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/pt-BR.md)
- 브라질 포르투갈어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/ru.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/ru.md)
- 러시아어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/fr.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/fr.md)
- 프랑스어 쇼케이스 반영.

##### [MODIFY] [profile/content/locales/id.md](file:///c:/Users/Administrator/Desktop/Newfolder/KS-GG-AI/profile/content/locales/id.md)
- 인도네시아어 쇼케이스 반영.

---

### Release & Git Automation

1. **Git Commit & Push**:
   - Commit: `feat(profile): showcase featured systems and publish v0.4.0`
   - Push to `origin main` using existing `.github-account` credential link.
2. **GitHub Release v0.4.0**:
   - `gh release create v0.4.0 --title "v0.4.0 · Featured systems showcase and profile refinement"` with bilingual release notes (English + Korean).

---

### Verification Plan

#### Automated & Consistency Verification
- **Link Integrity**: 모든 10개 언어 파일의 상호 링크 및 상대경로 검증.
- **Git Cleanliness**: `git status` 및 `git diff` 점검 (시크릿, 인공물 워터마크 없음 확인).
- **Release Verification**: `gh release view v0.4.0`으로 태그 및 릴리즈 노트 확인.

---

## 🏛️ [v2 Specification] adguardhome-homelab-stack Enhancement & v1.0.0 Release

### 1. Requirements Breakdown
1. **가운데 정렬 (Center Alignment)**:
   - 메인 `README.md` 및 10개 언어 문서 상단의 타이틀, 로고 배너, 언어 전환 바, Shields 배지, 슬로건을 `<div align="center">`로 정렬하여 심미성과 가독성을 극대화.
2. **세련된 시각 비주얼 자산 제작 (SVG & Animated GIF)**:
   - `docs/assets/banner.svg`: 딥 다크(#161126) 배경의 네온 사이버펑크 홈랩 배너 제작.
   - `docs/assets/network-topology.svg`: 외부망(WAN) - 2.5G 물리 스위치 허브 - 4대 Proxmox 독립 노드 - VM 3000 어플라이언스 - 내부 게스트 VM 간 네트워크 연결 토폴로지 다이어그램.
   - `docs/assets/dns-flow.gif`: DNS 질의 처리, 0ms 캐시 응답, DoQ(HTTP/3) 암호화 패킷 흐름 애니메이션 GIF.
3. **외부망 / 내부망 / 스위치 허브 아키텍처 상세 서술**:
   - **외부망 (WAN / Uplink)**: ISP 게이트웨이 연동, Cloudflare/Quad9/Google 암호화 업스트림(DoH/DoT), 최속 업스트림 병렬 질의, 낙관적 캐싱.
   - **내부망 & 2.5G 스위치 허브 (LAN & Backbone)**:
     - 2.5GbE 스위치 허브를 통한 물리 PC 간 대역폭 병목 없는 고속 백본 구성.
     - Dual-NIC 분리: `vmbr0`(외부 WAN/관리)과 `vmbr1`(내부 2.5G 전용 사설망 `10.0.X.0/24`) 분리.
     - **노드 간 독립 격리 (Zero-Coupling Pod)**: 특정 노드의 재부팅이나 장애가 다른 노드에 전파되지 않는 무결합 독립 파드 설계.
     - **내부 통신과 DNS 분리**: 게스트 간 통신(Samba, NFS, SSH, API)은 2.5G 스위치 허브로 고속 전송되며, DNS 질의는 로컬 노드 VMID 3000(0ms Loopback)으로 즉각 처리.
     - **초고속 장애 조치 (Instant Failover)**: AdGuard 정지 시 1초 만에 2차 DNS(1.1.1.1)로 자동 폴백.
4. **시스템 사양 (최소 사양 / 권장 사양 표)**:
   - CPU, RAM, 스토리지, 네트워크 카드(NIC), OS 관점에서의 최소/권장/프로덕션 멀티노드 스펙 비교표.
5. **용도별 사용 가이드 (Usage Scenarios)**:
   - 1) 스마트 홈 및 홈랩 전 기기 광고/트래커 통합 차단
   - 2) 개발자/엔지니어링 샌드박스 (ByeDPI + PAC 기반 선택적 해외 가속 및 내부 도메인 리졸빙)
   - 3) 고가용성 멀티 노드 가상화 인프라 (Zero-SPOF 독립 격리)
   - 4) 차세대 엔터프라이즈급 DoQ / HTTP/3 보안 네트워크
6. **10개 언어 전체 완벽 패리티 (10 Locales Parity)**:
   - `README.md` (English)
   - `locales/ko.md` (한국어)
   - `locales/zh-CN.md` (中文)
   - `locales/es.md` (Español)
   - `locales/hi.md` (हिन्दी)
   - `locales/ar.md` (العربية)
   - `locales/pt-BR.md` (Português)
   - `locales/ru.md` (Русский)
   - `locales/fr.md` (Français)
   - `locales/id.md` (Bahasa Indonesia)
7. **공식 GitHub Release v1.0.0 발행**:
   - `v1.0.0 · Production-Grade High-Performance Homelab Stack` 바이링구얼 릴리즈 노트 발행.

---

### 2. Proposed Changes (adguardhome-homelab-stack)

#### [NEW] [docs/assets/banner.svg](file:///c:/Users/Administrator/Desktop/Newfolder/adguardhome-homelab-stack/docs/assets/banner.svg)
- 세련된 1200x380 다크 네온 배너 SVG.

#### [NEW] [docs/assets/network-topology.svg](file:///c:/Users/Administrator/Desktop/Newfolder/adguardhome-homelab-stack/docs/assets/network-topology.svg)
- 외부망 / 2.5G 스위치 허브 / 4대 독립 노드 / 내부망 토폴로지 SVG.

#### [NEW] [docs/assets/dns-flow.gif](file:///c:/Users/Administrator/Desktop/Newfolder/adguardhome-homelab-stack/docs/assets/dns-flow.gif)
- 트래픽 처리 애니메이션 GIF.

#### [MODIFY] [README.md](file:///c:/Users/Administrator/Desktop/Newfolder/adguardhome-homelab-stack/README.md)
- 헤더 `<div align="center">` 가운데 정렬, 배너 SVG 및 GIF 삽입.
- 외부망/내부망/스위치 허브 아키텍처 상세 추가.
- 최소 사양 및 권장 사양 표 추가.
- 용도별 사용 가이드 추가.

#### [MODIFY] [locales/*.md](file:///c:/Users/Administrator/Desktop/Newfolder/adguardhome-homelab-stack/locales/)
- `ko.md`, `zh-CN.md`, `es.md`, `hi.md`, `ar.md`, `pt-BR.md`, `ru.md`, `fr.md`, `id.md` 9개 언어 문서 동일하게 전면 개편 및 완역.

---

### 3. Verification Plan
- 자산 렌더링 및 링크 무결성 검증 (상대경로 확인).
- 10개 언어 간 섹션 구성 및 번역 정합성 확인.
- Git 상태 확인 및 원격 `main` 브랜치 푸시.
- `gh release create v1.0.0`으로 정식 릴리즈 생성 및 확인.

---

## 🏛️ [Round 4 Specification] Shield Icon Decoupling & Standalone Cyber Badge

### 1. 개요 및 배경
- 사용자가 첨부한 3번 사진(`KS-GG-AI/README.md`)과 같이, 상단 헤더를 **좌측 배너 카드(78%)**와 **우측 전용 스퀘어 배지(20%)**로 분리 배치("따로 따로").
- 기존 배너 내부 좌측에 내장되어 있던 방패 아이콘의 얼굴 모양 도트 3개(외계인/얼굴처럼 깨져 보이는 느낌)를 완전히 제거하고, 정통적이고 날렵한 AdGuard 사이버 방패 엠블럼과 체크마크로 리디자인.
- 고해상도 벡터 SVG(`shield.svg`) 및 32프레임 부드러운 네온 펄스 애니메이션 GIF(`shield.gif`, 512x512)를 생성하여 단독 에셋으로 분리.
- 배너(`banner.svg`)는 방패 분리 후 1200x308 와이드 규격으로 여유 있게 타이틀, 서브타이틀, 5대 기술 칩, 성능 푸터를 배치.

### 2. 작업 내역
1. **신규 스퀘어 방패 에셋 생성 (`shield.svg` & `shield.gif`)**:
   - 512x512 규격, `rx="100"` 라운디드 다크 글래스 카드.
   - 네온 그라디언트 테두리(`url(#neon-border)`) 및 우상단 사이버 에너지 구체.
   - 중앙에 선명하고 날렵한 AdGuard 방패 실루엣 및 네온 시안/민트 체크마크 (깨지는 도트 완전 제거).
   - 하단 `ADGUARD CORE` 액티브 상태 인디케이터.
   - `gifenc` + `sharp`를 이용한 32프레임 네온 브리딩 루프 애니메이션 `shield.gif` 생성.
2. **10개 언어 배너 SVG 리뉴얼 (`banner.svg`)**:
   - 내부 방패 제거, 좌측 여백 `x="60"`부터 시원하게 텍스트/칩/푸터 전폭 레이아웃.
   - 10개 언어 전수 적용 (`docs/assets/locales/<lang>/banner.svg` 및 루트 `banner.svg`).
3. **README.md 및 9개 언어 마크다운 헤더 레이아웃 업데이트**:
   - 메인 및 `locales/*.md` 헤더를 `<p align="center"><img src="...banner.svg" width="78%" /> <img src="...shield.gif" width="20%" /></p>` 구조로 변경.
4. **전수 검증 및 배포**:
   - `xml.etree.ElementTree` 전수 검사 (23개 SVG 문법 이상 없음 확인).
   - Git 커밋 및 GitHub `origin main` 푸시.

---

## 🚀 [v3 Specification] github-org-map-public Visuals & 10-Locale Documentation Enhancement

### 1. Requirements & Objectives
1. **SVG & GIF Generator Upgrade (Homelab Dark Chassis Architecture)**:
   - `scripts/lib/svg.ts`:
     - 딥 다크 캔버스(`fill="#070a14"` ~ `#0c1120`) 및 외곽 베이스에 GitHub 다크 모드(`#0d1117`)를 적용하여 둥근 모서리 바깥 검은색 노치(Corner Artifact) 원천 차단.
     - 상단 헤더 바: 실시간 펄스 인디케이터 LED, `GitHub Organization Map — KS-GG-AI`, 스냅샷 날짜, 메트릭 칩(`[2 Public]` `[10 Private]` `[TypeScript 1 · JavaScript 1]`).
     - 계정 및 조직 그룹별 독립 다크 카드 박스(`rx="10"`, `fill="#0d1424"`, `stroke="#1e2c45"`).
     - 리포지토리 항목 렌더링: 퍼블릭 저장소(에메랄드 그린 링 `#34d399`), 비공개 저장소(루비 레드 보안 마스킹 도트 `#f43f5e`), 모노스페이스 마스킹 라벨(`······135604`).
   - `scripts/lib/gif.ts`:
     - 기존 순백색(`#ffffff`) 플래트닝을 깃허브 다크 모드(`#0d1117`)로 변경하여 눈부심과 테마 부조화 해결.
   - 최신 디자인이 반영된 `org-map.svg`, `org-map.gif`, `history/2026-09-14.svg` 재생성.
2. **전용 벡터 배너 자산 제작 (`docs/assets/banner.svg`)**:
   - 1200x380 해상도의 고품질 사이버펑크/홈랩 다크 배너 신규 제작.
   - 타이틀: `GitHub Organization Map & Cartography`
   - 서브타이틀: `Automated Daily Repository Mapping with Zero-Knowledge SHA-256 Masking`
   - 5대 핵심 기술 칩: `Daily Cron Refresh` · `Dual Scoped Tokens` · `TypeScript & tsx` · `SVG & Animated GIF` · `10 Locales Complete`
3. **README.md 및 10개 언어 문서 완벽 동기화 (100% Parity)**:
   - 메인 `README.md`에 상단 배너, Shields.io 상태 배지, 100% 폭 맵 렌더링 적용.
   - `docs/locales/` 내 10개 언어 문서(`ko.md`, `zh-CN.md`, `es.md`, `hi.md`, `ar.md`, `pt-BR.md`, `ru.md`, `fr.md`, `id.md`)의 기존 35줄 단축본을 영문 README와 동일한 100% 전체 구조로 완역:
     - 1. 소개 (About)
     - 2. 실시간 맵 시각화 (Real-time Map Visualization)
     - 3. 작동 원리 (How it works)
     - 4. 필수 시크릿 키 (Required Secrets)
     - 5. 워크플로 스케줄 (Schedule)
     - 6. 로컬 실행 방법 (Running locally)
     - 7. 상세 설정값 (Configuration)
     - 8. 테스트 실행 (Tests)
     - 9. 문의 및 피드백 (Contact)

---

### 2. Proposed Changes (github-org-map-public)

#### [NEW] [docs/assets/banner.svg](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/docs/assets/banner.svg)
- 사이버/다크 홈랩 스타일의 1200x380 벡터 배너 SVG 제작.

#### [MODIFY] [scripts/lib/svg.ts](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/scripts/lib/svg.ts)
- 다크 섀시 캔버스, 헤더 상태 바, 독립 그룹 카드 박스 렌더링 로직 추가.

#### [MODIFY] [scripts/lib/gif.ts](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/scripts/lib/gif.ts)
- sharp 래스터라이징 시 배경을 `#0d1117`로 지정하여 다크 모드 완벽 블렌딩.

#### [MODIFY] [org-map.svg](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/org-map.svg) & [org-map.gif](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/org-map.gif)
- 개선된 렌더러로 최신 맵 재생성.

#### [MODIFY] [README.md](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/README.md)
- 헤더 `<div align="center">`, 배너 SVG, 뱃지, 100% 폭 맵 이미지 구조화.

#### [MODIFY] [docs/locales/*.md](file:///c:/Users/Administrator/Desktop/Newfolder/github-org-map-public/docs/locales/)
- 10개 언어 문서 전수 영문 README 수준으로 전체 번역 및 동기화.

---

### 3. Verification Plan
1. **타입 및 테스트 검증**:
   - `npm test` (`tsc --noEmit && tsx --test ...`) 37개 테스트 전수 통과 확인.
2. **SVG XML 문법 및 렌더링 검증**:
   - Node.js 기반 XML 파서로 생성된 배너 및 `org-map.svg` 문법 유효성 확인.
3. **GIF 생성 및 모서리 검증**:
   - `org-map.gif`의 4개 모서리 픽셀이 `#0d1117`로 안전하게 블렌딩되는지 확인.
4. **Git 커밋 및 GitHub 원격 푸시**:
   - Git 영어 커밋 메시지 작성 후 `origin main`에 푸시.

---

## 🚀 [v4 Specification] Collapsible Details, Profile Contact Mapping & Repo Naming Alignment

### 1. Requirements & Objectives
1. **Collapsible Section Architecture (`<details>` / `<summary>`)**:
   - 대상 저장소: `adguardhome-homelab-stack` 및 `github-org-map-public`.
   - 상단 히어로 영역(배너, 배지, 언어 네비게이터, 실시간 렌더링 GIF/SVG)은 상시 노출하여 첫인상과 시각적 완결성을 유지.
   - 본문의 모든 주요 섹션(Architecture, Specifications, Usage Scenarios, Performance, Directory, Quick Start, Security, License, About, How it works, Secrets, Schedule, Config 등)을 `<details>` 태그로 래핑.
   - **기본값으로 접기(Default Collapsed)**: `open` 속성을 생략하여 진입 시 군더더기 없이 깔끔하게 접힌 상태 유지. 사용자가 클릭 시 부드럽게 펼쳐지도록 구성.
   - 영문 `README.md` 뿐만 아니라 **10개 언어 전체 문서**(`locales/*.md` 및 `docs/locales/*.md`)에 100% 동일하게 일괄 적용.
2. **프로필 기반 Contact 매핑 자동화**:
   - `KS-GG-AI` 메인 프로필의 Contact 섹션을 기반으로 두 저장소의 성격에 맞춰 자동 매핑 및 연동.
   - 프로필의 다국어 번역본(`profile/content/locales/`)과 100% 일치하는 10개 언어별 `## Contact` / `## 연락` / `## 联系` / `## Contacto` / `## संपर्क` / `## للتواصل` / `## Contato` / `## Контакты` / `## Contact` / `## Kontak` 텍스트 적용.
   - 링크 매핑: `[GitHub Profile](https://github.com/KS-GG-AI)` · `[Public Repositories](https://github.com/KS-GG-AI?tab=repositories)` · `[Open an Issue](https://github.com/KS-GG-AI/<repo>/issues/new)` · `[Profile Source](https://github.com/KS-GG-AI/KS-GG-AI)`.
   - Contact 섹션 역시 `<details>`로 래핑하여 통일된 UX 제공.
3. **저장소 이름 개선안 (Repo Naming Optimization)**:
   - 두 저장소의 명칭을 보다 직관적이고 현대적이며 전문적인 GitHub 표준 네이밍으로 고도화 제안.
   - `adguardhome-homelab-stack` 개선안:
     - 1안: `adguard-homelab` (권장: 불필요한 음절 축소, 핵심 홈랩 어플라이언스 정체성 강조)
     - 2안: `adguardhome-appliance` (강화된 독립 어플라이언스/하드웨어 성격 강조)
     - 3안: `homelab-dns-shield` (네트워크 보안/DNS 쉴드 역할 강조)
     - 4안: 기존 이름 유지 (`adguardhome-homelab-stack`)
   - `github-org-map-public` 개선안 (참고: 현재 `KS-GG-AI/github-org-map`이 비공개 원본 저장소로 기존재):
     - 1안: `org-cartographer` (권장: `-public` 접미사의 임시적인 느낌을 벗어나 자동화 지도 제작 엔진으로서의 전문성 부여)
     - 2안: `org-map-telemetry` (SHA-256 프라이버시 마스킹 및 데일리 텔레메트리 맵 강조)
     - 3안: `github-map-public` (간소화)
     - 4안: 기존 이름 유지 (`github-org-map-public`)

---

### 2. Proposed Changes

#### 1) `adguardhome-homelab-stack`
- [MODIFY] `README.md`: 모든 본문 섹션 `<details>` 래핑 및 Contact 섹션 신설.
- [MODIFY] `locales/ko.md`: 한국어 본문 섹션 `<details>` 래핑 및 '연락' 섹션 매핑.
- [MODIFY] `locales/*.md` (zh-CN, es, hi, ar, pt-BR, ru, fr, id): 8개 언어 전수 동일 적용.

#### 2) `github-org-map-public`
- [MODIFY] `README.md`: 모든 본문 섹션 `<details>` 래핑 및 Contact 섹션 최적화.
- [MODIFY] `docs/locales/ko.md`: 한국어 본문 섹션 `<details>` 래핑 및 '연락' 섹션 매핑.
- [MODIFY] `docs/locales/*.md` (zh-CN, es, hi, ar, pt-BR, ru, fr, id): 8개 언어 전수 동일 적용.

#### 3) `KS-GG-AI` (이름 변경 시 연동)
- [MODIFY] `README.md` & `profile/content/locales/*.md`: 레포지토리 이름 변경 확정 시 쇼케이스 및 프로젝트 링크 일괄 동기화.

---

### 3. Verification Plan
1. **마크다운 구문 및 HTML 태그 정합성 검증**:
   - `<details>` 및 `</details>` 짝 일치, `<summary>` 내 인라인 제목 스타일 정상 렌더링 확인.
2. **10개 언어 패리티 및 상대경로 검증**:
   - 모든 언어 파일에서 링크 깨짐 및 이미지 렌더링 정상 여부 검증.
3. **테스트 스위트 검증**:
   - `github-org-map-public`에서 `npm test` 통과 확인.
4. **Git 동기화**:
   - 작업 완료 후 `origin main`에 안전하게 푸시.
