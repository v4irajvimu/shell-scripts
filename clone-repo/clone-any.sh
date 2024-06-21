echo -e "============================================================"
echo -e "Clone a repository with symlinks on Windows"
echo -e "============================================================"

echo -e "\n🚀 Executing command: \e[32mexport MSYS=winsymlinks:nativestrict\e[0m"
echo "It changes the behavior of how symbolic links are created within the MSYS2 environment"
export MSYS=winsymlinks:nativestrict

echo -e "\n============================================================"
echo -e "Please enter the repository URL:"
read REPO_URL

echo -e "\n============================================================"
echo -e "🚀 Validating the repository URL..."
if git ls-remote "$REPO_URL" > /dev/null 2>&1; then
    echo -e "\nValid repository URL."

    echo -e "\n============================================================"
    echo -e "🚀 Executing command: \e[32mgit clone -c core.symlinks=true $REPO_URL\e[0m"
    git clone -c core.symlinks=true "$REPO_URL"

    echo -e "\n============================================================"
    echo -e "🎉 \e[32mCloned successfully\e[0m 🎉"
    echo -e "============================================================"
else
    echo -e "\n============================================================"
    echo -e "❌ Invalid repository URL or you do not have the necessary permissions to access it."
    echo -e "============================================================"
    
fi


