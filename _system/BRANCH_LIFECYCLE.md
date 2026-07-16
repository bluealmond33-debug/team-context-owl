# BRANCH_LIFECYCLE — 브랜치가 쌓이지 않게 하는 규칙

## 목적

작업 브랜치는 무기한 방치하지 않는다. 그러나 고유 커밋이 있는 브랜치를 자동 삭제하거나 강제로 main에 맞추지도 않는다. 먼저 **감사 → 담당자 확인 → 선별 반영/보관 → 정리** 순서로 처리한다.

## 상태

| 상태 | 기준 | 다음 행동 |
|---|---|---|
| active | 작업 중 또는 열린 PR | 담당자가 계속 작업/PR 갱신 |
| review | `main`보다 앞선 고유 커밋이 있으나 PR 없음 | 7일 안에 담당자가 PR·보관·폐기 중 선택 |
| stale | 14일 이상 갱신 없고 main보다 뒤처짐 | 자동 감사가 보고, 담당자에게 확인 |
| cleanable | `main`보다 ahead 0 | 외부 참조 확인 후 삭제 후보 |
| archived | 검토 결과 보존만 필요 | `archive/<원래 브랜치>` 태그 후 브랜치 삭제 가능 |

## 개인 브랜치 재사용

`member/<이름>`을 계속 쓰고 싶다면 PR이 main에 머지된 뒤에만 아래를 실행합니다.

```bash
git fetch origin
git switch member/<이름>
git status --short  # 반드시 비어 있어야 함
git reset --hard origin/main
git push --force-with-lease origin member/<이름>
```

- 이름은 유지하고 내용만 main과 같게 만듭니다.
- 아직 PR에 넣지 않은 작업이 있으면 실행하지 않습니다.
- 다른 사람의 브랜치에는 force-push하지 않습니다.

## 자동화 범위

`.github/workflows/branch-audit.yml`은 정기적으로 **읽기 전용 감사 보고서**를 만듭니다. 자동 삭제·자동 reset은 하지 않습니다. 고유 작업을 지우는 자동화는 위험하며, 담당자와 팀장의 명시적 결정이 필요합니다.
