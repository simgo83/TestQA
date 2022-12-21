#language: ru

@tree

Функционал: Создание элементов в цикле

Как Тестировщик я хочу
наполнить базу элементами номенклатуры
чтобы проверить создание циклом 

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий



Сценарий: Наполнение справочника номенклатуры	

	И я проверяю или создаю для справочника "ItemTypes" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Parent' | 'IsFolder' | 'Code' | 'Type'                   | 'UseSerialLotNumber' | 'Description_en'            | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'UniqueID'                          |
		| 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'False'        | ''       | 'False'    | 2      | 'Enum.ItemTypes.Product' | 'False'              | 'Товар (без характеристик)' | ''                 | ''               | ''               | '_32c63d8e5ee94926b3c772ab02c5243e' |
	
	И я проверяю или создаю для справочника "Units" объекты:
		| 'Ref'                                                           | 'DeletionMark' | 'Code' | 'Item' | 'Quantity' | 'BasisUnit' | 'UOM' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'False'        | 1      | ''     | 1          | ''          | ''    | 'шт'             | ''                 | ''               | ''               |          |          |          |          |         |


	И Я запоминаю значение выражения '1' в переменную "Счетчик"
	И Я делаю 10 раз
		И Я запоминаю значение выражения '$Счетчик$+1' в переменную "Счетчик"		
		И Я запоминаю значение выражения '"Тестовая номенклатура #"+$Счетчик$' в переменную "ТекущаяСтрокаНаименования"
		И Я запоминаю значение выражения '"e1cib/data/Catalog.Items?ref="+ СтрЗаменить(Новый УникальныйИдентификатор,"-","")' в переменную "Ссылка"	
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'      | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture' | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en'              | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '$Ссылка$' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6879' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | ''             | ''       | ''       | ''            | '$ТекущаяСтрокаНаименования$' | ''                 | ''               | ''               |          |          |          |          |         |
		
		
