
## declare an array variable
declare -a arr=("hiteshmittal1990@gmail.com", "hitmit@test.com")

## now loop through the above array
for i in "${arr[@]}"
do
    git filter-branch --env-filter '

    CORRECT_NAME="Boris Smirnov"
    CORRECT_EMAIL="bsmirnov@nih.gov"

    OLD_EMAIL='"$i"'
    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -f

    # or do whatever with individual element of the array
done
