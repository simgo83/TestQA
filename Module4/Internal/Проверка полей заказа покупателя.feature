﻿#language: ru

@tree

Функционал: Заполнение полей документа Заказ покупателя

Как Тестировщик я хочу
проверить заполнение полей  заказа покупателя
чтобы проверить на ошибки 
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0401 Заполнение первоначальных данных
Когда экспорт основных данных

Сценарий: _0402 Проверка блокировки поля Контрагент
*заполнение партнера и проверка доступности контрагента
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	И я нажимаю на кнопку с именем 'FormCreate'
	Когда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'            |
		| '2'   | 'Клиент 2 (2 соглашения)' |

	И в таблице "List" я выбираю текущую строку		
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'	
	И в таблице "List" я перехожу к строке:
		| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
		| 'Обычное' | 'По соглашениям'     | '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |
	И в таблице "List" я выбираю текущую строку
	И элемент формы с именем "LegalName" доступен
*очистка партнера и проверка доступности контрагента
	Когда открылось окно 'Заказ покупателя (создание) *'
	И в поле с именем 'Partner' я ввожу текст ''
	И элемент формы с именем "LegalName" не доступен
	И я закрываю все окна клиентского приложения
	
		
		
		



