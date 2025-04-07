import pyodbc 
from pathlib import Path
current_dir = Path(__file__).resolve().parent



con_str = "DRIVER={SQL SERVER};SERVER=NURLAN;DATABASE=class2;Trusted_Connection=yes"

con = pyodbc.connect(con_str)
cursor = con.cursor()

cursor.execute("select * from photos")
row = cursor.fetchone()
image_id, image_data = row 

with open('apple_saved.png','wb') as f:
    f.write(image_data)