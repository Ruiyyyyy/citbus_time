#!/bin/bash -xv
# SPDX-FileCopyrightText: 2026 Ryu Taniguchi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

timetable="09:00\n10:00\n10:30\n11:00\n12:00"

### NORMAL TEST ###
out=$(echo -e "$timetable" | ./CITbus_time 10:15)
[ "${out}" = "10:30 (あと 15 分)" ] || ng "$LINENO"

### END OF SERVICE TEST ###
out=$(echo -e "$timetable" | ./CITbus_time 13:00)
[ "${out}" = "本日の便は終了しました" ] || ng "$LINENO"

### EXACT TIME TEST ###
out=$(echo -e "$timetable" | ./CITbus_time 10:00)
[ "${out}" = "10:00 (あと 0 分)" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK

exit $res
