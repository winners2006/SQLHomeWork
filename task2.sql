DROP PROCEDURE IF EXISTS EvenNumbers;
DELIMITER //
CREATE PROCEDURE EvenNumbers(IN startNumber INT, IN endNumber INT)
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS tempNumbers (number INT);
    
    SET @currentNumber = startNumber;

    WHILE @currentNumber <= endNumber DO
        INSERT INTO tempNumbers (number) VALUES (@currentNumber);
        SET @currentNumber = @currentNumber + 1;
    END WHILE;

    SELECT number
    FROM tempNumbers
    WHERE number % 15 = 0 OR number % 33 = 0;

    DROP TEMPORARY TABLE IF EXISTS tempNumbers;
END //
DELIMITER ;

CALL EvenNumbers(1, 100);