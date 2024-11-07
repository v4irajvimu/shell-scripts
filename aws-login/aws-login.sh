options=("PROD" "NON-PROD" "QUIT")
echo -e "============================================================"
echo "Please pick an environment to log in:"
credentials_file="C:\\Users\\vjayasingh\\.aws\\credentials"

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
            echo -e "🚀 Coping configs from tc-prod to default in credentials"
            # Extract values from [tc-dev] section
            aws_access_key_id=$(sed -n '/\[tc-prod\]/,/^\[/ s/^aws_access_key_id\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_secret_access_key=$(sed -n '/\[tc-prod\]/,/^\[/ s/^aws_secret_access_key\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_session_token=$(sed -n '/\[tc-prod\]/,/^\[/ s/^aws_session_token\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_expiration=$(sed -n '/\[tc-prod\]/,/^\[/ s/^aws_expiration\s*=\s*\(.*\)/\1/p' "$credentials_file")

            echo -e "aws_access_key_id: $aws_access_key_id"
            echo -e "\naws_access_key_id: $aws_secret_access_key"
            echo -e "\aws_session_token: $aws_session_token"
            echo -e "\aws_expiration: $aws_expiration"
            # Replace values in [default] section
            sed -i "/\[default\]/,/^\[/ s/aws_access_key_id\s*=.*/aws_access_key_id=$aws_access_key_id/" "$credentials_file"
            sed -i "/\[default\]/,/^\[/ s/aws_secret_access_key\s*=.*/aws_secret_access_key=$aws_secret_access_key/" "$credentials_file"
            # Escape special characters in the aws_session_token value for sed
            escaped_aws_session_token=$(printf '%s\n' "$aws_session_token" | sed -e 's/[\/&]/\\&/g')
            # Replace the aws_session_token value in the [default] section
            sed -i "/\[default\]/,/^\[/ s/aws_session_token\s*=.*/aws_session_token=$escaped_aws_session_token/" "$credentials_file"
            sed -i "/\[default\]/,/^\[/ s/aws_expiration\s*=.*/aws_expiration=$aws_expiration/" "$credentials_file"
            

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
            echo -e "🚀 Coping configs from tc-dev to default in credentials"
            # Extract values from [tc-dev] section
            aws_access_key_id=$(sed -n '/\[tc-dev\]/,/^\[/ s/^aws_access_key_id\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_secret_access_key=$(sed -n '/\[tc-dev\]/,/^\[/ s/^aws_secret_access_key\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_session_token=$(sed -n '/\[tc-dev\]/,/^\[/ s/^aws_session_token\s*=\s*\(.*\)/\1/p' "$credentials_file")
            aws_expiration=$(sed -n '/\[tc-dev\]/,/^\[/ s/^aws_expiration\s*=\s*\(.*\)/\1/p' "$credentials_file")

            echo -e "aws_access_key_id: $aws_access_key_id"
            echo -e "\aws_secret_access_key: $aws_secret_access_key"
            echo -e "\aws_session_token: $aws_session_token"
            echo -e "\aws_expiration: $aws_expiration"
            # Replace values in [default] section
            sed -i "/\[default\]/,/^\[/ s/aws_access_key_id\s*=.*/aws_access_key_id=$aws_access_key_id/" "$credentials_file"
            sed -i "/\[default\]/,/^\[/ s/aws_secret_access_key\s*=.*/aws_secret_access_key=$aws_secret_access_key/" "$credentials_file"
            # Escape special characters in the aws_session_token value for sed
            escaped_aws_session_token=$(printf '%s\n' "$aws_session_token" | sed -e 's/[\/&]/\\&/g')
            # Replace the aws_session_token value in the [default] section
            sed -i "/\[default\]/,/^\[/ s/aws_session_token\s*=.*/aws_session_token=$escaped_aws_session_token/" "$credentials_file"
            sed -i "/\[default\]/,/^\[/ s/aws_expiration\s*=.*/aws_expiration=$aws_expiration/" "$credentials_file"
            
            
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

