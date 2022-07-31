import unittest
import os
from playsound import playsound

working_dir = os.getcwd()
current_folder = os.path.dirname(os.path.abspath(__file__))


def main():
    loader = unittest.TestLoader()
    suite = loader.discover(find_unit_test_folder(), 
                            top_level_dir=working_dir)
    runner = unittest.TextTestRunner()
    results = runner.run(suite)
    print('')
    last_status = get_status()
    fails = [*results.failures, *results.errors]

    if last_status == 'PASS' and fails:
        playsound(f'{current_folder}/fail.mp3')
        set_status('FAIL')
    elif last_status != 'PASS' and not fails:
        playsound(f'{current_folder}/pass.mp3')
        set_status('PASS')


def find_unit_test_folder():
    found = ''
    for name in os.listdir(working_dir):
        if found:
            break
        if name.startswith('.'):
            continue
        if not os.path.isdir(f'{working_dir}/{name}'):
            continue

        for sub_name in os.listdir(f'{working_dir}/{name}'):
            if sub_name == 'tests':
                found = f'{working_dir}/{name}'
    return f'{found}/tests/unit'



def get_status():
    with open(f'{current_folder}/status', 'r') as status_file:
        status = next(line for line in status_file)
        return status

def set_status(status):
    with open(f'{current_folder}/status', 'w') as status_file:
        status_file.write(status)

main()