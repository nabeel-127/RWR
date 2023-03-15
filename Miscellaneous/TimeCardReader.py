import csv
import glob
import tkinter as tk
import os

data = []

def parseFile():
	# os.chdir("Miscellaneous/")
	csv_files = glob.glob("Miscellaneous/Time Card_*_export.csv")
	print(csv_files)
	for filename in csv_files:
		with open(filename) as csvfile:
			reader = csv.reader(csvfile)
			print(reader)
			for i, row in enumerate(reader):
				if i != 0:
					data.append(row)
	


parseFile()
data = [[row[3], row[4], row[5]] for row in data if len(row) >= 6]
print(" ")
print(data)

main = tk.Tk()
main.title('Hello')

# button = tk.Button(main, text = 'Stop', width = 25, height = 15, command = main.destroy)
# button.pack()
main.mainloop()



# # print(os.listdir())
# os.chdir("Miscellaneous/")

# # csv_files = glob.glob("Miscellaneous/Time Card_*_export.csv")
# csv_files = glob.glob("Time Card_*_export.csv")
# print(csv_files)
# # Loop through each CSV file and read the data
# for filename in csv_files:
# 	print(filename)
# 	with open(filename) as csvfile:
# 		reader = csv.reader(csvfile)
# 		print(reader)
# 		for i, row in enumerate(reader):
# 			# Process the row
# 			if i != 0:
# 				print(row)