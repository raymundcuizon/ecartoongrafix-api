ALTER TABLE `process_steps` ADD `sequence` INT(3) NULL AFTER `status`;
ALTER TABLE `process` ADD `sequence` INT(3) NULL AFTER `status`;
