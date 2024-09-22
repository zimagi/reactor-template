"""
NOTE:
    the below code maintains the Base Reactor Cluster
    CookieCutter Django project initialization

    * It managed the OS license and community files
    * It sets local environment variables

"""
import os
import random
import string


TERMINATOR = "\x1b[0m"
WARNING = "\x1b[1;33m [WARNING]: "
INFO = "\x1b[1;33m [INFO]: "
HINT = "\x1b[3;33m"
SUCCESS = "\x1b[1;32m [SUCCESS]: "


def generate_random_string(length, using_digits=True, using_ascii_letters=True):
  symbols = []

  if using_digits:
    symbols += string.digits
  if using_ascii_letters:
    symbols += string.ascii_letters

  return "".join([random.choice(symbols) for _ in range(length)])


def remove_open_source_files():
  file_names = ["LICENSE"]
  for file_name in file_names:
    os.remove(file_name)

def save_secret_environment():
  secret_template_file = os.path.join('env', 'secret.sh')
  secret_env_file = os.path.join('env', 'local', 'secret.sh')
  secret_script = ""

  with open(secret_template_file, "r+") as file:
    secret_script = file.read()
    os.remove(secret_template_file)

  with open(secret_env_file, "w+") as file:
    file.writelines(secret_script.format(
      secret_key=generate_random_string(10,
        using_ascii_letters=True,
        using_digits=False
      ),
      long_secret_key=generate_random_string(20,
        using_ascii_letters=True,
        using_digits=False
      ),
      password=generate_random_string(10,
        using_ascii_letters=True,
        using_digits=True
      ),
      strong_password=generate_random_string(15,
        using_ascii_letters=True,
        using_digits=True
      )
    ))


def main():
  save_secret_environment()

  if "{{ cookiecutter.open_source_license }}" == "none":
    remove_open_source_files()

  print(SUCCESS + "Project initialized." + TERMINATOR)


if __name__ == "__main__":
  main()
