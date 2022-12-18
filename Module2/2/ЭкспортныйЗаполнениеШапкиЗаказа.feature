﻿#language: ru
@ExportScenarios
@IgnoreOnCIMainBuild
Функционал: Создание и заполнение шапки заказа

Как Менеджер по продажам я хочу
создание заказа покупателя 
чтобы зарезервировать товар 
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: Создание и заполнение шапки заказа
*Создание документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
*Заполнение шапки
	Когда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование'        |
		| '000000013' | 'Магазин "Продукты"'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
