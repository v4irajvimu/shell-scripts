# Prompt user for inputs
read -p "Enter the LATEST_RELEASE_TAG: " LATEST_RELEASE_TAG
read -p "Enter the LAST_PROD_RELEASE_TAG: " LAST_PROD_RELEASE_TAG

# Define color codes for better visibility on dark backgrounds
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Echo the rollback steps with colors
echo -e "${CYAN}# Rollback Steps${NC}"

echo -e "${YELLOW}## Steps${NC}"

echo -e "${BLUE}1. Creating a backup from main${NC}"
echo -e "${WHITE}   git branch main-backup-v$LATEST_RELEASE_TAG${NC}"
echo

echo -e "${BLUE}2. Last prod release v$LAST_PROD_RELEASE_TAG and resetting to that tag${NC}"
echo -e "${WHITE}   git reset --hard v$LAST_PROD_RELEASE_TAG${NC}"
echo -e "${WHITE}   git push --force origin main${NC}"
echo

echo -e "${BLUE}3. Create a branch and merge to main to trigger a pipeline${NC}"
echo -e "${WHITE}   git checkout -b rollback/v$LAST_PROD_RELEASE_TAG${NC}"
echo

echo -e "${BLUE}4. Restore things${NC}"
echo -e "${WHITE}   git checkout main${NC}"
echo -e "${WHITE}   git reset --hard main-backup-v$LATEST_RELEASE_TAG${NC}"
echo -e "${WHITE}   git push --force origin main${NC}"
echo

echo -e "${BLUE}5. Delete the backup branch${NC}"
echo -e "${WHITE}   git branch -d main-backup-v$LATEST_RELEASE_TAG${NC}"
echo -e "${WHITE}   git push origin --delete main-backup-v$LATEST_RELEASE_TAG${NC}"
echo

# Notify user
echo -e "${CYAN}Rollback steps have been displayed successfully.${NC}"