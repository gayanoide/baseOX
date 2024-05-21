INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_safd', 'safd', 1);

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(null , 'society_safd', 50000, null);

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_safd', 'safd', 1);

INSERT INTO `jobs` (`name`, `label`) VALUES
('safd', 'safd');

INSERT INTO `job_grades` (`id`,`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(NULL, 'safd', 0, 'recrue', 'Recrue', 0, '', ''),
(NULL, 'safd', 1, 'volontaire', 'Volontaire', 0, '', ''),
(NULL, 'safd', 2, '1class', '1er Classe', 0, '', ''),
(NULL, 'safd', 3, 'caporal1', 'Caporal I', 0, '', ''),
(NULL, 'safd', 4, 'caporal2', 'Caporal II', 0, '', ''),
(NULL, 'safd', 5, 'capichef', 'Caporal Chef', 0, '', ''),
(NULL, 'safd', 6, 'sergent1', 'Sergent I', 0, '', ''),
(NULL, 'safd', 7, 'sergent2', 'Sergent II', 0, '', ''),
(NULL, 'safd', 8, 'adjudant1', 'Adjudant I', 0, '', ''),
(NULL, 'safd', 9, 'adjudant2', 'Adjudant II', 0, '', ''),
(NULL, 'safd', 10, 'adjudantmajor', 'Adjudant Major', 0, '', ''),
(NULL, 'safd', 11, 'expert', 'Expert', 0, '', ''),
(NULL, 'safd', 12, 'aspirant', 'Aspirant', 0, '', ''),
(NULL, 'safd', 13, 'lieutenant', 'Lieutenant', 0, '', ''),
(NULL, 'safd', 14, 'commandant', 'Commandant', 0, '', ''),
(NULL, 'safd', 15, 'boss', 'Battalion - Chief', 0, '', ''),
(NULL, 'safd', 16, 'boss', 'Division - Chief', 0, '', ''),
(NULL, 'safd', 17, 'boss', 'Deputy - Chief', 0, '', ''),
(NULL, 'safd', 18, 'boss', 'Fire - Chief', 0, '', ''),;

ALTER TABLE `users` ADD COLUMN `currentHealth` int(11) NOT NULL DEFAULT 200;

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
(290, 'safd', '{\"coords\":{\"x\":-632.125732421875,\"y\":-121.97404479980469,\"z\":39.42330551147461},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":80,\"coords\":{\"x\":-631.965087890625,\"y\":-120.96527862548828,\"z\":39.42330551147461},\"model\":-2021949952},{\"heading\":260,\"coords\":{\"x\":-632.286376953125,\"y\":-122.9828109741211,\"z\":39.42330551147461},\"model\":-2021949952}],\"groups\":{\"safd\":0}}'),
(291, 'safd', '{\"coords\":{\"x\":-632.931884765625,\"y\":-126.79842376708985,\"z\":39.42167663574219},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":260,\"coords\":{\"x\":-633.09375,\"y\":-127.80731201171875,\"z\":39.42167663574219},\"model\":-2021949952},{\"heading\":80,\"coords\":{\"x\":-632.77001953125,\"y\":-125.78953552246094,\"z\":39.42167663574219},\"model\":-2021949952}],\"groups\":{\"safd\":0}}'),
(292, 'safd', '{\"coords\":{\"x\":-630.6298217773438,\"y\":-113.97341918945313,\"z\":39.14410781860351},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":263,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(293, 'safd', '{\"coords\":{\"x\":-629.6058349609375,\"y\":-105.84209442138672,\"z\":39.14406585693359},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":262,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(294, 'safd', '{\"coords\":{\"x\":-628.5516967773438,\"y\":-97.72549438476563,\"z\":39.14434814453125},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":263,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(295, 'safd', '{\"coords\":{\"x\":-660.1115112304688,\"y\":-77.48991394042969,\"z\":39.09143447875976},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":28,\"coords\":{\"x\":-659.1735229492188,\"y\":-76.97418212890625,\"z\":39.09143447875976},\"model\":-625902714},{\"heading\":30,\"coords\":{\"x\":-661.0494995117188,\"y\":-78.00564575195313,\"z\":39.09143447875976},\"model\":-96416801}],\"groups\":{\"safd\":0}}'),
(296, 'safd', '{\"coords\":{\"x\":-640.803466796875,\"y\":-70.37983703613281,\"z\":41.09241485595703},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":177,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(297, 'safd', '{\"coords\":{\"x\":-632.8696899414063,\"y\":-70.92486572265625,\"z\":41.08790969848633},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":177,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(298, 'safd', '{\"coords\":{\"x\":-625.1746215820313,\"y\":-71.40992736816406,\"z\":41.0860595703125},\"state\":1,\"autolock\":20,\"holdOpen\":true,\"heading\":178,\"model\":-1511111260,\"doors\":false,\"auto\":true,\"maxDistance\":7,\"groups\":{\"safd\":0}}'),
(299, 'safd', '{\"coords\":{\"x\":-656.156494140625,\"y\":-90.96450805664063,\"z\":38.91716384887695},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":28,\"coords\":{\"x\":-655.0106811523438,\"y\":-90.35009002685547,\"z\":38.91716384887695},\"model\":-538477509},{\"heading\":208,\"coords\":{\"x\":-657.3023071289063,\"y\":-91.57891845703125,\"z\":38.91716384887695},\"model\":-538477509}],\"groups\":{\"safd\":0}}'),
(300, 'safd', '{\"coords\":{\"x\":-650.8968505859375,\"y\":-88.2274398803711,\"z\":38.88957977294922},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":29,\"coords\":{\"x\":-652.0358276367188,\"y\":-88.85348510742188,\"z\":38.88957977294922},\"model\":-2041685008},{\"heading\":209,\"coords\":{\"x\":-649.7578125,\"y\":-87.60139465332031,\"z\":38.88957977294922},\"model\":-2041685008}],\"groups\":{\"safd\":0}}'),
(301, 'safd', '{\"coords\":{\"x\":-623.1695556640625,\"y\":-97.73167419433594,\"z\":45.64799118041992},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":265,\"coords\":{\"x\":-623.0536499023438,\"y\":-96.43830108642578,\"z\":45.64799118041992},\"model\":-2041685008},{\"heading\":85,\"coords\":{\"x\":-623.285400390625,\"y\":-99.02505493164063,\"z\":45.64799118041992},\"model\":-2041685008}],\"groups\":{\"safd\":0}}'),
(302, 'safd', '{\"coords\":{\"x\":-629.1857299804688,\"y\":-118.52852630615235,\"z\":45.62514495849609},\"state\":1,\"maxDistance\":2,\"doors\":[{\"heading\":354,\"coords\":{\"x\":-627.892822265625,\"y\":-118.65616607666016,\"z\":45.62514495849609},\"model\":-543497392},{\"heading\":174,\"coords\":{\"x\":-630.4786376953125,\"y\":-118.40088653564453,\"z\":45.62514495849609},\"model\":-543497392}],\"groups\":{\"safd\":0}}');