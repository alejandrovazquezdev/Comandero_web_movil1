-- Script para agregar la columna tiempo_estimado_preparacion a la tabla orden
-- Esta columna permite al cocinero establecer el tiempo estimado de preparación
-- MySQL compatible version using stored procedure

DELIMITER $$

DROP PROCEDURE IF EXISTS add_tiempo_estimado_column$$

CREATE PROCEDURE add_tiempo_estimado_column()
BEGIN
  -- Check if column exists
  IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = 'orden'
      AND COLUMN_NAME = 'tiempo_estimado_preparacion'
  ) THEN
    ALTER TABLE orden 
    ADD COLUMN tiempo_estimado_preparacion INT UNSIGNED NULL 
    AFTER estado_orden_id;
  END IF;
END$$

DELIMITER ;

-- Execute the procedure
CALL add_tiempo_estimado_column();

-- Clean up
DROP PROCEDURE IF EXISTS add_tiempo_estimado_column;

