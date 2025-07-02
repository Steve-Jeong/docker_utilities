#!/usr/bin/env bash

# awk 스크립트를 변수로 정의합니다.
AWK_SCRIPT='
# BEGIN 블록: awk가 입력을 처리하기 전에 변수를 초기화합니다.
BEGIN {
    sum = 0
    count = 0
}

# "REPOSITORY"라는 단어가 포함된 라인(헤더)을 만나면, 출력하고 다음 라인으로 넘어갑니다.
/REPOSITORY/ {
    print
    next
}

# 그 외 모든 라인(이미지 데이터)에 대해 아래를 실행합니다.
{
    # 현재 라인을 출력합니다.
    print $0

    # 이미지 개수를 1 증가시킵니다.
    count++

    # 마지막 필드(SIZE)를 변수에 저장합니다.
    size=$NF

    # 단위를 확인하고 MB 단위로 변환하여 누적합니다.
    if (size ~ /GB$/) {
        sub(/GB/, "", size)
        sum += size * 1024
    } else if (size ~ /MB$/) {
        sub(/MB/, "", size)
        sum += size
    } else if (size ~ /KB$/) {
        sub(/KB/, "", size)
        sum += size / 1024
    }
}

# 모든 라인 처리가 끝난 후 실행됩니다.
END {
    print "--------------------------------------------------"
    printf "Total Images: %d\n", count
    if (sum >= 1000) {
        printf "Total Size: %.2f GB\n", sum / 1024
    } else {
        printf "Total Size: %.2f MB\n", sum
    }
}'

# 스크립트 실행 시 인자가 있는지 확인합니다.
if [[ -n "$1" ]]; then
  # 인자가 있으면 grep으로 필터링한 후 awk 스크립트를 실행합니다.
  docker images | grep "$1" | awk "$AWK_SCRIPT"
else
  # 인자가 없으면 바로 awk 스크립트를 실행합니다.
  docker images | awk "$AWK_SCRIPT"
fi
