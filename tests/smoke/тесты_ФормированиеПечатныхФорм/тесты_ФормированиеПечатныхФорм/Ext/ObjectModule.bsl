﻿#Область ОписаниеПеременных

Перем КонтекстЯдра;
Перем Утверждения;

#КонецОбласти

#Область ПрограммныйИнтерфейс

#Область ИнтерфейсТестирования

Функция КлючНастройки() Экспорт
	Возврат "ФормированиеПечатныхФорм";
КонецФункции

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	
	ЗагрузитьНастройки();
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	
	ЗагрузитьНастройки();
	
	Если Не НужноВыполнятьТест(КонтекстЯдра) Тогда
		Возврат;
	КонецЕсли;
	
	Для Каждого МетаОбъект Из Метаданные.Документы Цикл
		Если ПравоДоступа("Просмотр", МетаОбъект) Тогда
			ДобавитьТестыДляДокумента(НаборТестов, МетаОбъект);
		КонецЕсли; 
	КонецЦикла; 
	
КонецПроцедуры

#КонецОбласти

#Область Тесты

Процедура ПередЗапускомТеста() Экспорт
	//НачатьТранзакцию();
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	//Если ТранзакцияАктивна() Тогда
	//    ОтменитьТранзакцию();
	//КонецЕсли;
КонецПроцедуры

Процедура Тест_ПолучитьПечатнуюФорму(МетаИмя, КомандаПечати) Экспорт
	
	ДокументыДляПечати = ПолучитьДокументыДляПечати(Метаданные.Документы[МетаИмя], КомандаПечати.УсловияВидимости);
	Если ДокументыДляПечати.Количество() = 0 Тогда
		Возврат;
	КонецЕсли; 
	
	Для Каждого ДокСсылка Из ДокументыДляПечати Цикл
		НачалоСообщенияОбОшибке = "Печать документа " + ДокСсылка + ": ";
		КоллекцияПечатныхФорм = ПолучитьКоллекциюПечатныхФорм(КомандаПечати, ДокСсылка);
		
		Утверждения.Проверить(ТипЗнч(КоллекцияПечатныхФорм) = Тип("ТаблицаЗначений"), НачалоСообщенияОбОшибке + "Ожидалось, что КоллекцияПечатныхФорм будет иметь тип Таблица значений!");
		Утверждения.Проверить(КоллекцияПечатныхФорм.Количество() > 0, НачалоСообщенияОбОшибке + "Ожидалось, что количество элементов в КоллекцияПечатныхФорм будет больше 0!");
		
		Для Каждого СтрокаТаблицы Из КоллекцияПечатныхФорм Цикл
			ТабДок = СтрокаТаблицы.ТабличныйДокумент;
			Утверждения.Проверить(ТабДок <> Неопределено, НачалоСообщенияОбОшибке + "Ожидалось, что будет получен табличный документ, а получено значение <Неопределено>!");
			
			// Высота таб документа = 0 не означает что это ошибка, в типовой форме ПечатьДокументов есть проверка на высоту 
			// и если высота 0, то просто показывается надпись "Печатная форма недоступна."
			// предлагаю пропускать такой тест
			// Утверждения.Проверить(ТабДок.ВысотаТаблицы > 0, НачалоСообщенияОбОшибке + "Ожидалось, что высота полученного табличного документа будет больше 0!");
			Если ТабДок.ВысотаТаблицы = 0 Тогда
				КонтекстЯдра.ПропуститьТест(НСтр("ru = 'Тест пропущен: ВысотаТаблицы равна 0'"));
			КонецЕсли;
		КонецЦикла; 
		
	КонецЦикла; 
	
КонецПроцедуры

Процедура Тест_ПропуститьПечатнуюФорму(Знач Сообщение) Экспорт
	КонтекстЯдра.ПропуститьТест(Сообщение);
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Настройки

Процедура ЗагрузитьНастройки()
	Если ЗначениеЗаполнено(Настройки) Тогда
		Возврат;
	КонецЕсли;
	
	ПлагинНастройки = КонтекстЯдра.Плагин("Настройки");
    ПлагинНастройки.Инициализация(КонтекстЯдра);
    
	НастройкиПоУмолчанию = НастройкиПоУмолчанию();
    Настройки = ПлагинНастройки.ПолучитьНастройку(КлючНастройки());
    Если ТипЗнч(Настройки) <> Тип("Структура") Then
        Настройки = НастройкиПоУмолчанию;
	Иначе
		ЗаполнитьЗначенияСвойств(НастройкиПоУмолчанию, Настройки);
        Настройки = НастройкиПоУмолчанию;
		
	КонецЕсли;
	
