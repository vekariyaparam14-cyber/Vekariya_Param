# Task.3 :- Use the datetime module to get the current date and time, then format and print it as 'DD-MM-YYYY HH:MM:SS', 
# similar to how WhatsApp shows message timestamps.
# Hint: Use strftime() to format the output.

import datetime

current_time = datetime.datetime.now()
current_date = datetime.date.today()

print(current_date)
print(current_time)