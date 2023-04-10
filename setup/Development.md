Expertiza Development Environment
=================================

## Follow these steps to set up Expertiza on your VCL image:

1. Reserve the VCL Image, `CSC-517 Expertiza Development Environment`

2. Copy the `/root/setup_expertiza.sh` script to your home directory.

   ```bash 
   sudo cp /root/setup_expertiza.sh ~/setup_expertiza.sh
   ```
   
3. Make the script executable.
   ```bash
   sudo chmod +x setup_expertiza.sh
   ```
4. Run the script.
   ```bash
   ./setup_expertiza.sh
   ```
5. Enter the GitHub repository URL when prompted. The script will ask for the URL of the project you want to work on.
6. Choose the project type when prompted. Select either `Refactoring` or `Reimplementation`.
7. Wait for the setup process to finish. Once complete, close all the terminals.
8. Update the username in the `config/database.yml` file. Change the `username` value from `root` to `dev` on line 4:
   ```sql
   username: dev
   ```
9. Change directory to your project
   ```bash
   cd <project_dir>
   ```
10. Run the database migration
    ```bash
    rake db:migrate
    ```
## Work on the local application

1. Login to the MySQL database using:
   ```bash
   mysql -u dev -proot
   ```
2. Then run these SQL commands to see the available user logins:
   ```sql
   show databases;
   use expertiza_development;
   select name, role_id from users limit 25;
   ```
3. Use the name from the `users` table according to the role and use this `name` to login with password being `password` for all users.

## Access installation of Expertiza from outside the VCL (Optional)
```bash
iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8080 -j ACCEPT
ufw allow 8080 # (run again if it fails)
ufw reload
rails s -p 8080 -b <IP address of VCL>
```

Verify the Expertiza installation
Open up Google Chrome and type in the URL: `<IP address of VCL>:8080`

That's it! You've successfully set up Expertiza on your VCL image and can start working on your project.