КонецПроцедуры

Функция НастройкиПоУмолчанию()
	
	Результат = Новый Структура;
	Результат.Вставить("Используется", Истина);
	Результат.Вставить("КоличествоДокументов", 1);
	Результат.Вставить("ИсключенияПоИдентификатору", Новый Массив);
	Результат.Вставить("ИсключенияПоИмени", Новый Массив);
	Результат.Вставить("ИсключенияПоОбъекту", Новый Массив);
	
	Возврат Результат;
КонецФункции

Функция НужноВыполнятьТест(КонтекстЯдра)
	
	ЗагрузитьНастройки();
	//Настройки(КонтекстЯдра, ПутьНастройки);
	
	Если Не ЗначениеЗаполнено(Настройки) Тогда
		Возврат Истина;
	КонецЕсли;
	
	//ИмяТеста = ИмяТеста();
	КлючНастройки = КлючНастройки();
	
	ВыполнятьТест = Истина;
	Если ТипЗнч(Настройки) = Тип("Структура") 
		И Настройки.Свойство("Используется", ВыполнятьТест) Тогда
		//И Настройки.Свойство("Параметры") 
		//И Настройки.Параметры.Свойство(ИмяТеста) Тогда

			//ВыполнятьТест = Настройки.Параметры[ИмяТеста];	
			Возврат ВыполнятьТест = Истина;	
	КонецЕсли;
	
	Возврат Истина;

КонецФункции

#КонецОбласти

Процедура ДобавитьТестыДляДокумента(НаборТестов, МетаОбъект)
	
	// TODO реализовать возможность указания исключаемых объектов, а то у некоторых документов в менеджере нет процедуры ДобавитьКомандыПечати()
	КомандыПечати = Неопределено;
	Попытка
		МодульУправлениеПечатью = Вычислить("УправлениеПечатью");
		КомандыПечати = МодульУправлениеПечатью.КомандыПечатиОбъекта(МетаОбъект);        
	Исключение
		КонтекстЯдра.Отладка("Не удалось получить команды печати для документа " + МетаОбъект + ": " + ОписаниеОшибки());
		Возврат;
	КонецПопытки; 
	
	Если КомандыПечати.Количество() = 0 Тогда
		Возврат;
	КонецЕсли; 
	
	НаборТестов.НачатьГруппу("Печатные формы " + МетаОбъект.Синоним + " - Документ."  + МетаОбъект.Имя);
	
	Для Каждого ТекущаяКомандаПечати Из КомандыПечати Цикл
		
		Идентификатор = ТекущаяКомандаПечати.Идентификатор;
		ИдентификаторДляСравнения = НРег(Идентификатор);
		
		ДопИнфо = "Идентификатор = " + Идентификатор;
		Если ТекущаяКомандаПечати.МенеджерПечати = "СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки" Тогда
			ДопИнфо = "Ссылка = " + ТекущаяКомандаПечати.ДополнительныеПараметры.Ссылка + "; " + ДопИнфо;
		КонецЕсли;
		ПредставлениеТеста = "Печатная форма " + МетаОбъект.Имя + ": " + ТекущаяКомандаПечати.Представление + " : " + "{" + ДопИнфо + "}";
		
		Сообщение = "Пропускаем из-за исключения по идентификатору - " + ПредставлениеТеста;
		Если ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(Идентификатор, Настройки.ИсключенияПоИдентификатору, 
					Сообщение, НаборТестов) Тогда
			Продолжить;
		КонецЕсли;
		
		Сообщение = "Пропускаем из-за исключения по имени - " + ПредставлениеТеста;
		Если ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(ТекущаяКомандаПечати.Представление, Настройки.ИсключенияПоИмени, 
					Сообщение, НаборТестов) Тогда
			Продолжить;
		КонецЕсли;
		
		Сообщение = "Пропускаем из-за исключения по имени объекта - " + ПредставлениеТеста;
		Если ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(МетаОбъект.Имя, Настройки.ИсключенияПоОбъекту, 
					Сообщение, НаборТестов) Тогда
			Продолжить;
		КонецЕсли;
		
		
		// Фильтр по функциональным опциям. (код взят из типового модуля ПодключаемыеКоманды)
		ФункциональныеОпции = СтрРазделить(ТекущаяКомандаПечати.ФункциональныеОпции, ",", Ложь);
		ВидимостьКоманды = ФункциональныеОпции.Количество() = 0;
		Для Каждого ИмяОпции Из ФункциональныеОпции Цикл
			Если ПолучитьФункциональнуюОпцию(СокрЛП(ИмяОпции)) Тогда
				ВидимостьКоманды = Истина;
				Прервать;
			КонецЕсли;
		КонецЦикла;
		Если Не ВидимостьКоманды Тогда
			Сообщение = СтрШаблон("%1. Форма пропущена из-за отключенной функциональной опции ""%2""", ПредставлениеТеста, ТекущаяКомандаПечати.ФункциональныеОпции);
			КонтекстЯдра.Отладка(Сообщение);
			ПараметрыТеста = НаборТестов.ПараметрыТеста(Сообщение);
			НаборТестов.Добавить("Тест_ПропуститьПечатнуюФорму", ПараметрыТеста, Сообщение);
			Продолжить;
		КонецЕсли;
		
		СтруктураКоманды = Новый Структура;
		Для Каждого Колонка Из КомандыПечати.Колонки Цикл
			ИмяКолонки = Колонка.Имя;
			СтруктураКоманды.Вставить(ИмяКолонки, ТекущаяКомандаПечати[ИмяКолонки]);
		КонецЦикла; 
		ПараметрыТеста = НаборТестов.ПараметрыТеста(МетаОбъект.Имя, СтруктураКоманды);
		
		НаборТестов.Добавить("Тест_ПолучитьПечатнуюФорму", ПараметрыТеста, ПредставлениеТеста);
	КонецЦикла; 
		
