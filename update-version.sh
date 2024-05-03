echo "Hello, World!"

current_yaml=$(git show HEAD:.pipelines/azure.pipelines.yml)
previous_yaml=$(git show HEAD~1:.pipelines/azure.pipelines.yml)

current_version=$(shyaml get-value variables.version < "$current_yaml")
# main_version=$(echo "$main_yaml" | yq eval ".variables.version")

# echo "Current branch version: $current_version"
# echo "Main branch version: $main_version"