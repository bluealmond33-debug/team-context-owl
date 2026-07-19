# Context Hippo 🦛

<p align="center">
  <img src="assets/context-hippo-hero.png" alt="입을 크게 벌린 검은 하마 — Context Hippo 마크" width="380" />
</p>

팀의 흩어진 대화·회의·링크·문서를 받아, 사람과 AI가 함께 읽을 수 있는 **공유 맥락으로 소화하는** Obsidian + GitHub 템플릿입니다.

Context Hippo는 자동으로 모든 자료를 처리하는 서비스가 아닙니다. 대신 원본을 어디에 넣고, 무엇을 Markdown으로 정리하며, 어떤 내용을 공식 결정과 현재 상태로 남길지 정합니다. 사람과 AI는 그 규칙을 함께 읽고 같은 프로젝트 맥락에서 작업합니다.

## 작동 방식

### 1. Capture — 원본을 모읍니다
회의 전사, 링크, PDF·PPT·Word, 사진, 메모처럼 아직 정리되지 않은 것은 `00 Inbox/`에 넣습니다. 원본은 각 작업 폴더의 `_raw/`에 보관합니다.

### 2. Digest — 읽을 수 있는 Markdown으로 소화합니다
사람 또는 AI가 원본을 Markdown 노트로 정리하고, 내용의 성격에 따라 회의·리서치·작업 로그·산출물 폴더로 옮깁니다. 정리본은 항상 원본 위치를 가리킵니다.

### 3. Decide — 공식 맥락을 갱신합니다
확정된 선택은 `02 Decisions/`와 `_system/DECISION_LOG.md`에, 지금 진행 중인 일과 막힌 일은 `_system/CURRENT_STATE.md`에 남깁니다. 이 파일들이 팀의 공식 기준점입니다.

### 4. Reuse — 다음 사람과 AI가 바로 이어받습니다
새 팀원과 AI는 `000 HOME.md`부터 읽습니다. 볼트 전체를 훑지 않고도 현재 목표·결정·규칙·다음 행동을 파악한 뒤, 필요한 근거만 더 읽을 수 있습니다.

## 시작하기

1. 이 저장소를 **Use this template**으로 복제하되, 팀 저장소는 **반드시 Private**으로 만듭니다. 연락처·회의록·확정 전 아이디어가 쌓이는 공간입니다 — 이 템플릿 저장소는 공개지만, 여러분의 팀 저장소는 항상 프라이빗으로 운영하고 공개는 프로젝트 종료 후 정리해서 결정하세요.
2. `ONBOARDING.md` 순서대로 진행합니다: 팀장이 저장소를 준비하고(0단계), AI와 **킥오프 인터뷰**(`_system/KICKOFF_INTERVIEW.md`)로 공식 문서를 채운 뒤(1단계), 팀원들이 온보딩 PR로 합류하고(2단계), 첫 회의에서 팀 규범을 확정합니다(3단계).
3. 클론한 폴더를 Claude Code·Codex 같은 AI 도구로 열면 `AGENTS.md`의 시작 게이트가 킥오프 인터뷰를 자동으로 시작합니다. AI 없이 쓴다면 `000 HOME.md`, `_system/TEAM.md`, `_system/CURRENT_STATE.md`의 대괄호 내용을 직접 채웁니다.
4. 자료는 `00 Inbox/`에, 팀원별 작업은 `member/<이름>-<작업>` 브랜치에 올립니다.
5. 팀장/통합 책임자가 PR을 검토해 `integrate/<범위>-YYYY-MM-DD`로 모은 뒤 `main`에 반영합니다.

## 구조

```text
000 HOME.md          # 사람이든 AI든 시작하는 대시보드
AGENTS.md            # AI/사람 공통 작업 규칙 + 킥오프 시작 게이트
CLAUDE.md            # Claude Code용 진입점 (AGENTS.md를 임포트)
ONBOARDING.md        # 첫 이틀 온보딩 절차 (저장소 준비→킥오프→팀원 합류→첫 회의)
TEAM-GUIDE.md        # Git을 몰라도 따라 할 팀원 안내
_system/             # 현재 상태·결정·팀·용어·규칙 — 공식 기준점
00 Inbox/            # 아직 정리하지 않은 원본과 접수 대장
00 Project Hub/      # 저장소 전체 지도
01 Meetings/         # 회의록
02 Decisions/        # 확정된 ADR/결정
03 Research/         # 조사와 PDF/PPT/Word의 Markdown 정리본
04 Worklogs/         # 개인 작업 기록
05 Tasks/            # 공식 할 일
06 Team/             # 팀원별 담당과 AI 프롬프트
07 Outputs/          # 기획서·데모·발표 등 산출물
90 Archive/          # 종료된 작업
99 Templates/        # 회의록·결정·리서치 양식
```

## AI에게 이렇게 요청하세요

```text
이 저장소를 읽고 현재 프로젝트 맥락을 파악해줘.
읽는 순서는 000 HOME.md → AGENTS.md → _system/CURRENT_STATE.md →
_system/DECISION_LOG.md → 요청과 직접 관련 있는 근거 문서야.

새 자료는 원본을 보관한 채 Markdown으로 정리하고,
확정된 내용은 결정 로그와 현재 상태에 반영할 항목을 제안해줘.
결정되지 않은 내용은 추측하지 말고 질문으로 남겨줘.
```

## 원본과 Markdown을 함께 보관하기

PDF·PPT·Word·회의 녹음은 해당 폴더의 `_raw/`에 원본으로 보관합니다. MarkItDown 같은 도구로 추출·정리한 `.md`는 같은 폴더 바로 아래에 둡니다. 정리본 첫 줄에는 원본 경로를 적습니다.

```md
> 원본: _raw/interview-notes.pdf
```

## 중요한 한계

이 템플릿의 문서는 운영 기준입니다. `main` 보호와 required review는 GitHub 저장소 Settings에서 별도로 켜야 실제 권한 제어가 됩니다.

## License

[MIT](LICENSE)