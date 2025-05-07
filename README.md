# VenvCreate
Create a virtual environment with one batch file
# Instructions
For activating this util, click "venvcreate.bat"
If your system is old, run "venvcreate_foroldsystems.py", required Python 2.7.18
# How it work?
First, the project creates a `.venv` directory, and then creates a `Scripts` folder inside it.
Next, the script navigates to the `require` directory and copies the files from there into the `.venv/Scripts` folder.

You will then be prompted to test the environment.
If you press `y`, a command prompt will be activated in the virtual environment.
If you press `n`, you will be shown how to test it later, and then you will be prompted to press any key to exit.
