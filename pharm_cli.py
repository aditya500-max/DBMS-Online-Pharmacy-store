

import mysql.connector
db = mysql.connector.connect(host = 'localhost', 
                               password = 'suyash', 
                               user = 'root',
                               database = 'pharmacy_store')
cursor = db.cursor()

print("Welcome to Online Pharmacy!")

def main_func():

    while True:
        print("1. Details of medicines ordered recently\n2. Olap-1(Number of Employees from different departement and cities )\n3. Olap-2(Medicines details sold between particular dates)\n4. Olap-3(Count of medicines sold between two particular dates)\n5. Olap-4(Quantity of medicines per Supplier)\n6. Add to Cart(T1)\n7. Update Bill Price(T2)\n8. Prescription Details\n9. Log Out ")
       
        n3 = int(input("Enter an option: "))
       
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
        if (n3 == 1):
            cursor.execute(query1)
            res = cursor.fetchall()
            print("{:<15} {:<20} {:<20} {:<20}".format("Drug_Id","Mfg_Date","Exp_Date","Supplier"))
            
            # for x in res:
            #     print("{:<15} {:<20} {:<20} {:<20}".format(x[0], x[1], x[2],x[3]))
        
            
            for x in res:
            
                print(x[0]," " *10,x[1], " "*10,x[2], " " *10, x[3])

            print("\n")

        elif (n3 == 2):
            cursor.execute(olap1)
            res = cursor.fetchall()
            print("{:<30} {:<30} {:<30}".format("Count(Position)", "Position", "City"))
            for x in res:
                # print("{:<20} {:<20} {:<20}".format(x[0], x[1], x[2]))
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<30} {:<30} {:<30} ".format(*values))
            print("\n")


        elif (n3 == 3):
            cursor.execute(olap2)
            res = cursor.fetchall()
            print("{:<30} {:<30} ".format("Drug_Name","Sales"))

            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<30} {:<30} ".format(*values))

            print("\n")
            
        elif (n3 == 4):
            cursor.execute(olap3)
            res = cursor.fetchall()

            print("{:<20} {:<30} {:<30}".format("Count","Drug_Name","Date_Time"))

            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                print("{:<20} {:<20} {:<20}".format(*values))

            print("\n")

        elif (n3 == 5):
            cursor.execute(olap4)
            res = cursor.fetchall()

            print("{:<20} {:<20} {:<20}".format("Supplier","Drug_Name","Quanity"))
            for x in res:
                # print(x)
                values = [str(v) if v is not None else "NULL" for v in x]
                # print("{:<20} {:<20} {:<20}".format(x[0],x[1],x[2]))
                print("{:<20} {:<20} {:<20}".format(*values))
            print("\n")

        elif(n3 == 6):
            cartId = int(input("Cart Id: "))
            medName = input("Med Name: ")
            quan = int(input("Quantity of the medicine: "))
            price_cart = int(input("Price: "))
            pid = int(input("PID: "))
            drug_id = int(input("Drug_Id: "))
            status = input("Status(Y/N): ")
            print("\n")
            cursor.execute("insert into cart values(%s,%s,%s,%s,%s,%s)",(cartId,medName,quan,price_cart,pid,status))
            db.commit()
            cursor.execute("Select * from bill Where PID = %s and DRUG_ID = 11 and Quantity = %s  and TOTAL_PRICE = %s ",(pid,quan,price_cart))
            print("{:<15} {:<15} {:<15} {:<15} {:<15} ".format("Bill_ID", "PID","Drug_Id","Quantity","Total_Price"))
            
            res = cursor.fetchall()
            for x in res:
                # print(x)
                print("{:<15} {:<15} {:<15} {:<15} {:<15} ".format(x[0], x[1],x[2],x[3],x[4]))
            print("\n")


        elif( n3 == 7):
            bill_id = int(input("Bill_Id: "))
            new_price = int(input("New Price: "))
            print("\n")
            cursor.execute("Update bill set TOTAL_PRICE = %s WHERE BILL_ID = %s ", ( new_price,bill_id))
            db.commit()

            cursor.execute("SELECT * FROM bill WHERE BILL_ID = %s", (bill_id,))
            print("{:<15} {:<15} {:<15} {:<15} {:<15} ".format("Bill_ID", "PID","Drug_Id","Quantity","Total_Price"))

            res = cursor.fetchall()
            for x in res:
                # print(x)
                print("{:<15} {:<15} {:<15} {:<15} {:<15} ".format(x[0],x[1],x[2],x[3],x[4]))
            print("\n")

        elif (n3 == 8):
            n4 = int(input("Pres_ID: "))
            print("\n")
            cursor.execute( "SELECT * FROM prescription WHERE PRESCRIPTION_ID = %s", (n4,))
            res = cursor.fetchall()
            print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format("Doc_Name", "Hospital","Patient","Prescription_Id","Quantity","Drug Name"))
            
            
            for x in res:
                # print(x)
                print("{:<15} {:<15} {:<15} {:<15} {:<15} {:<15}".format(x[0],x[1],x[2],x[3],x[4],x[5]))
            print("\n")

        elif(n3 == 9):
            print("Successfully Logged Out")
            break


while (True):
    print("1. Log In\n2. Exit")
    n1 = int(input("Enter your choice: "))
    if (n1 == 2):
        exit()
    elif (n1 == 1):
        n2 = input("Enter Password: ")
        if (n2 == "s"):
            print("Log In Successful")
            try:
                main_func()
            except:
                print("Error Occurred\n")
                print("Try Again!!")
            break

        else:
            print("Incorrect Password\nTry Again!")


