# INTEGRATION_RULES — 브랜치와 PR

| 구분 | 이름 | 할 수 있는 일 | 할 수 없는 일 |
|---|---|---|---|
| 팀원 작업 브랜치 | `member/<이름>-<작업>` | 원본·회의록·리서치·작업로그·산출물 | 공식 상태/결정/우선순위 변경 |
| 통합 브랜치 | `integrate/<범위>-YYYY-MM-DD` | 여러 PR 통합, 보호 파일 갱신, 충돌 해소 | 팀장 승인 없이 main 머지 |
| `main` | 공식 기준선 | 검토 완료 PR 반영 | 직접 작업/직접 push |

## 보호 파일
`000 HOME.md`, `AGENTS.md`, `TEAM-GUIDE.md`, `_system/**`, `02 Decisions/**`, `05 Tasks/**`, `.github/**`는 통합 책임자만 변경합니다.

## 절차
1. 팀원은 작업 브랜치에서 근거와 초안을 커밋합니다.
2. PR에 범위·출처·기존 결정과의 충돌 여부를 적습니다.
3. 통합 책임자가 검토하고 필요하면 질문합니다.
4. `integrate/...`에서 `CURRENT_STATE`, `DECISION_LOG`, ADR, 공식 태스크를 함께 갱신합니다.
5. 팀장이 최종 PR을 승인해 `main`에 반영합니다.

> GitHub Settings에서 main branch protection과 required reviews를 켜야 실제 권한 제어가 됩니다.
