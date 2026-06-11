# Task.2 :- Write a script that uses the os module to create a new folder named 'MyDownloads' in your current working directory,
# then print the absolute path of the new folder.

# Doubt
import os

folder_name = "My Downloads"

os.makedirs(folder_name, exist_ok=True)

absolute_path = os.path.abspath(folder_name)

print("Folder created at:")
print(absolute_path)

# path - "C:\PYTHON\My Downloads"