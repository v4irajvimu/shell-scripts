echo -e "============================================================"
echo -e "Clone a repository with symlinks on Windows"
echo -e "============================================================"

echo -e "\nExecuting command: export MSYS=winsymlinks:nativestrict"
echo "It changes the behavior of how symbolic links are created within the MSYS2 environment"
export MSYS=winsymlinks:nativestrict

echo -e "\n============================================================"
echo -e "Please enter the repository URL:"
read REPO_URL

echo -e "\n============================================================"
echo -e "Validating the repository URL..."
if git ls-remote "$REPO_URL" > /dev/null 2>&1; then
    echo -e "\nValid repository URL."
    echo "Executing command: git clone -c core.symlinks=true $REPO_URL"
    git clone -c core.symlinks=true "$REPO_URL"

    echo -e "\n============================================================"
    echo -e "🎉 Cloned successfully 🎉"
    echo -e "============================================================"
else
    echo -e "\n============================================================"
    echo -e "❌ Invalid repository URL or you do not have the necessary permissions to access it."
    echo -e "============================================================"
    
fi