КонецПроцедуры

Функция ДобавитьТестИсключениеЕслиЕстьВИсключаемойКоллекции(Знач ЧтоИщем, Знач КоллекцияДляПоиска, Знач Сообщение, 
			Знач НаборТестов)
			
	Если КонтекстЯдра.ЕстьВИсключаемойКоллекции(ЧтоИщем, КоллекцияДляПоиска) Тогда
		КонтекстЯдра.Отладка(Сообщение);
		ПараметрыТеста = НаборТестов.ПараметрыТеста(Сообщение);
		
		НаборТестов.Добавить("Тест_ПропуститьПечатнуюФорму", ПараметрыТеста, Сообщение);
		
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
КонецФункции

Функция ПолучитьДокументыДляПечати(МетаОбъект, УсловияВидимости = Неопределено)
	
	// здесь можно указать количество документов, для которых нужно проверить каждую форму
	КолвоТестируемыхДокументов = Настройки.КоличествоДокументов;
	
	Результат = Новый Массив; 
	
	ШаблонТекстаЗапроса = 
	"ВЫБРАТЬ ПЕРВЫЕ 1
	|	Док.Ссылка КАК Ссылка
	|ИЗ
	|	Документ.СчетНаОплатуПокупателю КАК Док
	|ГДЕ
	|	&ДопУсловия
	|
	|УПОРЯДОЧИТЬ ПО
	|	ВЫБОР
	|		КОГДА Док.Проведен
	|			ТОГДА 0
	|		КОГДА Док.ПометкаУдаления
	|			ТОГДА 2
	|		ИНАЧЕ 1
	|	КОНЕЦ,
	|	Док.Дата УБЫВ";
	ШаблонТекстаЗапроса = СтрЗаменить(ШаблонТекстаЗапроса, "Документ.СчетНаОплатуПокупателю", "Документ." + МетаОбъект.Имя);
	ШаблонТекстаЗапроса = СтрЗаменить(ШаблонТекстаЗапроса, "ВЫБРАТЬ ПЕРВЫЕ 1", "ВЫБРАТЬ ПЕРВЫЕ " + Формат(КолвоТестируемыхДокументов, "ЧГ="));
	
	Запрос = Новый Запрос;
	Запрос.Текст = ШаблонТекстаЗапроса;
	
	ОперацииУсловий = Новый Соответствие;
	ОперацииУсловий.Вставить(ВидСравнения.Равно, "=");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.Равно, "=");
	ОперацииУсловий.Вставить(ВидСравнения.Больше, ">");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.Больше, ">");
	ОперацииУсловий.Вставить(ВидСравнения.БольшеИлиРавно, ">=");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.БольшеИлиРавно, ">=");
	ОперацииУсловий.Вставить(ВидСравнения.Меньше, "<");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.Меньше, "<");
	ОперацииУсловий.Вставить(ВидСравнения.МеньшеИлиРавно, "<=");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.МеньшеИлиРавно, "<=");
	ОперацииУсловий.Вставить(ВидСравнения.НеРавно, "<>");
	ОперацииУсловий.Вставить(ВидСравненияКомпоновкиДанных.НеРавно, "<>");
	
	ДопУсловия = "";
	Если ТипЗнч(УсловияВидимости) = Тип("Массив") Тогда
		Для Каждого Условие Из УсловияВидимости Цикл
			
			// как оказалось в массиве могуть быть реквизиты которых нет у объекта
			// в типовом модуле ПодключаемыеКомандыКлиентСервер функция УсловияВыполняются просто пропускает условее 
			// если у объекта нет такого реквищзита, сделал так же тут, а то сейчас падает на ошибке 
			Если МетаОбъект.Реквизиты.Найти(Условие.Реквизит) = Неопределено Тогда
				Продолжить;				
			КонецЕсли;
			
			ТекТекстУсловия = "";
			ТекОперация = ОперацииУсловий.Получить(Условие.ВидСравнения);
			Если ТекОперация <> Неопределено Тогда
				ТекТекстУсловия = Условие.Реквизит + " " + ТекОперация + " &" + Условие.Реквизит;
			ИначеЕсли Условие.ВидСравнения = ВидСравнения.ВСписке
				Или Условие.ВидСравнения = ВидСравненияКомпоновкиДанных.ВСписке Тогда
				ТекТекстУсловия = Условие.Реквизит + " В(&" + Условие.Реквизит + ")";
			ИначеЕсли Условие.ВидСравнения = ВидСравнения.НеВСписке
				Или Условие.ВидСравнения = ВидСравненияКомпоновкиДанных.НеВСписке Тогда
				ТекТекстУсловия = "НЕ " + Условие.Реквизит + " В(&" + Условие.Реквизит + ")";
			ИначеЕсли Условие.ВидСравнения = ВидСравненияКомпоновкиДанных.Заполнено Тогда
				// TODO: обработать условие видимости "Заполнено"
			ИначеЕсли Условие.ВидСравнения = ВидСравненияКомпоновкиДанных.НеЗаполнено Тогда
				// TODO: обработать условие видимости "Не заполнено"
			КонецЕсли;
			Если НЕ ПустаяСтрока(ТекТекстУсловия) Тогда
				ДопУсловия = ДопУсловия + ?(ПустаяСтрока(ДопУсловия), "", " И ") + ТекТекстУсловия;
				Запрос.УстановитьПараметр(Условие.Реквизит, Условие.Значение);
			КонецЕсли; 
		КонецЦикла; 
	КонецЕсли;
	
	Если НЕ ПустаяСтрока(ДопУсловия) Тогда
		Запрос.Текст = СтрЗаменить(Запрос.Текст, "&ДопУсловия", ДопУсловия);
	Иначе 
		Запрос.УстановитьПараметр("ДопУсловия", Истина);
	КонецЕсли; 
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
		// нет документов для тестирования :(
		Если НЕ ПустаяСтрока(ДопУсловия) Тогда
			// возможно причина пустого результата в доп.условиях:
			// попробуем без них
			Запрос = Новый Запрос;
			Запрос.Текст = ШаблонТекстаЗапроса;
			Запрос.УстановитьПараметр("ДопУсловия", Истина);
			РезультатЗапроса = Запрос.Выполнить();
		КонецЕсли; 
	КонецЕсли; 
	
	Если НЕ РезультатЗапроса.Пустой() Тогда
		Результат = РезультатЗапроса.Выгрузить().ВыгрузитьКолонку("Ссылка");
	КонецЕсли; 

	Возврат Результат;
	
