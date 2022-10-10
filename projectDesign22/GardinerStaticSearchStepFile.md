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
```java file path in Ubuntu```


