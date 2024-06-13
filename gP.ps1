param(
  [Parameter(Mandatory=$true)]
  [string] $commitMessage
)

git add -A

git commit -m $commitMessage
  
git push -u origin --all

