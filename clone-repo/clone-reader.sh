echo -e "============================================================"
echo -e "Clone ereader repository with symlinks on Windows"
echo -e "============================================================"

echo -e "\nExecuting command: export MSYS=winsymlinks:nativestrict"
echo "It changes the behavior of how symbolic links are created within the MSYS2 environment"
export MSYS=winsymlinks:nativestrict


echo -e "\n============================================================"
echo -e "Validating the repository URL..."
if git ls-remote git@github.com:wiley/ereader.git > /dev/null 2>&1; then
    echo -e "\nValid repository URL."
    echo "Executing command: git clone -c core.symlinks=true git@github.com:wiley/ereader.git"
    git clone -c core.symlinks=true git@github.com:wiley/ereader.git

    echo -e "\n============================================================"
    echo -e "🎉 Cloned successfully 🎉"
    echo -e "============================================================"
else
    echo -e "\n============================================================"
    echo -e "❌ Invalid repository URL or you do not have the necessary permissions to access it."
    echo -e "============================================================"
    
fi


