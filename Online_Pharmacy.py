from random import *

import mysql.connector
db = mysql.connector.connect(host = 'localhost', 
                               password = 'suyash', 
                               user = 'root',
                               database = 'pharmacy_store')
cursor = db.cursor()

print("Welcome to Online Pharmacy!")

dict_pass = {"Suyash" : "suyash123","a" : "a"}
medicines = []
reviews = []



def main_func():
    while True: 
        print("1. Enter as Admin")
        print("2. Enter as a Customer\n3. Reviews\n4. Back")

        choice = int(input("Enter your coice: "))
        if (choice == 1):
            admin()

        elif (choice == 2):
            customer()
        elif (choice == 4):
            int_main()
        elif (choice == 3):
            review()
        
        else:
            print("Wrong choice.")
            print("Try Again!!")
            continue

def review():

    while True:
        review = input("Enter your review: ")
        rating = input("Enter your rating out of 5 Stars: ")

        reviews.append((review, rating))

        choice = input("Do you want to add another review? (Y/N): ")
        if choice.lower() != "y":
            break

    print("\nAll Reviews:")
    for i, (review, rating) in enumerate(reviews):
        print(f"Review {i+1}: {review}")
        print(f"Rating: {len(rating)}/5")
    print("\n")

def admin():

    query1 = '''
SELECT BILL.DRUG_ID AS ID, MEDICINE_DETAILS.MFG_DATE,
MEDICINE_DETAILS.EXPIRY_DATE,
MEDICINE_DETAILS.SUPPLIER
FROM MEDICINE_DETAILS
LEFT JOIN BILL
ON MEDICINE_DETAILS.DRUG_ID = BILL.DRUG_ID
ORDER BY EXPIRY_DATE;
    '''

    olap1 = '''
SELECT COUNT(Position),Position,city
FROM employee
GROUP BY Position,city WITH ROLLUP
ORDER BY Position DESC;
        
    '''

    olap2 = '''
SELECT s.Medicine_Name, SUM(Total_sales) AS sales
FROM sales_details s
JOIN medicine_details M ON s.DRUG_ID = M.DRUG_ID
WHERE (date BETWEEN '2021-11-23' AND '2022-09-02')
GROUP BY s.Medicine_Name WITH ROLLUP
ORDER BY s.Medicine_Name;
    '''

    olap3 = '''
SELECT  COUNT(Medicine_Name),Medicine_Name,date
from sales_details 
where (Total_sales>200) 
AND (date between '2021-01-01' and '2023-02-02') 
group by Medicine_Name,date WITH ROLLUP
 ORDER BY Medicine_Name ;   
    '''

    olap4 = '''
SELECT medicine_details.SUPPLIER,Name_of_drug, SUM(medicine_details.QUANTITY)
FROM medicine_details
group by SUPPLIER,NAME_OF_DRUG WITH ROLLUP
ORDER BY SUPPLIER  DESC;
    '''

    while True:

        print("1. Show Patient Details \n2. Sales Details Between Two Dates\n3. Update Stock")
        print("4. Olap-1(Number of Employees from different departement and cities)\n5. Olap-2(Medicines details sold between particular dates)\n6. Olap-3(Count of medicines sold between two particular dates)\n7. Olap-4(Quantity of medicines per Supplier)\n8. Prescription Details")
        print("9. Details of medicines ordered recently\n10. Update Employee Position\n11. Back ")
        choice = int(input("Enter your choice: "))

        if (choice == 1):
            pid = int(input("PID: "))
          
            cursor.execute("SELECT * FROM PATIENT WHERE PID = %s ", (pid,))
            res = cursor.fetchall()
            
            print("{:<15} {:<15} {:<10} {:<10} {:<25} {:<15}".format("First Name", "Last Name","PID","Age","Email","Phone No"))
            
            for x in res:
                
                print("{:<15} {:<15} {:<10} {:<10} {:<25} {:<15}".format(x[0], x[1],x[2],x[3],x[4],x[5]))
            print()

        elif (choice == 2):
            date1 = input("Enter starting Date: ")
            date2 = input("Enter ending Date: ")

            print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} ".format("Invoice Id","Drug Id" ,"Date","Time","Quantity","Sales Cost"))

            
            cursor.execute("SELECT Invoice_Id, Drug_Id, Date, Time, Total_quantity, Total_sales FROM SALES_DETAILS WHERE (Date BETWEEN %s AND %s)", (date1, date2,))

            res = cursor.fetchall()
            
            for x in res:
        
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format(*values))
            print('\n')

        elif(choice == 3):
            drug_id = int(input("Enter Drug_ID of the Med to be Updated: "))
            up_qunt = int(input("Enter updated quantity: "))
            up_price= int(input("Enter updated price: "))

            cursor.execute("UPDATE medicine_details set QUANTITY = %s, PRICE = %s WHERE DRUG_ID = %s;",(up_qunt,up_price,drug_id))
            db.commit()

            print("{:<25} {:<15} {:<30} {:<30} {:<25} {:<15} {:<15}".format("Drug Name", "Drug ID","MFG Date","Exp Date","Supplier","Quanity", "Price"))
            
            cursor.execute("SELECT * FROM medicine_details where Drug_id = %s ",(drug_id,))
            res = cursor.fetchall()
            for x in res:
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<25} {:<15} {:<30} {:<30} {:<25} {:<15} {:<15}".format(*values))
           
        elif (choice == 4):
            cursor.execute(olap1)
            res = cursor.fetchall()
            print("{:<20} {:<20} {:<30}".format("Count(Position)", "Position", "City"))
            for x in res:
                # print("{:<20} {:<20} {:<20}".format(x[0], x[1], x[2]))
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<20} {:<20} {:<30} ".format(*values))
            print("\n")

        elif (choice == 5):
            cursor.execute(olap2)
            res = cursor.fetchall()
            print("{:<50} {:<50} ".format("Drug_Name","Sales"))

            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<50} {:50} ".format(*values))

            print("\n")

        elif (choice == 6):
            cursor.execute(olap3)
            res = cursor.fetchall()

            print("{:<10} {:<50} {:<30}".format("Count","Drug_Name","Date_Time"))

            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<10} {:<50} {:<30}".format(*values))

            print("\n")

        elif (choice == 7):
            cursor.execute(olap4)
            res = cursor.fetchall()

            print("{:<20} {:<20} {:<20}".format("Supplier","Drug_Name","Quanity"))
            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                # print("{:<20} {:<20} {:<20}".format(x[0],x[1],x[2]))
                print("{:<20} {:<20} {:<20}".format(*values))
            print("\n")

        elif (choice == 8):
            n4 = int(input("Pres_ID: "))
            print("\n")
            cursor.execute( "SELECT * FROM prescription WHERE PRESCRIPTION_ID = %s", (n4,))
            res = cursor.fetchall()
            print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format("Doc_Name", "Hospital","Patient","Prescription_Id","Quantity","Drug Name"))
            
            
            for x in res:
                # print(x)
                print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format(x[0],x[1],x[2],x[3],x[4],x[5]))
            print("\n")

        elif (choice == 9):
            cursor.execute(query1)
            res = cursor.fetchall()
            print("{:<15} {:<20} {:<20} {:<20}".format("Drug_Id","Mfg_Date","Exp_Date","Supplier"))
            
            for x in res:
                print(x[0]," " *10,x[1], " "*10,x[2], " " *10, x[3])

            print("\n")
        
        elif (choice == 10):
            emp_id = int(input("Enter Employee Id: "))
            print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15} ".format("Name","Employee Id" ,"Position","Email","Phone No","City"))


            cursor.execute("SELECT * FROM employee WHERE Employee_ID = %s", (emp_id,))

            res = cursor.fetchall()
            
            for x in res:
        
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format(*values))
            print('\n')
            up_pos= input("Enter Updated Position: ")

            cursor.execute("UPDATE EMPLOYEE SET POSITION = %s WHERE Employee_ID = %s", (up_pos, emp_id,))
            db.commit()
            print("Position Updated!")


        elif(choice == 11):
            main_func()
        else:
            print("Enter a Valid choice")
            continue
        
