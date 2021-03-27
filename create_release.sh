#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 VERSION" 1>&2
  echo "Example: $0 1.0.0" 1>&2
  exit 1
fi

RELEASE_VERSION=$1
GIT_TAG=release-$RELEASE_VERSION

if git tag -l | grep -q $GIT_TAG; then
  echo "ERROR: Tag $GIT_TAG already exists locally" 1>&2
  exit 1
fi

if git ls-remote --tags origin | grep -q $GIT_TAG; then
  echo "ERROR: Tag $GIT_TAG already exists on origin" 1>&2
  exit 1
fi

echo "Generating CHANGELOG.md..."
git-chglog --tag-filter-pattern "release-.*" --next-tag $GIT_TAG -o CHANGELOG.md
git add CHANGELOG.md
git commit -m "Update CHANGELOG for release $RELEASE_VERSION"

echo "Tagging source control with tag $GIT_TAG..."
git tag -a $GIT_TAG -m "Tag for release $RELEASE_VERSION"

echo "Pushing changes to origin..."
git push origin --follow-tags
