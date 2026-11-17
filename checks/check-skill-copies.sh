#!/bin/sh
# The skill sits in three folders because each tool looks in a different one.
set -e
cd "$(dirname "$0")/.."
src=plugins/field-dictionary/skills/field-dictionary
for copy in .claude/skills/field-dictionary .agents/skills/field-dictionary; do
  diff -r "$src" "$copy"
done
echo "All three skill copies match."