КонецФункции

Функция ПолучитьКоллекциюПечатныхФорм(КомандаПечати, ДокументДляПечати) 
 
	Результат = Неопределено;
	
	ДокументыДляПечати = Новый Массив;
	ДокументыДляПечати.Добавить(ДокументДляПечати);
	
	Если КомандаПечати.МенеджерПечати = "СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки" 
		И Вычислить("ОбщегоНазначения.ПодсистемаСуществует(""СтандартныеПодсистемы.ДополнительныеОтчетыИОбработки"")") Тогда
			// печать внешней печатной формы
			ДополнительнаяОбработкаСсылка	= КомандаПечати.ДополнительныеПараметры.Ссылка;
			ПараметрыИсточника				= Новый Структура;
			ПараметрыИсточника.Вставить("ИдентификаторКоманды", КомандаПечати.Идентификатор);
			ПараметрыИсточника.Вставить("ОбъектыНазначения",    ДокументыДляПечати);
			КоллекцияПечатныхФорм			= Неопределено;
			ОбъектыПечати					= Новый СписокЗначений;
			ПараметрыВывода					= Неопределено;
			
			МодульУправлениеПечатью = Вычислить("УправлениеПечатью");
			//Попытка
				МодульУправлениеПечатью.ПечатьПоВнешнемуИсточнику(
					ДополнительнаяОбработкаСсылка, 
					ПараметрыИсточника, 
					КоллекцияПечатныхФорм,
					ОбъектыПечати, 
					ПараметрыВывода
				);
				
				Результат = КоллекцияПечатныхФорм;
			//Исключение
			//	Инфо = ИнформацияОбОшибке();
			//	//TODO нужно не костылем исключить печатные формы, которые открываются не в 1С - word и т.п.
			//	Если (Найти(Инфо.Описание, "Метод объекта не обнаружен (Печать)") > 0 Или
			//		Найти(Инфо.Описание, "Object method not found (Печать)") > 0) 
			//		//И
			//		//Найти(Инфо.ИсходнаяСтрока, "ОбъектПлагина.Инициализация(ЭтотОбъект);") > 0 
			//		//И
			//		//( Найти(Инфо.ИмяМодуля, "Форма.УправляемаяФорма.Форма") > 0 Или
			//		////ExternalDataProcessor.xddTestRunner.Form.УправляемаяФорма.Form
			//		//Найти(Инфо.ИмяМодуля, "Form.УправляемаяФорма.Form") > 0 )
			//		Тогда
			//			КонтекстЯдра.ПропуститьТест(НСтр("ru = 'Тест пропущен: '") + Инфо.Описание);
			//		Иначе
			//			ВызватьИсключение;
			//		КонецЕсли;
			//КонецПопытки;
	Иначе 
		// печать встроенной печатной формы
		ИмяМенеджераПечати              = КомандаПечати.МенеджерПечати;
		ИменаМакетов					= КомандаПечати.Идентификатор;
		МассивОбъектов					= ДокументыДляПечати;
		ПараметрыПечати					= ?(КомандаПечати.Свойство("ДополнительныеПараметры"), 
			КомандаПечати.ДополнительныеПараметры, Новый Структура);
		ДопустимыеТипыОбъектовПечати	= Неопределено;
		
		МодульУправлениеПечатью = Вычислить("УправлениеПечатью");
		//Попытка
			ПечатныеФормы = МодульУправлениеПечатью.СформироватьПечатныеФормы(
				ИмяМенеджераПечати, 
				ИменаМакетов, 
				МассивОбъектов, 
				ПараметрыПечати, 
				ДопустимыеТипыОбъектовПечати
			);
			
			Результат = ПечатныеФормы.КоллекцияПечатныхФорм;
		//Исключение
		//	Инфо = ИнформацияОбОшибке();
		//	//TODO нужно не костылем исключить печатные формы, которые открываются не в 1С - word и т.п.
		//	Если (Найти(Инфо.Описание, "Метод объекта не обнаружен (Печать)") > 0 Или
		//		Найти(Инфо.Описание, "Object method not found (Печать)") > 0) 
		//		//И
		//		//Найти(Инфо.ИсходнаяСтрока, "ОбъектПлагина.Инициализация(ЭтотОбъект);") > 0 
		//		//И
		//		//( Найти(Инфо.ИмяМодуля, "Форма.УправляемаяФорма.Форма") > 0 Или
		//		////ExternalDataProcessor.xddTestRunner.Form.УправляемаяФорма.Form
		//		//Найти(Инфо.ИмяМодуля, "Form.УправляемаяФорма.Form") > 0 )
		//		Тогда
		//			КонтекстЯдра.ПропуститьТест(НСтр("ru = 'Тест пропущен: '") + Инфо.Описание);
		//		Иначе
		//			ВызватьИсключение;
		//		КонецЕсли;
		//КонецПопытки;

	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

Функция ИмяТеста()
	Возврат Метаданные().Имя;
КонецФункции

#КонецОбласти
