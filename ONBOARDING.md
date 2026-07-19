# ONBOARDING — 팀이 처음 시작하는 순서

> 목표: 이틀 안에 전원이 같은 맥락 위에서 첫 작업을 시작합니다.
> 팀장은 0·1단계, 팀원은 2단계, 전원이 3단계를 진행합니다.

## 진행 체크

| 단계 | 담당 | 예상 시간 | 완료 기준 |
|---|---|---:|---|
| 0. 저장소 준비 | 팀장 | 10분 | Private 생성 + 팀원 전원 초대 |
| 1. 킥오프 인터뷰 | 팀장 + AI | 20분 | `KICKOFF_INTERVIEW.md` 상태 `완료`, 공식 문서 채워짐 |
| 2. 팀원 합류 | 각 팀원 | 15분 | 각자 온보딩 PR 머지 |
| 3. 첫 회의 | 전원 | 30분 | 팀 규범 확정 + 다음 할 일 Top 3 확정 |

## 0단계 — 저장소 준비 (팀장)

1. **Use this template**으로 팀 저장소를 만들되, 반드시 **Private**을 선택합니다.
   - 팀 저장소에는 연락 핸들, 회의록, 확정 전 아이디어, 갈등 기록까지 쌓입니다. **항상 프라이빗으로 운영**하고, 포트폴리오 공개는 프로젝트가 끝난 뒤 민감 정보를 정리하고 나서 결정하세요.
   - GitHub 무료 플랜도 Private 저장소에 협업자를 제한 없이 초대할 수 있습니다.
2. Settings → Collaborators에서 팀원 전원을 **Write** 권한으로 초대합니다.
3. Settings → Branches에서 `main` 보호 규칙을 만들고 required review를 켭니다. `.github/CODEOWNERS`의 주석을 해제하고 통합 책임자 ID를 넣으면 보호 파일 규칙이 실제로 강제됩니다.
4. Actions 탭에서 워크플로가 활성인지 확인합니다 (주간 Branch audit).

## 1단계 — 킥오프 인터뷰 (팀장 + AI)

1. 저장소를 클론하고 Claude Code·Codex 같은 AI 도구로 엽니다.
2. `AGENTS.md`의 시작 게이트가 킥오프 인터뷰를 시작합니다. 팀 구성·연락처·특기·팀 규범·목표를 답하면 AI가 `_system/TEAM.md`, `_system/WORKING_AGREEMENTS.md`, `000 HOME.md`, `_system/CURRENT_STATE.md`, `06 Team/*`를 채웁니다.
3. AI 없이 진행한다면 `_system/KICKOFF_INTERVIEW.md`의 질문 5묶음을 보고 같은 파일들을 직접 채웁니다.
4. 결과를 커밋·푸시합니다. 이 시점의 팀 규범과 팀원 프로필은 **초안**입니다 — 확정은 3단계에서 합니다.

## 2단계 — 팀원 합류 (각자)

첫 PR을 미리 연습하는 리허설을 겸합니다. Git이 처음이면 `TEAM-GUIDE.md`를 옆에 두고 진행하세요.

1. 초대를 수락하고 저장소를 클론합니다.
2. `000 HOME.md` → `_system/WORKING_AGREEMENTS.md`(초안) → `06 Team/<내 별칭>.md` 순서로 읽습니다. (10분)
3. `member/<이름>-onboarding` 브랜치를 만듭니다.
4. 팀장이 채워 둔 내 프로필(`06 Team/<내 별칭>.md`)을 본인이 직접 검토·보완합니다 — 특기, 가용 시간, 배우고 싶은 것.
5. `04 Worklogs/YYYY-MM-DD-<별칭>.md`에 한 줄을 남깁니다: 온보딩 완료 사실과, 규범 초안에 대한 의견이 있으면 한 줄.
6. PR을 열어 팀장 리뷰를 받아 머지합니다. **이 PR이 머지되면 온보딩 완료입니다.**

## 3단계 — 첫 회의 (전원)

1. `_system/WORKING_AGREEMENTS.md` 초안을 함께 읽고 수정·확정합니다. 온보딩 PR에 남긴 의견을 여기서 다룹니다.
2. 확정하면 `_system/DECISION_LOG.md`에 "팀 규범 v1 확정"으로 기록합니다.
3. `_system/CURRENT_STATE.md`의 다음 할 일 Top 3와 담당을 확정합니다.
4. 회의록은 `99 Templates/meeting.md` 양식으로 `01 Meetings/YYYY-MM-DD-킥오프.md`에 남깁니다.

## 완료 판정

- [ ] 저장소 Private + 전원 초대·클론 완료
- [ ] `KICKOFF_INTERVIEW.md` 상태 `완료`
- [ ] 팀원 수만큼 온보딩 PR 머지
- [ ] `WORKING_AGREEMENTS.md` 확정 + `DECISION_LOG.md` 기록
- [ ] `CURRENT_STATE.md`에 다음 할 일 Top 3
