echo "Hello, World!"

# current_yaml=$(git show HEAD:.pipelines/azure.pipelines.yml)
# previous_yaml=$(git show HEAD~1:.pipelines/azure.pipelines.yml)

current_version=$(yq '.variables.version' .pipelines/azure.pipelines.yml)
echo "current version: $current_version"

git stash
git checkout HEAD~1
previous_version=$(yq '.variables.version' .pipelines/azure.pipelines.yml)
echo "previous version: $previous_version"

git checkout HEAD

if [ "$previous_version" == "$current_version" ]; then
    echo "have to update version now"
else
    echo "no need to update"
fi

# main_version=$(echo "$main_yaml" | yq eval ".variables.version")

# echo "Current branch version: $current_version"
# echo "Main branch version: $main_version"