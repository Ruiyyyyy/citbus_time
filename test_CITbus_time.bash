#!/bin/bash
# SPDX-FileCopyrightText: 2026 Ryu Taniguchi
# SPDX-License-Identifier: BSD-3-Clause

# テスト入力用のダミー時刻表データ
timetable="09:00\n10:00\n10:30\n11:00\n12:00"

# テスト1: 正常系
out=$(echo -e "$timetable" | ./CITbus_time 10:15)
expected="10:30 (あと 15 分)"

if [ "$out" = "$expected" ]; then
    echo "Test 1 OK: Found next bus correctly"
else
    echo "Test 1 ERROR: Expected '$expected' but got '$out'"
    exit 1
fi

# テスト2: 最終バス後
out=$(echo -e "$timetable" | ./CITbus_time 13:00)
expected="本日の便は終了しました"

if [ "$out" = "$expected" ]; then
    echo "Test 2 OK: Handled end of service"
else
    echo "Test 2 ERROR: Expected '$expected' but got '$out'"
    exit 1
fi

# テスト3: ジャストの時刻
out=$(echo -e "$timetable" | ./CITbus_time 10:00)
expected="10:00 (あと 0分)"

if [ "$out" = "$expected" ]; then
    echo "Test 3 OK: Handled exact time match"
else
    echo "Test 3 ERROR: Expected '$expected' but got '$out'"
    exit 1
fi

echo "All tests passed successfully."
