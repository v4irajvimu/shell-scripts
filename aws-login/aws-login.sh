options=("PROD" "NON-PROD" "QUIT")
echo -e "============================================================"
echo "Please pick an environment to log in:"
select opt in "${options[@]}"
do
    case $opt in
        "PROD")
            echo -e "\n============================================================"
            echo -e "🚀 You will be log in to \e[32m$opt AWS account\e[0m"

            echo -e "\n============================================================"
            echo -e "🚀 Executing command: \e[32maws-azure-login --profile tc-prod --mode=gui\e[0m"
            aws-azure-login --profile tc-prod --mode=gui

            echo -e "\n============================================================"
            echo -e "🚀 Executing command: \e[32mexport AWS_PROFILE=tc-prod\e[0m"
            export AWS_PROFILE=tc-prod

            echo -e "\n============================================================"
            echo -e "🎉 \e[32mYou have successfully logged in to $opt AWS account\e[0m 🎉"
            echo -e "============================================================"
            break
            ;;
        "NON-PROD")
            echo -e "\n============================================================"
            echo -e "🚀 You will be log in to \e[32m$opt AWS account\e[0m"

            echo -e "\n============================================================"
            echo -e "🚀 Executing command: \e[32maws-azure-login --profile tc-dev --mode=gui\e[0m"
            aws-azure-login --profile tc-dev --mode=gui

            echo -e "\n============================================================"
            echo -e "🚀 Executing command: \e[32mexport AWS_PROFILE=tc-dev\e[0m"
            export AWS_PROFILE=tc-dev

            echo -e "\n============================================================"
            echo -e "🎉 \e[32mYou have successfully logged in to $opt AWS account\e[0m 🎉"
            echo -e "============================================================"
            break
            ;;
        "QUIT")
            break
            ;;
        *) echo "❌ Invalid option $REPLY";;
    esac
done

