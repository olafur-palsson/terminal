import os
import sys
from playsound import playsound

working_dir = os.getcwd()
current_folder = os.path.dirname(os.path.abspath(__file__))


def main():
    try:
        last_status = get_status()
    except:
        last_status = 'PASS'
    fails = any(map(lambda arg: arg == '-f', sys.argv))
    if last_status == 'PASS' and fails:
        playsound(f'{current_folder}/fail.mp3')
        set_status('FAIL')
    elif last_status != 'PASS' and not fails:
        playsound(f'{current_folder}/pass.mp3')
        set_status('PASS')

def get_status():
    with open(f'{current_folder}/status', 'r') as status_file:
        status = next(line for line in status_file)
        return status

def set_status(status):
    with open(f'{current_folder}/status', 'w') as status_file:
        status_file.write(status)

main()
