# for defining
calculate_new_version(){
    IFS="." read -a array <<< $1
    echo array[2]
}

# for calling
echo "Hello, World!"

# current_yaml=$(git show HEAD:.pipelines/azure.pipelines.yml)
# previous_yaml=$(git show HEAD~1:.pipelines/azure.pipelines.yml)

current_version=$(yq '.variables.version' .pipelines/azure.pipelines.yml)
echo "current version: $current_version"

git config --global advice.detachedHead false

git stash
git checkout HEAD~1
previous_version=$(yq '.variables.version' .pipelines/azure.pipelines.yml)
echo "previous version: $previous_version"

git checkout HEAD

if [ "$previous_version" == "$current_version" ]; then
    echo "versions match, have to update now"
    new_version=$(calculate_new_version $current_version)
else
    echo "version already updated, no need to update further"
fi

# main_version=$(echo "$main_yaml" | yq eval ".variables.version")

# echo "Current branch version: $current_version"
# echo "Main branch version: $main_version"