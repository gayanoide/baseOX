INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_sams', 'sams', 1);

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(null , 'society_sams', 0, null);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_sams', 'sams', 1);

INSERT INTO `jobs` (`name`, `label`) VALUES
('sams', 'sams');

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('sams', 0, 'recrue', 'grade 0', 0, '', ''),
('sams', 1, 'offi1', 'grade 1', 0, '', ''),
('sams', 2, 'offi2', 'grade 2', 0, '', ''),
('sams', 3, 'offi3', 'grade 3', 0, '', ''),
('sams', 4, 'offi4', 'grade 4', 0, '', ''),
('sams', 5, 'offi5', 'grade 5', 0, '', ''),
('sams', 6, 'boss', 'Capitaine', 0, '', ''),
('sams', 7, 'boss', 'adjoint', 0, '', ''),
('sams', 8, 'boss', 'Commandant', 0, '', '');