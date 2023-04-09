CREATE TABLE `conversation` (
  `id` int(11) UNSIGNED NOT NULL,
  `senderEmail` varchar(256) DEFAULT NULL,
  `receiverEmail` varchar(256) DEFAULT NULL,
  `message` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;