def customer():
    med = input("Name of the medicine: ")
    cursor.execute("SELECT QUANTITY,PRICE,DRUG_ID FROM MEDICINE_DETAILS WHERE NAME_OF_DRUG = %s", (med,))
    result = cursor.fetchone()

    if result is None:
        print(f"{med} is not available")
        customer()
    quantity = result[0]
    price = result[1]
    drug_id = result[2]

    
    print(f"Price of {med}: {price}")
    
    qunt_entered = int(input("Enter the quantity: "))

    if (qunt_entered > quantity):
        print("Sorry!\nThat much quanity is not available!")
        print(f"Quantity of {med} availble: {quantity}")
        customer()
    print("Total Price = ",end = "")
    pid = randint(1,100)
    print(price * qunt_entered)
    print("Iteams Added to Cart")
    status = input("Enter Status(N/Y): ")
    cursor.execute("insert into cart (CART_ITEM,QUANTITY, PRICE, PID, FINAL_STATUS) values(%s,%s,%s,%s,%s);",(med, qunt_entered,price *qunt_entered,pid, status))
    db.commit()
    
    # cursor.execute("UPDATE medicine_details SET QUANTITY = QUANTITY - %s WHERE DRUG_ID = %s; ",(qunt_entered,))
    # cursor.execute("insert into cart(CART_ITEM, QUANTITY,PRICE, PID, FINAL_STATUS ) values(%s,%s,%s,%s,%s)",(med,qunt_entered,price * qunt_entered,pid,status))
    
    if (status == "Y"):

        medicines.append({"name": med, "quantity": qunt_entered, "price": price*qunt_entered})

    cursor.execute("UPDATE BILL SET DRUG_ID = %s WHERE PID = %s AND QUANTITY = %s ;",(drug_id,pid,qunt_entered))
    db.commit()
    
    # ask user if they want to add more medicines
    choice = input("Do you want to add more medicines? (y/n):")
    
    if choice.lower() == "y":
        customer()

    

    total = 0  # variable to store total bill amount
    print("Medicine Bill")
    print("Name\t\t\tQuantity\t\tPrice")
    for med in medicines:
        print(f"{med['name']}\t\t\t{med['quantity']}\t\t{med['price']}")
        total += med['price']

    if (total > 5000):
        print("Congrationals!\nYou got a Discount!")
        total = total - total*0.1
    print(f"Amount to be paid: {total}")

    payment = int(input("Enter payment amount: "))
    if (payment != total):
        print("Payment unsucessful!")
        print("Please pay the exact amount you are required to pay")
        payment = int(input("Enter payment amount: "))
        
        
    print("Payment Succesfull!")

    print("Items out for delivery")
    
    print(f"\nTotal bill amount: {total}")

    print("The Order will reach your Address within 1-2 days")

    main_func()



def int_main():
       
    while (True):
        print("1. Log In\n2. Sign In\n3. Exit")
        n1 = int(input("Enter your choice: "))
        if (n1 == 3):
            return

        elif (n1 == 2):

            username = input("Enter a new username: ")

            if username in dict_pass:
                print("Username already taken")
            else:
                password = input("Enter a password: ")
                dict_pass[username] = password
                print("Registration successful!")
                continue

        elif (n1 == 1):
            
            n3 = input("Enter Username: ")
            if n3 not in list(dict_pass.keys()):
                print ("User not registered")
                print ("First resgister through Log In Option")
                continue
            n2 = input("Enter Password: ")
        
            
            if (n2 == dict_pass.get(n3)):
                print("Log In Successful")
                main_func()
                # try:
                #     main_func()
                # except:
                #     print("Error Occurred\n")
                #     print("Try Again!!")
                # break

            else:
                print("Incorrect Password\nTry Again!")
        elif(n1 == 3):
            break

        else:
            print("Invalid option, please try again.")

int_main()