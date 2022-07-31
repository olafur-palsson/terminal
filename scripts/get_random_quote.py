import time
import os

working_dir = os.getcwd()
current_folder = os.path.dirname(os.path.abspath(__file__))


with open(f'{current_folder}/quotes.csv') as content:
    quotes = content.readlines()



now_in_ms = int(round(time.time() * 1000))
DAY_IN_MS = 86.4e6

day = round(now_in_ms / DAY_IN_MS)


psuedo_random_int = hash(day) % len(quotes)
quote_of_the_day = quotes[psuedo_random_int]

q = quote_of_the_day.split(';')
citation = q[0]
annotation = q[1]

print('\n')
print('')
print('Quote of the day:')
print('\n')
print(annotation)
print(f'\t\t{citation}')
print('\n')