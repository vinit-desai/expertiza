Expertiza Development Environment
=================================

## Follow these steps to set up Expertiza on your VCL image:

1. Reserve the VCL Image, `CSC-517 Expertiza Development Environment`

1. Copy the `/root/setup_expertiza.sh` script to your home directory.

   ```bash 
   sudo cp /root/setup_expertiza.sh ~/setup_expertiza.sh
   ```
   
2. Make the script executable.
   ```bash
   sudo chmod +x setup_expertiza.sh
   ```
3. Run the script.
   ```bash
   ./setup_expertiza.sh
   ```
4. Enter the GitHub repository URL when prompted. The script will ask for the URL of the project you want to work on.
5. Choose the project type when prompted. Select either `Refactoring` or `Reimplementation`.
6. Wait for the setup process to finish. Once complete, close all the terminals.
7. Update the username in the `config/database.yml` file. Change the `username` value from `root` to `dev` on line 4:
   ```sql
   username: dev
   ```

That's it! You've successfully set up Expertiza on your VCL image and can start working on your project.
