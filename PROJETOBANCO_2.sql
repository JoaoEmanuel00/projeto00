
/*primeira questao*/


DELIMITER &

CREATE PROCEDURE inserir_aluno(mat_aluno INTEGER, cod_curso INTEGER, data_nasc DATE,
 total_cred INTEGER, mgp DOUBLE, nome_aluno VARCHAR(60) ,email VARCHAR(30))
 
 DETERMINISTIC 
 
 BEGIN
 
 INSERT INTO Aluno VALUES(mat_aluno, cod_curso, data_nasc, total_cred, mgp , nome_aluno , email);
 SELECT nome_aluno AS Nome FROM Aluno ORDER BY mat_aluno DESC LIMIT 1; 
 
 END &
 
 DROP PROCEDURE inserir_aluno;
 
 CALL inserir_aluno( '' ,3 , '2001-06-4',70,2.3,'nomequalquer','nomequalquer.com');
 SELECT* FROM Aluno;


/* 2 questao*/



DELIMITER $
CREATE PROCEDURE  cont_while(limite TINYINT UNSIGNED)

BEGIN
  DECLARE cont INT;
  DECLARE resultado VARCHAR(50);
  SET cont = 1;
  SET resultado='' ;
  WHILE cont<=5 DO
  
   SET resultado = CONCAT(resultado,cont,',');
   SET cont = cont + 1 ;
   END WHILE ;
   
 SELECT resultado;
 
 END $

DROP PROCEDURE contador_while


CALL contador_while(1);







DELIMITER %
 /* TERCEIRO QUESITO */

CREATE PROCEDURE contador_repeat(limite TINYINT UNSIGNED)
BEGIN 

  declare cont INT;
  DECLARE resultado VARCHAR(50);
  
     SET cont = 1;
     SET resultado = '';
     
      REPEAT
      
      SET resultado = CONCAT(resultado, cont , ' , ');
      SET cont = cont + 1 ;
      
      UNTIL cont = 10
      
      END REPEAT;
      
    SELECT resultado;
    
    END %
    
DROP PROCEDURE contador_repeat
    
