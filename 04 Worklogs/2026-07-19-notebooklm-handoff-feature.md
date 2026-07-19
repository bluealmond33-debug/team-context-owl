# 2026-07-19 — NotebookLM Handoff 템플릿 추가

## 목적

Context Hippo 사용자가 GitHub/Obsidian의 현재 맥락을 NotebookLM에 안전하게 전달하고, 목적별 프롬프트를 발견할 수 있도록 템플릿과 사용 가이드를 추가했다.

## 추가한 것

- `99 Templates/notebooklm-handoff.md`
  - 기준 commit, 범위, 확정 결정, 변경, 미확정 토의, 데모 상태를 한 개의 소스로 정리하는 양식
  - 팀 브리핑·슬라이드·온보딩·의사결정 검토 프롬프트 4개를 패키지 안에 기본 포함
  - 민감정보·raw 자료·오래된 결정 혼입을 막는 업로드 전 점검표
- `06 Team/NOTEBOOKLM-HANDOFF.md`
  - 3분 사용 흐름과 소스 선택 기준
  - 프롬프트를 파일 6절에 함께 넣어 사용자가 자연스럽게 발견하도록 하는 원칙

## 한계

- NotebookLM에 GitHub 저장소를 자동 동기화하거나 자동 업로드하는 기능은 구현하지 않는다.
- NotebookLM의 업로드·공유·생성 한도는 해당 서비스와 계정 설정에 따른다.
