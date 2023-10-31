import os, platform


def main():
    if platform.system() == "Darwin":
        result = os.system("sh ./rosettaInstaller/install.sh")
        if result != 1:
            print("\n\n", end="\n")
            return "Error. Exiting..."
    else:
        print("This script is designed for MacOS. Using other systems may have unintended effects.")
        return 255

if __name__ == "__main__":
    main()