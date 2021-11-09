#! /bin/sh
echo -e "\e[1;33m start deploying \e[0m"

# push to username.github.io repo
hugo -t hello-friend                    # builds the static site to /public
cd public                               # go to /public directory
git checkout main                       # switch to main branch
git add .                               # add all the generated files
message="feat: rebuild site on `date`"  # commit the generated files
git commit -m "$message"
git push origin main                    # push the commit to origin main branch

# push to portfolio repo
cd ..                                   # move back to root project directory
git checkout master                     # switch to master branch
git add content/ public/                # add new contents & rebuilt site
git commit -m "$message"                # commit the changes
git push origin master                  # push the commit to origin master branch

echo -e "\e[1;32m finished deploying \e[0m"