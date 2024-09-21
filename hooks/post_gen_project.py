"""
NOTE:
    the below code maintains the Base Reactor Cluster
    CookieCutter Django project initialization

    * It managed the OS license and community files
    * It sets local environment variables

"""
import os


TERMINATOR = "\x1b[0m"
WARNING = "\x1b[1;33m [WARNING]: "
INFO = "\x1b[1;33m [INFO]: "
HINT = "\x1b[3;33m"
SUCCESS = "\x1b[1;32m [SUCCESS]: "


def remove_open_source_files():
  file_names = ["LICENSE"]
  for file_name in file_names:
    os.remove(file_name)


def main():
  if "{{ cookiecutter.open_source_license }}" == "Not open source":
    remove_open_source_files()

  print(SUCCESS + "Project initialized." + TERMINATOR)


if __name__ == "__main__":
  main()