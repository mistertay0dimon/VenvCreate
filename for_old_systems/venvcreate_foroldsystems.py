import os
import subprocess
import time
from colorama import Fore, Style, init
init()

def create_virtual_environment():
    try:
        print Fore.GREEN + "VenvCreate 1.1"
        time.sleep(0.01)
        print Style.RESET_ALL
        # Get current directory
        current_dir = os.getcwd()

        # Create directory for virtual environment
        venv_dir = os.path.join(current_dir, ".venv")
        if not os.path.exists(venv_dir):
            os.makedirs(venv_dir)

        # Create Scripts directory
        scripts_dir = os.path.join(venv_dir, "Scripts")
        if not os.path.exists(scripts_dir):
            os.makedirs(scripts_dir)

        # Copying required files
        require_dir = os.path.join(current_dir, "require")
        if not os.path.exists(require_dir):
            raise IOError("require directory not found")

        subprocess.call(['copying.bat'], shell=True)

        if not os.path.exists(os.path.join(scripts_dir, "activate.bat")):
            raise IOError("Failed to copy required files")

        # Test or no
        command = raw_input("Do you want to test this? [y/n]: ").lower()
        if command == "y":
            # Activating environment
            venv_path = os.path.join(current_dir, ".venv")
            activate_script = os.path.join(venv_path, "Scripts", "activate.bat")
            subprocess.call([activate_script], shell=True)
            os.system('cls')
            subprocess.call(["cmd"], shell=True)
            
        elif command == "n":
            print "You can test this:"
            print "set VIRTUAL_ENV_PATH=.venv"
            print "call .venv\\Scripts\\activate"
            print "cmd"
            raw_input("Press Enter to exit...")
        else:
            print "Enter 'y' or 'n'"
            raw_input("Press Enter to exit...")

    except IOError as e:
        print "Error: %s" % e
        raw_input("Press Enter to exit...")
    except Exception as e:
        print "An unexpected error occurred: %s" % e
        raw_input("Press Enter to exit...")

if __name__ == "__main__":
    create_virtual_environment()
