﻿//начало текста модуля
&НаКлиенте
Перем юТест;
&НаКлиенте
Перем МаксКоличествоСекундПодключения,ТекКоличествоСекундПодключения;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	юТест = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	// описание шагов
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЕстьКонфигурация(Парам01)","ЕстьКонфигурация","есть Конфигурация 'Бухгалтерия 3.0 (Такси)'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗапускаюСеанс1ССКлючомTestClient()","ЯЗапускаюСеанс1ССКлючомTestClient","я запускаю сеанс 1С с ключом TestClient");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СуществуетКонтрагент(Парам01)","СуществуетКонтрагент","существует Контрагент 'тестовый Контрагент'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СуществуетДоговорСДатойДоговора(Парам01,Парам02)","СуществуетДоговорСДатойДоговора","существует договор 'тестовый договор Контрагента 1' с датой договора 01.01.2014");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СуществуетУслуга(Парам01)","СуществуетУслуга","существует услуга 'тестовая услуга 1'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СуществуетДокументОтПоКонтрагентуПоДоговоруПоУслугеНаСуммуРуб(Парам01,Парам02,Парам03,Парам04,Парам05,Парам06)","СуществуетДокументОтПоКонтрагентуПоДоговоруПоУслугеНаСуммуРуб","существует Документ 'РеализацияТоваровИУслуг1' от 01.01.2014  по контрагенту 'тестовый Контрагент' по договору 'тестовый договор Контрагента 1' по услуге 'тестовая услуга 1' на сумму 1000 руб.");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВведенаУчетнаяПолитика()","ВведенаУчетнаяПолитика","Введена учетная политика");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ХочетОплатитьСуммуРуб(Парам01,Парам02)","ХочетОплатитьСуммуРуб","'тестовый Контрагент' хочет оплатить сумму 1100 руб.");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФиксируетсяОплатаПоПоДоговоруНаСуммуРублей(Парам01,Парам02,Парам03)","ФиксируетсяОплатаПоПоДоговоруНаСуммуРублей","фиксируется оплата по  'тестовый Контрагент' по договору 'тестовый договор Контрагента 1'  на сумму 1100 рублей");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФормируетсяПроводкаПоСчетуНаСуммуГдеЗаполненоКакДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05)","ФормируетсяПроводкаПоСчетуНаСуммуГдеЗаполненоКакДокументОт","формируется проводка по счету '62.01' на сумму 1000, где 'субконто3' заполнено как Документ 'РеализацияТоваровИУслуг1' от 01.01.2014");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"НаСчетеОстаетсяДолгВРазмереРублейПоДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05)","НаСчетеОстаетсяДолгВРазмереРублейПоДокументОт","на счете '62.01'  остается долг в размере 200 рублей по 'субконто3' Документ 'РеализацияТоваровИУслуг2' от 02.01.2014");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ФормируетсяПроводкаАвансаПоСчетуНаСуммуГдеЗаполненоКакСамДокументПоступленияОплаты(Парам01,Парам02,Парам03)","ФормируетсяПроводкаАвансаПоСчетуНаСуммуГдеЗаполненоКакСамДокументПоступленияОплаты","формируется проводка аванса по счету '62.02' на сумму 700, где 'субконто3' заполнено как сам документ поступления оплаты");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



&НаКлиенте
Процедура Подождать(Парам = 200)
	
	ПромДат = ТекущаяУниверсальнаяДатаВМиллисекундах() + Парам;
	//ПромДат = ТекущаяДата() + Парам;
	Пока ТекущаяУниверсальнаяДатаВМиллисекундах() < ПромДат Цикл
		Продолжить;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
