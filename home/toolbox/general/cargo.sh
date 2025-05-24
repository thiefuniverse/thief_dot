#!/bin/bash

LAST_RUN_FILE=".cargo_last_run"
direct_run=$1

last_name=""
last_type=""
# 读取上次记录
if [[ -f "$LAST_RUN_FILE" ]]; then
    IFS=: read -r last_type last_name < "$LAST_RUN_FILE"
fi
# 获取目标列表并标记上次选择
prepare_targets() {
    last_name=$1
    last_type=$2

    # 生成带标记的列表
    cargo metadata --format-version=1 --no-deps|
    jq -r --arg last "$last_name" '
        .packages[].targets[] | 
        select(.kind[]? | test("bin|example")) |
        "\(if .name == $last then "★ " else "  " end)\(.name)\t\(.kind[]? | select(. == "bin" or . == "example"))"
    '| awk '/^★/ { star[++s]=$0; next } { lines[++n]=$0 } 
  END { for(i=1;i<=s;i++) print star[i]; for(i=1;i<=n;i++) print lines[i] }'
}

if [ "$direct_run" = "" ]; then
    # 调用 fzf 选择
    selected=$(prepare_targets $last_name $last_type | 
        fzf --height 40% --reverse --prompt='🚀 select run target > ' \
            --header=$' name             type' \
            --header-first \
            --delimiter=$'\t' \
            --with-nth=1,2 \
            --bind 'ctrl-d:reload(prepare_targets)' \
            --ansi \
            --marker='★ ')

    if [[ -z "$selected" ]]; then
        echo "cancel"
        exit 0
    fi

    # 解析选择结果
    IFS=$'\t' read -r marked_name type <<< "$selected"
    name=$(echo "$marked_name" | sed 's/^..//')
    # 保存记录（无标记）
    echo "$type:$name" > "$LAST_RUN_FILE"
else
    name=$last_name
    type=$last_type
fi


# 执行程序
echo "▶ run $type: $name"
case $type in
  bin)     cargo run --bin "$name" ;;
  example) cargo run --example "$name" ;;
esac