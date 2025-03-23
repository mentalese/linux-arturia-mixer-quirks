#!/bin/bash

# AudioFuse의 카드 번호 가져오기
CARD_NUM=$(aplay -l | grep "AudioFuse" | grep card | awk '{print $2}' | sed 's/://')

# numid 파라미터 확인
if [ -z "$1" ]; then
    echo "사용법: $0 <numid>"
    echo "예: $0 8 또는 $0 9"
    exit 1
fi

NUMID=$1

# 현재 상태 확인
CURRENT_STATE=$(amixer -c "$CARD_NUM" cget numid="$NUMID" | grep ": values=" | awk -F'=' '{print $2}')

if [ -z "$CURRENT_STATE" ]; then
    echo "numid=$NUMID 설정을 찾을 수 없습니다."
    exit 1
fi

# 상태 토글
if [ "$CURRENT_STATE" = "on" ]; then
    NEW_STATE="off"
else
    NEW_STATE="on"
fi

# 변경 적용
amixer -c "$CARD_NUM" cset numid="$NUMID" "$NEW_STATE"

# 결과 출력
echo "numid=$NUMID 값이 $CURRENT_STATE -> $NEW_STATE 로 변경되었습니다."

