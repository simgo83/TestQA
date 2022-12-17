﻿#language: ru

@tree

Функционал: Создание закупки

Как менеджер по закупкам я хочу
создание документа поступления
 
чтобы поставить товар на учет
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
//
Сценарий: создание документа поступления
* открытие документа
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И в таблице "Список" я разворачиваю строку:
		| 'Дата'                      |
		| 'Магазин "Бытовая техника"' |
	И в таблице "Список" я перехожу к строке:
		| 'Дата'                | 'Номер'     | 'Организация'        | 'Поставщик'                 | 'Склад'   |
		| '17.12.2022 22:37:58' | '000000057' | 'ООО "1000 мелочей"' | 'Магазин "Бытовая техника"' | 'Большой' |
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* Заполнение шапки
	Тогда открылось окно 'Поступление товара (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Поставщик" я выбираю точное значение 'Магазин "Бытовая техника"'
* Заполнение ТЧ	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Босоножки'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыСумма"
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	Тогда открылось окно 'Поступление товара * от *'
	И я запоминаю значение поля с именем "Номер" как "$Номер$"	
* Проведение	
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара * от *' в течение 20 секунд
* проверка номера
И	таблица "Список" содержит строки:
	|'Номер'|
	|'$Номер$'|
