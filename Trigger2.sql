delimiter // 
create trigger 
trigger2
before update
on bill
for each row
begin
if new.TOTAL_PRICE > 5000 then
set NEW. TOTAL_PRICE = (NEW.TOTAL_PRICE) - (NEW.TOTAL_PRICE)*0.1;
end if;
end //
delimiter ;



update bill
set TOTAL_PRICE = 10000
WHERE BILL_ID = 10;
