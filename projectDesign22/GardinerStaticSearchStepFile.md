# Installing and configuring staticSearch on Windows

## What to download

### Java JDK
Make sure to download the latest version: https://www.oracle.com/java/technologies/downloads/

### Apache Ant
Download the latest release here: https://ant.apache.org/
You will want to un-zip the folder into an easy to access path.

### Ant Contrib
Pay attention while downloading Ant Contrib, it is downloaded here: https://sourceforge.net/projects/ant-contrib/files/
- There will be a big green button to download cpptasks, ignore this and explore the folder below. Inside you can view all the versions of Ant Contrib, click on the **latest**, non-beta version to download it. 
- Un-zip this download into your designated ant folder. 
- Look inside of the ant-contrib folder for a `.jar` file, copy this into the `lib/` folder in your designated Ant file path.

### Static Search 
- You will want to clone the staticSearch github repository to your Github file directory. 
- Access it here: https://github.com/projectEndings/staticSearch

## Testing that everything is downloaded

### Java
- In your command line shell, enter `java -version` (This will work in Command Prompt or Git Bash Shell
- This should give you the java version you have downloaded. 
- Run `which java` in Git Bash Shell, this will return the file path that java is in. 

### Ant
- In your **Git Bash Shell** you can run the commands `which ant` and `ant -v`. 
- This will return you with the filepath ant is located in and the version of ant you have installed.
- The Ant filepath should take you down into the bin folder and to a file called `ant`.
- You may notice this `Buildfile: build.xml does not exist! Build failed` This is normal and nothing to worry about.

## Setting Environment Variables
 - First you need to get there and to do that search your computer for **Environment Variables**. 
 - This will open a window called **System Properties**, go to advanced, and click on **Environment Variables**.
 - You will want to add new variables in the box labled **System Variables**.

### Ant Home
- Add a new variable
- Call it `ANT_HOME` 
- Set the value as the file path to Apache Ant.
- Make sure the file path is formated to Windows. The file path that you are returned in the Git Bash shell is formated to Linux.

### Java Home
- Add a new variable
- Call it `JAVA_HOME` 
- Set the value as the file path to the latest install of JDK.
- Make sure the file path is formated to Windows. The file path that you are returned in the Git Bash shell is formated to Linux.

### Path 
- In your system variables there should already exist a variable called `PATH`. Click edit.
- In this new window you will want to add two new variables.
- One for Ant called `%ANT_HOME%\bin`.
- And one for Java called `%JAVA_HOME%\bin`. Click Ok and you can close the Environment Variables window.

## WSL
### The Install Process
- Open either Windows Command Shell or PowerShell as an **Administrator** 
- Run the command `wsl --install`. This will install Ubuntu
- Once the install is complete you will have to restart your computer to run Ubuntu.
- You will be prompted to create a username and password for WSL, do this and remember it.
- Additional information: https://learn.microsoft.com/en-us/windows/wsl/install

### Configuring 
- WSL creates its own file system so you will need to configure java in this environment as well. 
- You can check if java is there using `java -version` but it most likely isn't.
- Run this to install Java JDK: `sudo apt install default-jdk`
- If you run the `java -version` command again you should be returned with the java version that is now installed.

**Finding Javas file path**

- You can use `cd` and `ls` commands to search for your Java installation.
- Remember this file path as you will want to use it later.

**Finding your Ant installation from Linux**
- You will want to start your file path search with `/mnt/c/`. This will jump into your C: drive on your windows computer. You can look to where you installed Ant from here.
- Remember your ant file path.
- Additional information about working across Windows and Linux: https://learn.microsoft.com/en-us/windows/wsl/filesystems

### Setting Environment Variables inside WSL
This will be similar to the Environment Variables that you set in Windows but you will be editing it in the Ubuntu command line.
- Enter this command to edit your environmental variables: `sudo nano /etc/environment`
- You will want to set `JAVA_HOME` and `ANT_HOME`. 
- For `JAVA_HOME` you will use Java JDK that you installed in Ubuntu. What you enter will look similar to this:
```
JAVA_HOME="/usr/lib/java"
```
- adding ANT_HOME will be similar, but you will want to use `/mnt/c/` at the begining of the file path. 
- It should look something like this:
```
ANT_HOME="/mnt/c/users/JoeyGardiner/Documents/ant/apache-ant-1.10.12"
```
We will want to be able to navigate easily over to our staticSearch repository and run ant. To do this you can create aliases. These will go in the same location as the Environmental Variables. It should look something like this now:
```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
JAVA_HOME="/usr/lib/java"
ANT_HOME="/mnt/c/users/JoeyGardiner/Documents/ant/apache-ant-1.10.12"

alias GitHub="cd /mnt/c/users/JoeyGardiner/Documents/GitHub"
alias static="cd /mnt/c/users/JoeyGardiner/Documents/GitHub/staticSearch"
alias ant="$ANT_HOME/bin/ant"
```
To save and exit, press `F3` and then `Enter`, this saves. To exit press `Control` and `x` at the same time.
Now you are back at the command line, you will need to refresh. 
- Enter: `source /etc/environment` to refresh.

**Testing it**
- Navigate to your staticSearch repo, and run: `ant`
- If this runs and builds without error you can view the results in the `/test` directory on one of the HTML pages. 

## If you have a space in your user file name
My user file path actually looks like this: `/mnt/c/users/Joey Gardiner/Documents/GitHub/staticSearch` I excluded the space because the previosus steps work when there are no space characters. If there is a space character this is what you will have to do. 
- In Ubuntu you will have to install ant and ant-contrib. This is simple, just run: `sudo apt install ant` and then `sudo apt install ant-contrib`. 
- Using `cd` and `ls` find out where ant was installed. It is most likely in `/usr/share`
- Update your Environmental Variables, It should look something like this: `ANT_HOME="/usr/share/ant"`
- Save this using `F3` then `Enter` and exit using `Control` and `x`.

### Cloning staticSearch repo into Ubuntu

- You will want to clone the staticSearch repo where you want, I think the easiest place to access it is in home. Enter `cd ` to get there. 
- Then clone the repo here using: `git clone repoAddress` 
- Access the GitHub repository: https://github.com/projectEndings/staticSearch
- Additional Information about Git in Ubuntu: https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-git

### Final Test

- Time to see if everything is in place
- Navigate to your staticSearch repo in Ubuntu.
- Run the `ant` command to start a Build and wait for it to finish. 
- It should read **BUILD SUCCESSFUL** at the end.

### Running the test site from Ubuntu
- Navigate into the `/test` folder from staticSearch.
- Try running: `python -m http.server 8000` This will start up a local server. If it does not recognize python as a command but mentions `python3` try running this instead: `python3 -m http.server 8000`
- If it works, go to your browser and enter `localhost:8000`

At this point you are working entirely in Ubuntu and you have a successful test staticSearch system. Try searching for a few things and see what you get back.
- To stop running the server you can just close the Ubuntu Shell window.
