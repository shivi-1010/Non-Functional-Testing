import mysql.connector

# Connect to the DB
mydb =  mysql.connector.connect(
    host = "192.168.33.30",
    user = "root",
    password = "root",
    database = "hospital"
)

# Define DB cursor
mycursor = mydb.cursor()

for i in range(1000):
    query = """
       INSERT INTO doctor (dname, demail, password, address, phoneno, gender, specilist, dimage)
VALUES('Dr. John','docjohn@gmail.com','password', '456 Avenue, City', '0987654321', 'Male','ear surgeon', 'dr_john.jpg');
    """
    mycursor.execute(query)
    mydb.commit()

mycursor.execute("SELECT * FROM doctor")
result = mycursor.fetchall()

for table in result:
    print(table)
