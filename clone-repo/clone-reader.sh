echo -e "============================================================"
echo -e "Clone ereader repository with symlinks on Windows"
echo -e "============================================================"

echo -e "\n🚀 Executing command: \e[32mexport MSYS=winsymlinks:nativestrict\e[0m"
echo "It changes the behavior of how symbolic links are created within the MSYS2 environment"
export MSYS=winsymlinks:nativestrict


echo -e "\n============================================================"
echo -e "🚀 Validating the repository URL..."
if git ls-remote git@github.com:wiley/ereader.git > /dev/null 2>&1; then
    echo -e "\nValid repository URL."
    echo -e "🚀 Executing command: \e[32m git clone -c core.symlinks=true git@github.com:wiley/ereader.git \e[0m"
    git clone -c core.symlinks=true git@github.com:wiley/ereader.git

    echo -e "\n============================================================"
    echo -e "🎉 \e[32mCloned successfully\e[0m 🎉"
    echo -e "============================================================"
else
    echo -e "\n============================================================"
    echo -e "❌ Invalid repository URL or you do not have the necessary permissions to access it."
    echo -e "============================================================"
    
fi


