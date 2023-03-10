#language: ru

@tree

Функционал: Проверка суммы заказа при изменении цены, количества

Как Менеджер по продажам я хочу
создание заказа покупателя 
чтобы зарезервировать товар 
Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
Сценарий: Создание документа заказа с проверкой суммы
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
		| '000000009' | 'Животноводство ООО ' |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
*Заполнение таблицы
	Когда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000017' | 'Bosch1234'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2 000,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки	
	И таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Bosch1234' | '2 000,00' | '2'          | '4 000,00' |
	
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
	И элемент формы с именем "ТоварыИтогСумма" стал равен '4 000'
*Запись документа
	Когда открылось окно 'Заказ (создание) *'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
	И я запоминаю значение поля "Номер" как "$Номер$"
*Проведение
	Когда открылось окно 'Заказ * от *'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ * от *' в течение 20 секунд
*Проверка успешного создания
	и таблица "Список" содержит строки:
		| 'Номер'     |
		| '$Номер$' | 