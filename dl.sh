#!/usr/bin/env bash

# 스크립트에 인자가 하나 이상 전달되었는지 확인합니다.
if [[ -n "$1" ]]; then
  # 기본 필드 구분자(IFS)를 '|'로 변경합니다.
  # 이렇게 하면 $* 변수가 모든 인자를 '|'로 연결한 문자열을 생성합니다.
  IFS='|'
  pattern="$*"
  
  # docker images 명령어의 결과에서 -E 옵션을 사용하여 여러 패턴 중 하나라도 일치하는 라인을 찾습니다.
  # awk를 사용하여 세 번째 필드(Image ID)를 출력합니다.
  docker images | grep -E "$pattern" | awk '{print $3}'
else
  # 인자가 없으면 모든 이미지 ID를 출력합니다.
  docker images | awk '{print $3}'
fi
