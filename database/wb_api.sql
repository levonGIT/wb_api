-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: by3z8lceanpas5aqztci-mysql.services.clever-cloud.com:3306
-- Время создания: Янв 20 2025 г., 12:03
-- Версия сервера: 8.0.22-13
-- Версия PHP: 8.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `by3z8lceanpas5aqztci`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Accounts`
--

CREATE TABLE `Accounts` (
  `id` int UNSIGNED NOT NULL,
  `company_id` int UNSIGNED NOT NULL,
  `token_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Companies`
--

CREATE TABLE `Companies` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Incomes`
--

CREATE TABLE `Incomes` (
  `income_id` int UNSIGNED NOT NULL,
  `number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `last_change_date` date NOT NULL,
  `supplier_article` varchar(50) NOT NULL,
  `tech_size` varchar(50) NOT NULL,
  `barcode` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `date_close` date NOT NULL,
  `warehouse_name` varchar(50) NOT NULL,
  `nm_id` int NOT NULL,
  `account_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `g_number` decimal(65,0) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `last_change_date` date NOT NULL,
  `supplier_article` varchar(50) NOT NULL,
  `tech_size` varchar(50) NOT NULL,
  `barcode` int NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `discount_percent` int NOT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `oblast` varchar(255) NOT NULL,
  `income_id` int UNSIGNED NOT NULL,
  `odid` int NOT NULL,
  `nm_id` int NOT NULL,
  `subject` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `is_cancel` tinyint(1) NOT NULL,
  `cancel_dt` date DEFAULT NULL,
  `account_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Sales`
--

CREATE TABLE `Sales` (
  `g_number` decimal(65,0) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `last_change_date` date NOT NULL,
  `supplier_article` varchar(50) NOT NULL,
  `tech_size` varchar(50) NOT NULL,
  `barcode` int NOT NULL,
  `total_price` decimal(10,0) NOT NULL,
  `discount_percent` int NOT NULL,
  `is_supply` tinyint(1) NOT NULL,
  `is_realization` tinyint(1) NOT NULL,
  `promo_code_discount` int DEFAULT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  `oblast_okrug_name` varchar(255) NOT NULL,
  `region_name` varchar(255) NOT NULL,
  `income_id` int NOT NULL,
  `sale_id` varchar(100) NOT NULL,
  `odid` int DEFAULT NULL,
  `spp` int NOT NULL,
  `for_pay` decimal(10,0) NOT NULL,
  `finished_price` decimal(10,0) NOT NULL,
  `price_with_disc` decimal(10,0) NOT NULL,
  `nm_id` int NOT NULL,
  `subject` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `is_storno` int DEFAULT NULL,
  `account_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Services`
--

CREATE TABLE `Services` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Service_tokens`
--

CREATE TABLE `Service_tokens` (
  `id` int UNSIGNED NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `token_type_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Stocks`
--

CREATE TABLE `Stocks` (
  `date` date NOT NULL,
  `last_change_date` date DEFAULT NULL,
  `supplier_article` varchar(50) DEFAULT NULL,
  `tech_size` varchar(50) DEFAULT NULL,
  `barcode` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `is_supply` tinyint(1) DEFAULT NULL,
  `is_realization` tinyint(1) DEFAULT NULL,
  `quantity_full` int DEFAULT NULL,
  `warehouse_name` varchar(50) DEFAULT NULL,
  `in_way_to_client` int DEFAULT NULL,
  `in_way_from_client` int DEFAULT NULL,
  `nm_id` int DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sc_code` int DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `account_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Tokens`
--

CREATE TABLE `Tokens` (
  `id` int UNSIGNED NOT NULL,
  `token_type_id` int UNSIGNED NOT NULL,
  `service_key` varchar(255) NOT NULL,
  `service_id` int UNSIGNED NOT NULL,
  `account_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Token_types`
--

CREATE TABLE `Token_types` (
  `id` int UNSIGNED NOT NULL,
  `name` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_accounts_companies` (`company_id`),
  ADD KEY `fk_accounts_tokens` (`token_id`);

--
-- Индексы таблицы `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_company_name` (`email`);

--
-- Индексы таблицы `Incomes`
--
ALTER TABLE `Incomes`
  ADD KEY `fk_incomes_accounts` (`account_id`);

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD KEY `fk_orders_accounts` (`account_id`);

--
-- Индексы таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD KEY `fk_sales_accounts` (`account_id`);

--
-- Индексы таблицы `Services`
--
ALTER TABLE `Services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Service_tokens`
--
ALTER TABLE `Service_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_servtokens_services` (`service_id`),
  ADD KEY `fk_servtokens_tokentypes` (`token_type_id`);

--
-- Индексы таблицы `Stocks`
--
ALTER TABLE `Stocks`
  ADD KEY `fk_stocks_accounts` (`account_id`);

--
-- Индексы таблицы `Tokens`
--
ALTER TABLE `Tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tokens_tokentypes` (`token_type_id`),
  ADD KEY `fk_tokens_services` (`service_id`),
  ADD KEY `fk_tokens_accounts` (`account_id`);

--
-- Индексы таблицы `Token_types`
--
ALTER TABLE `Token_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Accounts`
--
ALTER TABLE `Accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Companies`
--
ALTER TABLE `Companies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Services`
--
ALTER TABLE `Services`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Service_tokens`
--
ALTER TABLE `Service_tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Tokens`
--
ALTER TABLE `Tokens`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Token_types`
--
ALTER TABLE `Token_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Accounts`
--
ALTER TABLE `Accounts`
  ADD CONSTRAINT `fk_accounts_companies` FOREIGN KEY (`company_id`) REFERENCES `Companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_accounts_tokens` FOREIGN KEY (`token_id`) REFERENCES `Tokens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Incomes`
--
ALTER TABLE `Incomes`
  ADD CONSTRAINT `fk_incomes_accounts` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `fk_orders_accounts` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `fk_sales_accounts` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Service_tokens`
--
ALTER TABLE `Service_tokens`
  ADD CONSTRAINT `fk_servtokens_services` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servtokens_tokentypes` FOREIGN KEY (`token_type_id`) REFERENCES `Token_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Stocks`
--
ALTER TABLE `Stocks`
  ADD CONSTRAINT `fk_stocks_accounts` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Tokens`
--
ALTER TABLE `Tokens`
  ADD CONSTRAINT `fk_tokens_accounts` FOREIGN KEY (`account_id`) REFERENCES `Accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tokens_services` FOREIGN KEY (`service_id`) REFERENCES `Services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tokens_tokentypes` FOREIGN KEY (`token_type_id`) REFERENCES `Token_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
