
DELIMITER $

CREATE TRIGGER tri_vendar_ai AFTER INSERT ON comivenda FOR EACH ROW 

BEGIN
   DECLARE vtotal_itens float(10,2) DEFAULT 0 ;
   
   DECLARE  flot (10,2) DEFAULT 0 ; 
   
   DECLARE total_item float ( 10,2);
   
   DECLARE qtd_item INT DEFAULT 0 ;
   
   DECLARE fimloop INT DEFAULT 0 ;
   
   
   declare busca_itens cursor for select n_valoivenda, n_qtdeivenda from comivenda where n_numevenda = new.n_numevenda;
   
   
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET fimloop= 1;
   
   open busa_itens;
   
   itens : loop
   IF fimloop = 1 THEN 
    LEVAE itens;
    END IF ;
    
    fetch busca_itens into total_item, qnt_item; 
    
    set vtotal_item = total_item*qtd_item;
    
    set vtotal_itens= vtotal_itens+vtotal_item;
    
    
    end loop itens;
    close busca_itens;
    
    
    SET vtotal_item = NEW.n_valoivenda*NEW.n_qtdeivenda;
    
    update comvenda set n_totavenda = vtotal_itens-vtotal_item where n_numevenda= new.n_numevenda;
    
    END $
    
    
    
    
    
    
    