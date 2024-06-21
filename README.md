# shell-scripts

The shell-scripts repository is a versatile collection of bash shell scripts designed to streamline various tasks related to cloud infrastructure management. Whether you’re working with Amazon Web Services (AWS), Microsoft Azure, or need to clone repositories on Windows, these scripts have you covered. Here’s what you’ll find.

## Benefits

- **Time Savings:** Automating repetitive tasks frees engineers to focus on critical work.
- **Easy Maintenance:** Keep your cloud environments consistent as services evolve.
- **Cross-Platform Support:** Whether you’re on AWS, Azure, or Windows, these scripts have you covered.

Feel free to explore the individual scripts within the repository. Happy automating! 🚀

## Configuration Guide.

### Step 1: Clone the Repository

- Open your terminal or command prompt.
- Navigate to the directory where you want to clone the repository. For example
  ```bash
  cd C:\Users\<YOUR_user>\workspace\shared
  ```
- Clone the repository using the following command
  ```bash
  git clone git@github.com:v4irajvimu/shell-scripts.git
  ```

### Step 2: Set Environment Variables

- Open the Start menu and search for “Environment Variables.”
- Click on “Edit the system environment variables.”
- In the “System Properties” window, click the “Environment Variables” button.
- Under “System variables,” find the “Path” variable and click “Edit.”
- Add the following path to the list (adjust it based on your actual directory)
  ```bash
  C:\Users\<YOUR_user>\workspace\shared\shell-scripts\aws-login
  ```

#### AWS and Azure Login Commands

- Follow the same steps as above to open the “Environment Variables” window.
- Add the following path to the “Path” variable
  ```bash
    C:\Users\<YOUR_user>\workspace\shared\shell-scripts\clone-repo
  ```

## For Login Scripts (AWS Azure)

We’ve included login commands for Wiley AWS Azure. Engineers can quickly authenticate to their respective environments without memorizing complex commands. Whether you’re managing EC2 instances, configuring Azure resources, or accessing S3 buckets, these scripts simplify the process.

```bash
source aws-login.sh
```

## Repository Cloning with Symlinks (Windows)

Need to clone a repository? Our scripts handle it seamlessly, even on Windows systems. Plus, they set up symbolic links (symlinks) to avoid duplication and ensure consistent workflows

```bash
# To clone any repository with symlinks. Enter the repository URL during the process
source clone-any.sh

# Clone ereader directky
source clone-reader.sh
```

## Conclusion

Thank you for exploring the _shell-scripts_ repository! By leveraging these scripts, you’ll enhance your productivity, reduce manual effort, and maintain consistency across your cloud environments. Remember to customize the scripts as needed and contribute back to the community by sharing any improvements or additional functionality.

**Feel free to reach out if you have any questions or need further assistance. Happy scripting! 🚀**
