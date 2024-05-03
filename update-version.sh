echo "Hello, World!"

current_yaml=$(git show HEAD:.pipelines/azure.pipelines.yml)
previous_yaml=$(git show HEAD~1:.pipelines/azure.pipelines.yml)

current_version=$(yq '.variables.version' .pipelines/azure.pipelines.yml)
echo "$current_version"
# main_version=$(echo "$main_yaml" | yq eval ".variables.version")

# echo "Current branch version: $current_version"
# echo "Main branch version: $main_version"