//есть Конфигурация 'Бухгалтерия 3.0 (Такси)'
//@ЕстьКонфигурация(Парам01)
Процедура ЕстьКонфигурация(ИмяКонфигурации) Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьСоединениеССеансомTESTCLIENT()
	//юТест.ПосмотретьЗначение(Контекст);
	ТестируемоеПриложение = КонтекстСохраняемый.ТестируемоеПриложение;
	
	
	ТестируемоеПриложение.УстановитьСоединение();
	ОтключитьОбработчикОжидания("УстановитьСоединениеССеансомTESTCLIENT");
	Сообщить("Подключились к сеансу TESTCLIENT!!!");
	
	Сообщить("Ищу главное окно.");
	
	ГлавноеОкноТестКлиента = ТестируемоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"),,,30);
	
	
	//ОкноПриложенияОсновное = Неопределено;
	//КлиентсткиеОкнаТестируемогоПриложения = ТестируемоеПриложение.ПолучитьПодчиненныеОбъекты();
	//Для Каждого ТестируемоеОкно Из КлиентсткиеОкнаТестируемогоПриложения Цикл
	//	Если ТестируемоеОкно.Основное Тогда
	//		ОкноПриложенияОсновное = ТестируемоеОкно;
	//		Прервать;
	//	КонецЕсли;
	//КонецЦикла;
	//
	//
	//ГлавноеОкноТестКлиента = ОкноПриложенияОсновное;
	
	Сообщить("ТипЗнч ГлавноеОкноТестКлиента= " + ТипЗнч(ГлавноеОкноТестКлиента));
	
	Сообщить("Пытаюсь активизировать гланое окно.");
	ГлавноеОкноТестКлиента.Активизировать();
	КонтекстСохраняемый.Вставить("ГлавноеОкноТестКлиента",ГлавноеОкноТестКлиента);
	
	
	
	
КонецПроцедуры


