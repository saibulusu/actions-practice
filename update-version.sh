echo "Hello, World!"

# current_yaml=$(git show HEAD:.pipelines/azure.pipelines.yml)

# main_yaml=$(git show origin/main:.pipelines/azure.pipelines.yml)

# current_version=$(echo "$current_yaml" | yq eval ".variables.version")
# main_version=$(echo "$main_yaml" | yq eval ".variables.version")

# echo "Current branch version: $current_version"
# echo "Main branch version: $main_version"