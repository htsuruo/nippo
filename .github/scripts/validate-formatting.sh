#!/bin/bash
if [[ $(git ls-files '*.dart' --modified) ]]; then
  echo ""
  echo ""
  echo "These files are not formatted correctly:"
  i=0
  for f in $(git ls-files '*.dart' --modified); do
    if [[ $f == *lib/firebase_options* ]] ; then
      continue
    fi
    if [[ $f == *.freezed.dart ]] ; then
      continue
    fi
    if [[ $f == *.g.dart ]] ; then
      continue
    fi
    if [[ $f == *.gen.dart ]] ; then
      continue
    fi
    i=$((i+1))
    echo ""
    echo ""
    echo "-----------------------------------------------------------------"
    echo "$f"
    echo "-----------------------------------------------------------------"
    echo ""
    git --no-pager diff --unified=0 --minimal $f
    echo ""
    echo "-----------------------------------------------------------------"
    echo ""
    echo ""
  done
  if [[ $i == 0 ]]; then
    echo ""
    echo "✅ All files are formatted correctly."
    exit 0
  fi
  if [[ $GITHUB_WORKFLOW ]]; then
    git checkout . > /dev/null 2>&1
  fi
  echo ""
  echo "❌ Some files are incorrectly formatted, see above output."
  echo ""
  echo "To fix these locally, run Dart formatter."
  exit 1
else
  echo ""
  echo "✅ All files are formatted correctly."
fi