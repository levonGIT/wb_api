<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>


### Тестовое API на фреймворке Laravel

#### Реализована выдача сущностей 
- Продажи 
- Заказы
- Склады
- Доходы

### Основное

- Авторизация происходит посредством передачи секретного токена в строке запроса с параметром **key**
- Формат даты **Y-m-d**
- Формат дата + время **Y-m-d H:i:s**
- Все эндпоинты выдают ответ в **json** с пагинацией
- Лимит на количество возвращаемых записей за запрос - **500** (по умолчанию выдает по **500** строк)
- Если нужно меньше, то передавать в параметре **limit** в строке запроса
- Перебор данных происходит по параметру **page** в строке запроса

_**Пример запроса:** /api/orders?dateFrom={Дата выгрузки ОТ}&dateTo={Дата выгрузки ДО}}&page={номер страницы}&limit={количество записей}key={ваш токен}_

#### Продажи

Параметры:

- dateFrom
- dateTo

`Путь: GET /api/sales`

#### Заказы

Параметры:

- dateFrom
- dateTo

`Путь: GET /api/orders`

#### Склады 
_Выгрузка только за текущий день_

Параметры:

- dateFrom

`Путь: GET /api/stocks`

#### Доходы

Параметры:

- dateFrom
- dateTo

`Путь: GET /api/incomes`

`Стек: docker/docker-compose, php 8.1, Laravel 8, Laravel Octane`

## Доступ к БД

#### cli - mysql -h bbi5v1zprlktaxhj0sl3-mysql.services.clever-cloud.com -P 3306 -u urvcf1youag8ugq3 -p bbi5v1zprlktaxhj0sl3  
#### uri - mysql://urvcf1youag8ugq3:2mh4pY5unN4UjWl5Pd3p@bbi5v1zprlktaxhj0sl3-mysql.services.clever-cloud.com:3306/bbi5v1zprlktaxhj0sl3

password - 2mh4pY5unN4UjWl5Pd3p

[Ссылка на коллекцию Postman](https://www.postman.com/cy322666/workspace/app-api-test/overview)