&НаКлиенте
//я запускаю сеанс 1С с ключом TestClient
//@ЯЗапускаюСеанс1ССКлючомTestClient()
Процедура ЯЗапускаюСеанс1ССКлючомTestClient() Экспорт
	Если КонтекстСохраняемый.Свойство("ТестируемоеПриложение") Тогда
		Если КонтекстСохраняемый.ТестируемоеПриложение <> Неопределено Тогда
			КонтекстСохраняемый.ТестируемоеПриложение.УстановитьСоединение();
			Сообщить("ТипЗнч КонтекстСохраняемый.ТестируемоеПриложение = " + ТипЗнч(КонтекстСохраняемый.ТестируемоеПриложение));
			Попытка
				ГлавноеОкноТестКлиента = КонтекстСохраняемый.ТестируемоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"),"*Демонстрационная база*",,2);
			Исключение
				ГлавноеОкноТестКлиента = Неопределено;
			КонецПопытки;
			
			Если ГлавноеОкноТестКлиента <> Неопределено Тогда
				Возврат;
			КонецЕсли;	 
		КонецЕсли;	 
	КонецЕсли;	 
	
	
	СисИнфо = Новый СистемнаяИнформация; 
	
	ВерсияПриложения = СисИнфо.ВерсияПриложения;
	ПутьК1С = "C:\Program Files (x86)\1cv8\" + ВерсияПриложения + "\bin\1cv8.exe";
	ФайлПроверкаСуществования = Новый Файл(ПутьК1С);
	Если НЕ ФайлПроверкаСуществования.Существует() Тогда
		ВызватьИсключение "Не нашел путь к 1cv8c.exe: " + ПутьК1С;
	КонецЕсли;	 
	
	КаталогБазы = СтрокаСоединенияИнформационнойБазы();
	КаталогБазы = СтрЗаменить(КаталогБазы,"File=","");
	КаталогБазы = СтрЗаменить(КаталогБазы,";","");
	
	СтрокаЗапуска = """" + ПутьК1С + """ ENTERPRISE /F" + КаталогБазы  +  "/N""Абдулов (директор)""" + " /TESTCLIENT /RunModeManagedApplication";
	
	Сообщить("СтрокаЗапуска="+СтрокаЗапуска);

	ЗапуститьСистему(СтрокаЗапуска);
	
	ТипЗначения = Тип("ТестируемоеПриложение");
	ПараметрыОбъекта = Новый Массив;
	ПараметрыОбъекта.Добавить("localhost");
	ТестируемоеПриложение = Новый (ТипЗначения,ПараметрыОбъекта);
	
	КонтекстСохраняемый.Вставить("ТестируемоеПриложение",ТестируемоеПриложение);
	
	
	
	//юТест.ЗапретитьВыполнениеШагов();
	
	МаксКоличествоСекундПодключения = 20;
	ТекКоличествоСекундПодключения  = 0;
	
	
	УстановитьСоединениеССеансомTESTCLIENT();
	//ПодключитьОбработчикОжидания("УстановитьСоединениеССеансомTESTCLIENT",1);
	
	
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УдалитьВсехКонтрагентовСТакимИменемИИхДоговора(ИмяКонтрагента)
	
	ИмяПользователя = ИмяПользователя();
	Если ИмяПользователя <> "Абдулов (директор)" Тогда
		ВызватьИсключение "Сработала защита по имени пользователя";
	КонецЕсли;	 
	
	
	//удалим созданные предыдущими тестами договоры - начало
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДоговорыКонтрагентов.Ссылка
		|ИЗ
		|	Справочник.ДоговорыКонтрагентов КАК ДоговорыКонтрагентов
		|ГДЕ
		|	ДоговорыКонтрагентов.Владелец.Наименование = &Наименование";

	Запрос.УстановитьПараметр("Наименование", ИмяКонтрагента);

	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		ДоговорОбъект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
		ДоговорОбъект.Удалить();
	КонецЦикла;
	//удалим созданные предыдущими тестами договоры - конец
	
	//удалим созданные предыдущими тестами контрагентов - начало
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Контрагенты.Ссылка
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты
		|ГДЕ
		|	Контрагенты.Наименование = &Наименование";

	Запрос.УстановитьПараметр("Наименование", ИмяКонтрагента);

	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		КонтрагентОбъект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
		КонтрагентОбъект.Удалить();
	КонецЦикла;
	//удалим созданные предыдущими тестами контрагентов - начало
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УдалитьДокументыОказанияУслуг(Наим)
	
	ИмяПользователя = ИмяПользователя();
	Если ИмяПользователя <> "Абдулов (директор)" Тогда
		ВызватьИсключение "Сработала защита по имени пользователя";
	КонецЕсли;	 
	
	//удалим созданные предыдущими тестами договоры - начало
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияТоваровУслуг.Ссылка
		|ИЗ
		|	Документ.РеализацияТоваровУслуг КАК РеализацияТоваровУслуг
		|ГДЕ
		|	РеализацияТоваровУслуг.Дата >= &Дата";

	Запрос.УстановитьПараметр("Дата", '20140101');

	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Объект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
		Объект.Удалить();
	КонецЦикла;
	//удалим созданные предыдущими тестами договоры - конец
КонецПроцедуры


&НаКлиенте
//существует Контрагент 'тестовый Контрагент'
//@СуществуетКонтрагент(Парам01)
Процедура СуществуетКонтрагент(ИмяКонтрагента) Экспорт
	УдалитьДокументыОказанияУслуг(ИмяКонтрагента);
	Если КонтекстСохраняемый.Свойство("Контрагент") Тогда
		Возврат;
	КонецЕсли;	 
	
	УдалитьВсехКонтрагентовСТакимИменемИИхДоговора(ИмяКонтрагента);
	
	
	
	
	ГлавноеОкноТестКлиента = КонтекстСохраняемый.ГлавноеОкноТестКлиента;
	ТестируемоеПриложение  = КонтекстСохраняемый.ТестируемоеПриложение;
	
	Подождать();
	ГлавноеОкноТестКлиента.ВыполнитьКоманду("e1cib/list/Справочник.Контрагенты");
	
	Подождать();
	ГлавноеОкноТестКлиента.ВыполнитьКоманду("e1cib/command/Справочник.Контрагенты.Команда.Создать");
	
	ФормаКонтрагента = ТестируемоеПриложение.НайтиОбъект(Тип("ТестируемаяФорма"), "Контрагент (создание)*");
	
	Подождать();
	Поле = ФормаКонтрагента.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Наименование");
	Поле.Активизировать();	
	
	Подождать();
	Поле.ВвестиТекст(ИмяКонтрагента);
	
	Поле = ФормаКонтрагента.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Полное наименование");
	Поле.Активизировать();	
	
	
	Подождать();
	КнопкаЗаписатьИЗакрыть = ФормаКонтрагента.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Записать");
	КнопкаЗаписатьИЗакрыть.Нажать();	
	
	КонтекстСохраняемый.Вставить("Контрагент",Истина);
КонецПроцедуры

&НаКлиенте
//существует договор 'тестовый договор Контрагента 1' с датой договора 01.01.2014
//@СуществуетДоговорСДатойДоговора(Парам01,Парам02)
Процедура СуществуетДоговорСДатойДоговора(ИмяДоговора,ДатаДоговора) Экспорт
	Если КонтекстСохраняемый.Свойство("Договор") Тогда
		Возврат;
	КонецЕсли;	 
	
	
	ТестовоеПриложение = КонтекстСохраняемый.ТестируемоеПриложение;
	
	Подождать();
	Если Контекст.Свойство("ОкноПриложенияТестовыйКонтрагентКонтрагент") Тогда
		ОкноПриложенияТестовыйКонтрагентКонтрагент = Контекст.ОкноПриложенияТестовыйКонтрагентКонтрагент;
	Иначе	
		ОкноПриложенияТестовыйКонтрагентКонтрагент = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "тестовый Контрагент (Контрагент)", , 30);
		Контекст.Вставить("ОкноПриложенияТестовыйКонтрагентКонтрагент",ОкноПриложенияТестовыйКонтрагентКонтрагент);
	КонецЕсли;	 
	
	
	ОкноПриложенияТестовыйКонтрагентКонтрагент.Активизировать();
	
	Подождать();
	ОкноПриложенияТестовыйКонтрагентКонтрагентCommandInterface = ОкноПриложенияТестовыйКонтрагентКонтрагент.ПолучитьКомандныйИнтерфейс();
	КнопкаКомандногоИнтерфейсаДоговоры = ОкноПриложенияТестовыйКонтрагентКонтрагентCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Договоры");
	Подождать();
	КнопкаКомандногоИнтерфейсаДоговоры.Нажать();

	Подождать();
	ОкноПриложенияТестовыйКонтрагентКонтрагентФормаДоговоры = ОкноПриложенияТестовыйКонтрагентКонтрагент.НайтиОбъект(Тип("ТестируемаяФорма"), "Договоры");
	КнопкаСоздать = ОкноПриложенияТестовыйКонтрагентКонтрагентФормаДоговоры.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Создать");
	Подождать();
	КнопкаСоздать.Нажать();
	
	
	ОкноПриложенияДоговорСоздание = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Договор (создание)", , 30);
	ОкноПриложенияДоговорСозданиеФормаДоговорСоздание = ОкноПриложенияДоговорСоздание.НайтиОбъект(Тип("ТестируемаяФорма"), "Договор (создание)");
	
	ПолеНомерДоговора = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Номер договора");
	Подождать();
	ПолеНомерДоговора.ВвестиТекст(ИмяДоговора);

	ПолеОт = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "от");
	Подождать();
	ПолеОт.Активизировать();

	//ПолеОт.Выбрать();
	Подождать();
	ПолеОт.ВвестиТекст(Формат(ДатаДоговора,"ДФ=dd.MM.yyyy"));
	//ПолеОт.Выбрать();

	
	ПолеНаименование = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Наименование");
	Подождать();
	ПолеНаименование.ВвестиТекст(ИмяДоговора);
	
	
	//ПолеВидДоговора = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Вид договора");
	//ПолеВидДоговора.Активизировать();
	//ПолеВидДоговора.Выбрать();
	//ПолеВидДоговора.ОжидатьФормированияВыпадающегоСписка();
	//ПолеВидДоговора.ВыполнитьВыборИзСпискаВыбора("С поставщиком");
	
	
	ПолеОрганизация = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Организация");
	Подождать();
	//ПолеОрганизация.Активизировать();
	//Подождать();
	ПолеОрганизация.Выбрать();
	ПолеОрганизация.ОжидатьФормированияВыпадающегоСписка();
	Подождать();
	ПолеОрганизация.ВыполнитьВыборИзСпискаВыбора("Андромеда ООО");

	ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.ПерейтиКСледующемуЭлементу();

	ПолеКомментарий = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Комментарий");
	ПолеКомментарий.Активизировать();

	Подождать();
	ПолеКомментарий.ВвестиТекст(ИмяДоговора);

	КнопкаЗаписать = ОкноПриложенияДоговорСозданиеФормаДоговорСоздание.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Записать и закрыть");
	Подождать();
	КнопкаЗаписать.Нажать();
	
	
	КонтекстСохраняемый.Вставить("Договор",Истина);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура УдалитьРанееСозданныеУслугиСпр(Наим)
	ИмяПользователя = ИмяПользователя();
	Если ИмяПользователя <> "Абдулов (директор)" Тогда
		ВызватьИсключение "Сработала защита по имени пользователя";
	КонецЕсли;	 
	
	
	//удалим созданные предыдущими тестами договоры - начало
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Номенклатура.Ссылка
		|ИЗ
		|	Справочник.Номенклатура КАК Номенклатура
		|ГДЕ
		|	Номенклатура.Наименование = &Наименование";

	Запрос.УстановитьПараметр("Наименование", Наим);

	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Объект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
		Объект.Удалить();
	КонецЦикла;
	//удалим созданные предыдущими тестами договоры - конец
	
КонецПроцедуры


&НаКлиенте
Процедура СозданиеУслуги(ТестовоеПриложение,ИмяУслуги)

	
	ОкноПриложенияОсновное = Неопределено;
	КлиентсткиеОкнаТестируемогоПриложения = ТестовоеПриложение.ПолучитьПодчиненныеОбъекты();
	Для Каждого ТестируемоеОкно Из КлиентсткиеОкнаТестируемогоПриложения Цикл
		Если ТестируемоеОкно.Основное Тогда
			ОкноПриложенияОсновное = ТестируемоеОкно;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	//ОкноПриложенияОсновноеCommandInterface = ОкноПриложенияОсновное.ПолучитьКомандныйИнтерфейс();
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаНоменклатура = ОкноПриложенияОсновноеCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Номенклатура");
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаНоменклатура.Нажать();

	
	ОкноПриложенияОсновное.ВыполнитьКоманду("e1cib/list/Справочник.Номенклатура");
	
	ОкноПриложенияНоменклатура = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Номенклатура", , 30);
	ОкноПриложенияНоменклатураФормаНоменклатура = ОкноПриложенияНоменклатура.НайтиОбъект(Тип("ТестируемаяФорма"), "Номенклатура");
	Подождать();
	ОкноПриложенияНоменклатураФормаНоменклатура.Активизировать();

	ОкноПриложенияНоменклатураФормаНоменклатураКнопкаСоздать = ОкноПриложенияНоменклатураФормаНоменклатура.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Создать");
	Подождать();
	ОкноПриложенияНоменклатураФормаНоменклатураКнопкаСоздать.Нажать();

	ОкноПриложенияНоменклатураСоздание = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Номенклатура (создание)", , 30);
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСоздание = ОкноПриложенияНоменклатураСоздание.НайтиОбъект(Тип("ТестируемаяФорма"), "Номенклатура (создание)");
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеНаименование = ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Наименование");
	Подождать();
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеНаименование.ВвестиТекст(ИмяУслуги);

	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеВходитВГруппу = ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Входит в группу");
	Подождать();
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеВходитВГруппу.Активизировать();

	//ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеВходитВГруппу.ОжидатьФормированияВыпадающегоСписка();

	//Подождать();
	//ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеВходитВГруппу.ВыполнитьВыборИзСпискаВыбора("Услуги");
	
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеПолеВходитВГруппу.ВвестиТекст("Услуги");

	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеКнопкаЗаписатьИЗакрыть = ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСоздание.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Записать и закрыть");
	Подождать();
	ОкноПриложенияНоменклатураСозданиеФормаНоменклатураСозданиеКнопкаЗаписатьИЗакрыть.Нажать();

КонецПроцедуры



&НаКлиенте
//существует услуга 'тестовая услуга 1'
//@СуществуетУслуга(Парам01)
Процедура СуществуетУслуга(ИмяУслуги) Экспорт
	
	Если КонтекстСохраняемый.Свойство("Услуга") Тогда
		Возврат;
	КонецЕсли;	 
	
	УдалитьРанееСозданныеУслугиСпр(ИмяУслуги);
	
	ТестовоеПриложение = КонтекстСохраняемый.ТестируемоеПриложение;
	СозданиеУслуги(ТестовоеПриложение,ИмяУслуги);
	
	
	КонтекстСохраняемый.Вставить("Услуга","");

КонецПроцедуры

&НаКлиенте
Процедура СозданиеОказаниеУслуги(ТестовоеПриложение,ИмяУслуги,Сумма,ДатаДок)

	
	ОкноПриложенияОсновное = Неопределено;
	КлиентсткиеОкнаТестируемогоПриложения = ТестовоеПриложение.ПолучитьПодчиненныеОбъекты();
	Для Каждого ТестируемоеОкно Из КлиентсткиеОкнаТестируемогоПриложения Цикл
		Если ТестируемоеОкно.Основное Тогда
			ОкноПриложенияОсновное = ТестируемоеОкно;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	//ОкноПриложенияОсновноеCommandInterface = ОкноПриложенияОсновное.ПолучитьКомандныйИнтерфейс();
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаРеализацияТоваровИУслуг = ОкноПриложенияОсновноеCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Реализация товаров и услуг");
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаРеализацияТоваровИУслуг.Нажать();

	
	ОкноПриложенияОсновное.ВыполнитьКоманду("e1cib/list/Документ.РеализацияТоваровУслуг");
	//e1cib/list/Документ.РеализацияТоваровУслуг
	
	ОкноПриложенияРеализацияТоваровИУслуг = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Реализация (акты, накладные)", , 30);
	ОкноПриложенияРеализацияТоваровИУслугФормаРеализацияТоваровИУслуг = ОкноПриложенияРеализацияТоваровИУслуг.НайтиОбъект(Тип("ТестируемаяФорма"), "Реализация (акты, накладные)");
	//ОкноПриложенияРеализацияТоваровИУслугФормаРеализацияТоваровИУслугКнопкаУслугиПростаяФорма = ОкноПриложенияРеализацияТоваровИУслугФормаРеализацияТоваровИУслуг.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Услуги (простая форма)");
	//Подождать();
	//ОкноПриложенияРеализацияТоваровИУслугФормаРеализацияТоваровИУслугКнопкаУслугиПростаяФорма.Нажать();

	
	КнопкаУслугиАкт = ОкноПриложенияРеализацияТоваровИУслугФормаРеализацияТоваровИУслуг.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Услуги (акт)");
	КнопкаУслугиАкт.Нажать();
	
	
	
	
	
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслуги = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Реализация услуг: Акт (создание)", , 30);
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемаяФорма"), "Реализация услуг: Акт (создание)");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКонтрагент = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Контрагент");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКонтрагент.Активизировать();

	
	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугАН00000002ОтУслугиФормаРеализацияТоваровИУслугАН00000002ОтУслугиПолеОт = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "от");
	ОкноПриложенияРеализацияТоваровИУслугАН00000002ОтУслугиФормаРеализацияТоваровИУслугАН00000002ОтУслугиПолеОт.ВвестиТекст(Формат(ДатаДок,"ДФ=ddMMyyyy"));
	
	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКонтрагент.ВвестиТекст("тесто");

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКонтрагент.ОжидатьФормированияВыпадающегоСписка();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКонтрагент.ВыполнитьВыборИзСпискаВыбора("тестовый Контрагент (00-000056)");

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетНаОплату = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Счет на оплату");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетНаОплату.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Организация");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация.Активизировать();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация.Выбрать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация.ВвестиТекст("анд");

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация.ОжидатьФормированияВыпадающегоСписка();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеОрганизация.ВыполнитьВыборИзСпискаВыбора("Андромеда ООО (00-000002)");

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"), "Услуги");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеДоговор = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Договор");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеДоговор.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеДоговор.ВвестиТекст("тесто");

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеДоговор.ОжидатьФормированияВыпадающегоСписка();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеДоговор.ВыполнитьВыборИзСпискаВыбора("тестовый договор Контрагента 1 (00-000127)");

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетНаОплату = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Счет на оплату");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетНаОплату.Активизировать();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"), "Услуги");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиКнопкаДобавить = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Добавить");
	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиКнопкаДобавить.Нажать();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеНоменклатура = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Номенклатура");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеНоменклатура.ВвестиТекст(ИмяУслуги);

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеНоменклатура.ОжидатьФормированияВыпадающегоСписка();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеНоменклатура.ВыполнитьВыборИзСпискаВыбора("тестовая услуга 1 (00-00000208)");

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСодержаниеУслуги = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Содержание услуги");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСодержаниеУслуги.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКоличество = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Количество");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКоличество.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеКоличество.ВвестиТекст("1,000");

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеЦена = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Цена");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеЦена.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеЦена.ВвестиТекст(Строка(Сумма));

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСумма = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Сумма");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСумма.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетаУчета = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Счета учета");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиПолеСчетаУчета.Активизировать();

	Подождать();
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиТаблицаУслуги.ЗакончитьРедактированиеСтроки(false);

	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиКнопкаПровестиИЗакрыть = ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслуги.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Провести и закрыть");
	ОкноПриложенияРеализацияТоваровИУслугСозданиеУслугиФормаРеализацияТоваровИУслугСозданиеУслугиКнопкаПровестиИЗакрыть.Нажать();

КонецПроцедуры



&НаКлиенте
//существует Документ 'РеализацияТоваровИУслуг1' от 01.01.2014  по контрагенту 'тестовый Контрагент' по договору 'тестовый договор Контрагента 1' по услуге 'тестовая услуга 1' на сумму 1000 руб.
//@СуществуетДокументОтПоКонтрагентуПоДоговоруПоУслугеНаСуммуРуб(Парам01,Парам02,Парам03,Парам04,Парам05,Парам06)
Процедура СуществуетДокументОтПоКонтрагентуПоДоговоруПоУслугеНаСуммуРуб(ИмяДокумента,ДатаДок,ИмяКонтрагента,ИмяДоговора,ИмяУслуги,Сумма) Экспорт
	
	Если Контекст.Свойство("ОказаниеУслуги") Тогда
		Возврат;
	КонецЕсли;	 
	
	ТестовоеПриложение = КонтекстСохраняемый.ТестируемоеПриложение;
	СозданиеОказаниеУслуги(ТестовоеПриложение,ИмяУслуги,Сумма,ДатаДок);
	
	Если Сумма = 300 Тогда
		Контекст.Вставить("ОказаниеУслуги","");
	КонецЕсли;	 

КонецПроцедуры

&НаКлиенте
//Введена учетная политика
//@ВведенаУчетнаяПолитика()
Процедура ВведенаУчетнаяПолитика() Экспорт
КонецПроцедуры

&НаКлиенте
//'тестовый Контрагент' хочет оплатить сумму 1100 руб.
//@ХочетОплатитьСуммуРуб(Парам01,Парам02)
Процедура ХочетОплатитьСуммуРуб(Парам01,Парам02) Экспорт
КонецПроцедуры

&НаКлиенте
Процедура СоздатьОплату(ТестовоеПриложение,ИмяКонтрагента,ИмяДоговора,Сумма)

	
	ОкноПриложенияОсновное = Неопределено;
	КлиентсткиеОкнаТестируемогоПриложения = ТестовоеПриложение.ПолучитьПодчиненныеОбъекты();
	Для Каждого ТестируемоеОкно Из КлиентсткиеОкнаТестируемогоПриложения Цикл
		Если ТестируемоеОкно.Основное Тогда
			ОкноПриложенияОсновное = ТестируемоеОкно;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	//ОкноПриложенияОсновноеCommandInterface = ОкноПриложенияОсновное.ПолучитьКомандныйИнтерфейс();
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаБанкИКасса = ОкноПриложенияОсновноеCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Банк и касса");
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаБанкИКасса.Нажать();

	
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаБанковскиеВыписки = ОкноПриложенияОсновноеCommandInterface.НайтиОбъект(Тип("ТестируемаяКнопкаКомандногоИнтерфейса"), "Банковские выписки");
	//ОкноПриложенияОсновноеCommandInterfaceКнопкаКомандногоИнтерфейсаБанковскиеВыписки.Нажать();

	
	ОкноПриложенияОсновное.ВыполнитьКоманду("e1cib/list/ЖурналДокументов.БанковскиеВыписки");
	
	ОкноПриложенияБанковскиеВыписки = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Банковские выписки", , 30);
	ОкноПриложенияБанковскиеВыпискиФормаБанковскиеВыписки = ОкноПриложенияБанковскиеВыписки.НайтиОбъект(Тип("ТестируемаяФорма"), "Банковские выписки");
	ОкноПриложенияБанковскиеВыпискиФормаБанковскиеВыпискиКнопкаПоступление = ОкноПриложенияБанковскиеВыпискиФормаБанковскиеВыписки.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Поступление");
	Подождать();
	ОкноПриложенияБанковскиеВыпискиФормаБанковскиеВыпискиКнопкаПоступление.Нажать();

	ОкноПриложенияПоступлениеНаРасчетныйСчетСоздание = ТестовоеПриложение.НайтиОбъект(Тип("ТестируемоеОкноКлиентскогоПриложения"), "Поступление на расчетный счет (создание)", , 30);
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание = ОкноПриложенияПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемаяФорма"), "Поступление на расчетный счет (создание)");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеПлательщик = ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Плательщик");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеПлательщик.Активизировать();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеПлательщик.ВвестиТекст(ИмяКонтрагента);

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеПлательщик.ОжидатьФормированияВыпадающегоСписка();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеПлательщик.ВыполнитьВыборИзСпискаВыбора("тестовый Контрагент (00-000056)");

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеСумма = ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Сумма");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеСумма.Активизировать();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеСумма.ВвестиТекст(Строка(Сумма));

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация = ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемоеПолеФормы"), "Организация");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация.Активизировать();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация.Выбрать();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация.ВвестиТекст("андро");

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация.ОжидатьФормированияВыпадающегоСписка();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеПолеОрганизация.ВыполнитьВыборИзСпискаВыбора("Андромеда ООО (00-000002)");

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.ПерейтиКСледующемуЭлементу();

	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеТаблицаРасшифровкаПлатежа = ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемаяТаблицаФормы"), "РасшифровкаПлатежа");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеТаблицаРасшифровкаПлатежа.Активизировать();

	Подождать();
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеКнопкаПровестиИЗакрыть = ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСоздание.НайтиОбъект(Тип("ТестируемаяКнопкаФормы"), "Провести и закрыть");
	ОкноПриложенияПоступлениеНаРасчетныйСчетСозданиеФормаПоступлениеНаРасчетныйСчетСозданиеКнопкаПровестиИЗакрыть.Нажать();

КонецПроцедуры



&НаСервереБезКонтекста
Процедура УдалитьВсеОплаты()

	
	//удалим созданные предыдущими тестами договоры - начало
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ПоступлениеНаРасчетныйСчет.Ссылка
	|ИЗ
	|	Документ.ПоступлениеНаРасчетныйСчет КАК ПоступлениеНаРасчетныйСчет
	|ГДЕ
	|	ПоступлениеНаРасчетныйСчет.Дата > &Дат";
	Запрос.УстановитьПараметр("Дат", '20140101');
	
	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Объект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
		Объект.Удалить();
	КонецЦикла;
	//удалим созданные предыдущими тестами договоры - конец
	

КонецПроцедуры

&НаКлиенте
//фиксируется оплата по  'тестовый Контрагент' по договору 'тестовый договор Контрагента 1'  на сумму 1100 рублей
//@ФиксируетсяОплатаПоПоДоговоруНаСуммуРублей(Парам01,Парам02,Парам03)
Процедура ФиксируетсяОплатаПоПоДоговоруНаСуммуРублей(ИмяКонтрагента,ИмяДоговора,Сумма) Экспорт
	
	УдалитьВсеОплаты();
	
	ТестовоеПриложение = КонтекстСохраняемый.ТестируемоеПриложение;
	СоздатьОплату(ТестовоеПриложение,ИмяКонтрагента,ИмяДоговора,Сумма);
КонецПроцедуры

&НаКлиенте
//формируется проводка по счету '62.01' на сумму 1000, где 'субконто3' заполнено как Документ 'РеализацияТоваровИУслуг1' от 01.01.2014
//@ФормируетсяПроводкаПоСчетуНаСуммуГдеЗаполненоКакДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05)
Процедура ФормируетсяПроводкаПоСчетуНаСуммуГдеЗаполненоКакДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05) Экспорт
	
КонецПроцедуры

&НаКлиенте
//на счете '62.01'  остается долг в размере 200 рублей по 'субконто3' Документ 'РеализацияТоваровИУслуг2' от 02.01.2014
//@НаСчетеОстаетсяДолгВРазмереРублейПоДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05)
Процедура НаСчетеОстаетсяДолгВРазмереРублейПоДокументОт(Парам01,Парам02,Парам03,Парам04,Парам05) Экспорт
КонецПроцедуры




&НаКлиенте
//формируется проводка аванса по счету '62.02' на сумму 700, где 'субконто3' заполнено как сам документ поступления оплаты
//@ФормируетсяПроводкаАвансаПоСчетуНаСуммуГдеЗаполненоКакСамДокументПоступленияОплаты(Парам01,Парам02)
Процедура ФормируетсяПроводкаАвансаПоСчетуНаСуммуГдеЗаполненоКакСамДокументПоступленияОплаты(Парам01,Парам02,Парам03) Экспорт
КонецПроцедуры
