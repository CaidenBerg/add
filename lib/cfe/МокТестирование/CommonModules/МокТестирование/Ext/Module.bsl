﻿////////////////////////////////////////////////////////////////////////////////
// Методы для мок-тестирования
////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Установить подмену для вызова серверного кода.
// В качестве результата использовать внешнюю переменную Результат.
// Можно передавать\получать параметры исходного метода через спец.переменную МассивПараметров
//
// Параметры:
//  КлючПодмены		 - Строка 	 - ключ подменяемого метода интеграции.
//  СтрокаВызоваСерверногоМетода - Строка	 - набор серверного кода. 
// 		В переменной Результат возвращается результат значения метода
// 		Можно передавать\получать параметры исходного метода через спец.переменную МассивПараметров
//
Процедура УстановитьПодмену(Знач КлючПодмены, Знач СтрокаВызоваСерверногоМетода) Экспорт
	
	НастройкаПодмены = НоваяНастройка();
	НастройкаПодмены.Вставить("Ключ", КлючПодмены);
	НастройкаПодмены.Вставить("ВызыватьКод", Истина);
	НастройкаПодмены.Вставить("СтрокаВызова", СтрокаВызоваСерверногоМетода);
	
	СохранитьНастройку(КлючПодмены, НастройкаПодмены);
	
КонецПроцедуры

// Установить подмену возвращаемого значения. Используется в МокТестирование().Метод("ПолучитьЗапрещенноеНаименование").ДолженВозвращать(Истина);
// 	ВАЖНО - значение должно уметь сохраняться в хранилище настроек
//
// Параметры:
//  КлючПодмены		 - Строка 	 - ключ подменяемого метода интеграции.
//  ЗначениеДляВозврата - Произвольный	 - значения для возврата. 
// 		ВАЖНО - значение должно уметь сохраняться в хранилище настроек
//
Процедура УстановитьПодменуВозвращаемогоЗначения(Знач КлючПодмены, Знач ЗначениеДляВозврата) Экспорт
	
	НастройкаПодмены = НоваяНастройка();
	НастройкаПодмены.Вставить("Ключ", КлючПодмены);
	НастройкаПодмены.Вставить("ВызыватьКод", Ложь);
	
	НастройкаПодмены.Вставить("ВозвращаемоеЗначение", ЗначениеДляВозврата);
	
	СохранитьНастройку(КлючПодмены, НастройкаПодмены);
	
КонецПроцедуры

// Отключить подмену
//
// Параметры:
//  КлючПодмены		 - Строка 	 - ключ подменяемого метода интеграции.
//
Процедура ОтключитьПодмену(Знач КлючПодмены) Экспорт
	
	УдалитьНастройку(КлючПодмены);
	
КонецПроцедуры

// Выполнить подмену
//
// Параметры:
//  КлючПодмены		 - Строка 	 - ключ подменяемого метода интеграции.
//  МассивПараметров	 - Массив - массив параметров от исходного метода
//  РезультатВызова	 - Произвольный - результат вызова метода подмены. Необязательный. Если не удалось вызвать код, тогда Неопределено.
// 
// Возвращаемое значение:
//   Булево - Истина, если подмена существует, и Ложь, если подмены нет
//
Функция ВыполнитьПодмену(Знач КлючПодмены, Знач МассивПараметров, РезультатВызова = Неопределено) Экспорт
	Перем Результат;
	
	РезультатВызова = Неопределено;
	
	НастройкаПодмены = ПолучитьНастройку(КлючПодмены);
	
	Если Не ЗначениеЗаполнено(НастройкаПодмены) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Если НастройкаПодмены.ВызыватьКод Тогда
		СтрокаВызова = НастройкаПодмены.СтрокаВызова;
		Если Не ЗначениеЗаполнено(СтрокаВызова) Тогда
			Возврат Ложь;
		КонецЕсли;
		
		ВозвращаемоеЗначение = Неопределено;
		Результат = Неопределено;
		Выполнить(СтрокаВызова);
		
		РезультатВызова = Результат;
		
		Возврат Истина;
	КонецЕсли;
	
	РезультатВызова = НастройкаПодмены.ВозвращаемоеЗначение;
	
	Возврат Истина;
КонецФункции

#Область ТекучийИнтерфейс

// Установить ключ метода для подмены.  Используется в МокТестирование().Метод("ПолучитьЗапрещенноеНаименование").ДолженВозвращать(Истина);
//
// Параметры:
//  КлючПодмены	 - Строка	 - ключ метода для подмены. Идентификатор 1С для вставки в структуру
// 
// Возвращаемое значение:
//   Обработка.МокТестирования - этот объект для текучего интерфейса
//
Функция Метод(Знач КлючПодмены) Экспорт
	
	Возврат Обработки.МокТестирование.Создать().Метод(КлючПодмены);

КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция НоваяНастройка()
	
	НастройкаПодмены = Новый Структура;
	НастройкаПодмены.Вставить("Ключ", "");
	НастройкаПодмены.Вставить("СтрокаВызова", "");
	НастройкаПодмены.Вставить("ВызыватьКод", Истина);
	НастройкаПодмены.Вставить("ВозвращаемоеЗначение", Неопределено);
	
	Возврат НастройкаПодмены;
КонецФункции

Процедура СохранитьНастройку(Знач КлючПодмены, Знач Значение)

	Настройки = Настройки();
	Настройки.Вставить(КлючПодмены, Значение);
	
	ХранилищеОбщихНастроек.Сохранить(ИдентификаторНастройки(), , Настройки);

КонецПроцедуры

Функция ПолучитьНастройку(Знач КлючПодмены)
	
	Настройки = Настройки();
	Значение = Настройки.Получить(КлючПодмены);
	Возврат Значение;
	
КонецФункции

Процедура УдалитьНастройку(Знач КлючПодмены)
	
	Настройки = Настройки();
	Настройки.Удалить(КлючПодмены);
	
	ХранилищеОбщихНастроек.Сохранить(ИдентификаторНастройки(), , Настройки);
	
КонецПроцедуры

Функция Настройки()
	
	Результат =  ХранилищеОбщихНастроек.Загрузить(ИдентификаторНастройки());
	Если Не ЗначениеЗаполнено(Результат) Тогда
		Результат = Новый Соответствие;
	КонецЕсли;
	Возврат Результат;
	
КонецФункции

Функция ИдентификаторНастройки()
	
	Возврат "МокТестирование";
	
КонецФункции

Функция ОбщийМодуль(Знач ИмяМодуля)
	
	Возврат Вычислить(ИмяМодуля);

КонецФункции

#КонецОбласти
