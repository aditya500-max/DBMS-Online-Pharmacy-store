delimiter //
create trigger 
trigger1
after insert 
on cart
for each row
begin
if NEW.FINAL_STATUS = "Y" then
insert into bill (PID, DRUG_ID, QUANTITY, TOTAL_PRICE)
VALUES (NEW.PID, 11, NEW.QUANTITY, NEW.PRICE);
end if ;
end //
delimiter ;

insert into cart values(123, "honeytus", 15, 77, 26 , "Y");
