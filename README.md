# Context Owl 🦉

팀과 AI가 **같은 프로젝트 맥락을 읽고 쓰도록** 만드는 Obsidian + GitHub 템플릿입니다.

- 사람은 회의, 자료, 결정, 결과물을 남깁니다.
- AI는 이 저장소를 clone한 뒤 `000 HOME.md` → `AGENTS.md` → `_system/CURRENT_STATE.md` 순으로 읽고 작업합니다.
- 팀원은 자기 작업 브랜치에 근거·초안·산출물을 올립니다.
- 통합 책임자는 PR을 검토하고 `integrate/...` 브랜치에서 공식 상태·결정을 갱신합니다.

## 시작

1. 이 저장소를 **Use this template** 또는 Fork 합니다.
2. `000 HOME.md`, `_system/TEAM.md`, `_system/CURRENT_STATE.md`의 대괄호 내용을 프로젝트에 맞게 채웁니다.
3. 팀원은 `member/<이름>-<작업>` 브랜치에서 작업합니다.
4. 팀장/통합 책임자가 PR을 검토해 `integrate/<범위>-YYYY-MM-DD`로 모은 뒤 `main`에 반영합니다.

## 구조

```text
000 HOME.md          # 사람이든 AI든 시작하는 대시보드
AGENTS.md            # AI/사람 공통 작업 규칙
TEAM-GUIDE.md        # Git을 몰라도 따라 할 팀원 안내
_system/             # 현재 상태·결정·팀·규칙 — 공식 기준점
00 Inbox/            # 아직 정리하지 않은 원본
01 Meetings/         # 회의록
02 Decisions/        # 확정된 ADR/결정
03 Research/         # 조사와 PDF/PPT/Word의 Markdown 정리본
04 Worklogs/         # 개인 작업 기록
05 Tasks/            # 공식 할 일
06 Prompts/          # AI별/역할별 프롬프트
07 Outputs/          # 기획서·데모·발표 등 산출물
90 Archive/          # 종료된 작업
99 Templates/        # 회의록·결정·리서치 양식
```

## 원본과 Markdown을 함께 보관하기

PDF·PPT·Word·회의 녹음은 해당 폴더의 `_raw/`에 원본으로 보관합니다. MarkItDown 같은 도구로 추출·정리한 `.md`는 같은 폴더 바로 아래에 둡니다. 정리본 첫 줄에는 원본 경로를 적습니다.

```md
> 원본: _raw/interview-notes.pdf
```

AI는 Markdown을 빠르게 읽고, 사람은 필요할 때 원본을 확인합니다.

## AI로 프로토타입 만들기

```text
이 저장소를 읽고 현재 프로젝트 맥락을 파악해줘.
읽는 순서는 000 HOME.md → AGENTS.md → _system/CURRENT_STATE.md → 관련 결정/리서치야.
그 다음 현재 상태와 결정에 맞는 Claude Code 또는 Claude Design 프로토타입 프롬프트를 작성해줘.
결정되지 않은 내용은 추측하지 말고 질문으로 남겨줘.
```

## 중요한 한계

이 템플릿의 문서는 운영 기준입니다. `main` 보호와 required review는 GitHub 저장소 Settings에서 별도로 켜야 실제 권한 제어가 됩니다.

## License

[MIT](LICENSE)
