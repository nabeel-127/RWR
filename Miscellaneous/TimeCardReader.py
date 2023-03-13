import csv
import glob
import os


# print(os.listdir())
os.chdir("Miscellaneous/")

# csv_files = glob.glob("Miscellaneous/Time Card_*_export.csv")
csv_files = glob.glob("Time Card_*_export.csv")
print(csv_files)
# Loop through each CSV file and read the data
for filename in csv_files:
	print(filename)
	with open(filename) as csvfile:
		reader = csv.reader(csvfile)
		print(reader)
		for i, row in enumerate(reader):
			# Process the row
			if i != 0:
				print(row)