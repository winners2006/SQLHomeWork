DROP FUNCTION IF EXISTS FormatSeconds;
DELIMITER //
CREATE FUNCTION FormatSeconds(inputSeconds INT)
RETURNS FLOAT READS SQL DATA
BEGIN
    DECLARE formattedTime INT;
    SET formattedTime = CONCAT(
        IF(inputSeconds >= 86400, CONCAT(FLOOR(inputSeconds / 86400), ' Дней '), ''),
        IF((inputSeconds % 86400) >= 3600, CONCAT(FLOOR((inputSeconds % 86400) / 3600), ' Часов '), ''),
        IF((inputSeconds % 3600) >= 60, CONCAT(FLOOR((inputSeconds % 3600) / 60), ' Минут '), ''),
        IF((inputSeconds % 60) > 0, CONCAT((inputSeconds % 60), ' Секунд '), '')
    );

    SELECT @formattedTime;
END //
DELIMITER ;

CALL FormatSeconds(52546);