#!/bin/bash

# Function to set AWS_PROFILE persistently
set_aws_profile_persistent() {
    local profile=$1
    local shell_rc=""
    
    # Determine which shell RC file to use
    if [[ -f "$HOME/.bashrc" ]]; then
        shell_rc="$HOME/.bashrc"
    elif [[ -f "$HOME/.bash_profile" ]]; then
        shell_rc="$HOME/.bash_profile"
    elif [[ -f "$HOME/.profile" ]]; then
        shell_rc="$HOME/.profile"
    else
        echo "❌ Could not find shell profile file (.bashrc, .bash_profile, or .profile)"
        return 1
    fi
    
    # Remove any existing AWS_PROFILE export line
    sed -i '/^export AWS_PROFILE=/d' "$shell_rc"
    
    # Add the new AWS_PROFILE export
    echo "export AWS_PROFILE=$profile" >> "$shell_rc"
    
    # Also set it for current session
    export AWS_PROFILE=$profile
    
    echo -e "✅ AWS_PROFILE set to \e[32m$profile\e[0m in $shell_rc"
    echo -e "✅ AWS_PROFILE set to \e[32m$profile\e[0m for current session"
}

# Function to show current AWS profile status
show_aws_status() {
    echo -e "\n============================================================"
    echo -e "🔍 Current AWS Profile Status:"
    echo -e "============================================================"
    
    if [[ -n "$AWS_PROFILE" ]]; then
        echo -e "Current session AWS_PROFILE: \e[32m$AWS_PROFILE\e[0m"
    else
        echo -e "Current session AWS_PROFILE: \e[31mNot set\e[0m"
    fi
    
    # Check if AWS_PROFILE is set in shell RC
    local shell_rc=""
    if [[ -f "$HOME/.bashrc" ]]; then
        shell_rc="$HOME/.bashrc"
    elif [[ -f "$HOME/.bash_profile" ]]; then
        shell_rc="$HOME/.bash_profile"
    elif [[ -f "$HOME/.profile" ]]; then
        shell_rc="$HOME/.profile"
    fi
    
    if [[ -n "$shell_rc" ]]; then
        local persistent_profile=$(grep "^export AWS_PROFILE=" "$shell_rc" | cut -d'=' -f2)
        if [[ -n "$persistent_profile" ]]; then
            echo -e "Persistent AWS_PROFILE: \e[32m$persistent_profile\e[0m"
        else
            echo -e "Persistent AWS_PROFILE: \e[31mNot set\e[0m"
        fi
    fi
    
    # Test AWS credentials
    echo -e "\n🔍 Testing AWS credentials..."
    if aws sts get-caller-identity >/dev/null 2>&1; then
        local caller_identity=$(aws sts get-caller-identity --query 'Arn' --output text 2>/dev/null)
        echo -e "✅ AWS credentials are valid"
        echo -e "   Caller: \e[32m$caller_identity\e[0m"
    else
        echo -e "❌ AWS credentials are invalid or expired"
    fi
    echo -e "============================================================"
}

# Show current status at the beginning
show_aws_status

options=("PROD" "NON-PROD" "STATUS" "QUIT")
echo -e "\n============================================================"
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
            echo -e "🚀 Setting AWS_PROFILE to tc-prod persistently"
            set_aws_profile_persistent "tc-prod"

            echo -e "\n============================================================"
            echo -e "🎉 \e[32mYou have successfully logged in to $opt AWS account\e[0m 🎉"
            echo -e "🎉 \e[32mAWS_PROFILE is set to tc-prod and will persist across new terminal sessions\e[0m 🎉"
            echo -e "============================================================"
            
            # Show updated status
            show_aws_status
            break
            ;;
        "NON-PROD")
            echo -e "\n============================================================"
            echo -e "🚀 You will be log in to \e[32m$opt AWS account\e[0m"

            echo -e "\n============================================================"
            echo -e "🚀 Executing command: \e[32maws-azure-login --profile tc-dev --mode=gui\e[0m"
            aws-azure-login --profile tc-dev --mode=gui

            echo -e "\n============================================================"
            echo -e "🚀 Setting AWS_PROFILE to tc-dev persistently"
            set_aws_profile_persistent "tc-dev"

            echo -e "\n============================================================"
            echo -e "🎉 \e[32mYou have successfully logged in to $opt AWS account\e[0m 🎉"
            echo -e "🎉 \e[32mAWS_PROFILE is set to tc-dev and will persist across new terminal sessions\e[0m 🎉"
            echo -e "============================================================"
            
            # Show updated status
            show_aws_status
            break
            ;;
        "STATUS")
            show_aws_status
            ;;
        "QUIT")
            break
            ;;
        *) echo "❌ Invalid option $REPLY";;
    esac
done

