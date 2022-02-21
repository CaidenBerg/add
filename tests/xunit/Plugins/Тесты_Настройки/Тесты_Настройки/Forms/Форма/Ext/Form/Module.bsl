﻿&НаКлиенте
Перем КонтекстЯдра;
&НаКлиенте
Перем Ожидаем;
&НаКлиенте
Перем Утверждения;
&НаКлиенте
Перем Настройки;

// { интерфейс тестирования

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	Настройки = КонтекстЯдра.Плагин("Настройки");
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт
	
	НаборТестов.СтрогийПорядокВыполнения();
	
	НаборТестов.НачатьГруппу("Функции плагина Настройки");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ПолучитьНастройки", , "Проверка работы функции ПолучитьНастройки");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ДобавитьНастройку", , "Проверка работы функции ДобавитьНастройку");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ДобавитьНастройки", , "Проверка работы функции ДобавитьНастройки");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ЕстьЗначениеНастройки", , "Проверка работы функции ЕстьЗначениеНастройки");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка", , "Проверка работы функции ЕстьНастройка");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка_СценарийИзОписанияСтарый", , "Проверка работы функции ЕстьНастройка по сценарию из старого описания");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка_СценарийИзОписанияНовый", , "Проверка работы функции ЕстьНастройка по сценарию из нового описания");
	
КонецПроцедуры

// } интерфейс тестирования


// { блок юнит-тестов - сами тесты

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ПолучитьНастройки() Экспорт
	
	Настройки.Обновить();
	
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что пустая структура, но это не так!")
		.ИмеетТип("ФиксированнаяСтруктура");
	
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ДобавитьНастройку() Экспорт
	
	Настройки.Обновить();
	
	НастройкиДо = Настройки.ПолучитьНастройки();
	КоличествоДо = НастройкиДо.Количество();
	
	Настройки.ДобавитьНастройку("Ключ99", 99);
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что после добавления в настройках один элемент, но это не так.")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 1);
		
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ДобавитьНастройки() Экспорт
	
	Настройки.Обновить();
	
	НастройкиДанные = Настройки.ПолучитьНастройки();
	КоличествоДо = НастройкиДанные.Количество();
	
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что после обновления настроек они не содержат элементов, но это не так.")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 0);
	
	Настройки.ДобавитьНастройки(НастройкиДанныеКакСтруктура());
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что после добавления в настройках три элемента, но это не так.")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 3);
		
	Настройки.ДобавитьНастройки(Новый Структура());
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что после добавления пустых настроек текущие настройки не изменятся, но это не так.")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 3);
		
	Настройки.ДобавитьНастройки("abc");
	НастройкиДанные = Настройки.ПолучитьНастройки();
	Ожидаем.Что(НастройкиДанные, "Ожидали, что после добавления некорректных настроек текущие настройки не изменятся, но это не так.")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 3);
		
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ЕстьЗначениеНастройки() Экспорт
	Перем бЕстьНастройка, ЗначениеНастройки;
	
	Настройки.ДобавитьНастройки(НастройкиДанныеКакСтруктура());
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("НесуществующийКлюч", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для несуществующего ключа настроек не будет найдено настроек, но это не так!")
		.ЭтоЛожь();
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("Ключ21", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для вложенного ключа без указания полного пути не будет найдено настроек, но это не так!")
		.ЭтоЛожь();
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("Ключ1", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для ключа Ключ1 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что для ключа Ключ1 значение настройки число 1, но это не так")
		.ИмеетТип("Число")
		.Равно(1);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("Ключ2.Ключ21", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для пути Ключ2.Ключ21 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что для пути Ключ2.Ключ21 значение настройки число 21, но это не так")
		.ИмеетТип("Число")
		.Равно(21);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("Ключ3.Ключ32", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для пути Ключ3.Ключ32 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что для пути Ключ3.Ключ32 значение настройки непустая Структура настроек, но это не так")
		.ИмеетТип("Структура")
		.НЕ_().ИмеетДлину(0);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьЗначениеНастройки("Ключ3.Ключ32.Ключ321", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для пути Ключ3.Ключ32.Ключ321 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что для пути Ключ3.Ключ32.Ключ321 значение настройки число 321, но это не так")
		.ИмеетТип("Число")
		.Равно(321);
	
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка() Экспорт
	Перем бЕстьНастройка, ЗначениеНастройки;
	
	Настройки.Обновить();
	
	Настройки.ДобавитьНастройки(НастройкиДанныеКакСтруктура());
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("НесуществующийКлюч", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для несуществующего ключа настроек не будет найдено настроек, но это не так!")
		.ЭтоЛожь();
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ21", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для вложенного ключа без указания полного пути не будет найдено настроек, но это не так!")
		.ЭтоЛожь();
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ1", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для ключа Ключ1 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что метод работает неправильно и для ключа Ключ1 значение настройки НЕ число 1, но это не так")
		.Не_().ИмеетТип("Число")
		.Не_().Равно(1);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ2.Ключ21", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для пути Ключ2.Ключ21 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что метод работает неправильно и для пути Ключ2.Ключ21 значение настройки НЕ число 21, но это не так")
		.Не_().ИмеетТип("Число")
		.Не_().Равно(21);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ3.Ключ32", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для пути Ключ3.Ключ32 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что метод работает неправильно и для пути Ключ3.Ключ32 значение настройки НЕ Структура, но это не так")
		.ЭтоНе().ИмеетТип("Структура");
	
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка_СценарийИзОписанияСтарый() Экспорт
	Перем бЕстьНастройка, ЗначениеНастройки;
	
	Настройки.Обновить();
	
	Структура = Новый Структура("Ключ1", Новый Структура("Ключ2", Новый Структура("Ключ3", 42)));
	Настройки.ДобавитьНастройки(Структура);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ1.Ключ2.Ключ3", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для ключа Ключ1.Ключ2.Ключ3 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что метод работает неправильно и для ключа Ключ1.Ключ2.Ключ3 значение настройки НЕ число 42, но это не так")
		.Не_().ИмеетТип("Число")
		.Не_().Равно(42);
	
КонецПроцедуры

&НаКлиенте
Процедура ТестДолжен_ПроверитьРаботуФункции_ЕстьНастройка_СценарийИзОписанияНовый() Экспорт
	Перем бЕстьНастройка, ЗначениеНастройки;
	
	Настройки.Обновить();
	
	НастройкиДанные = Настройки.ПолучитьНастройки();
	КоличествоДо = НастройкиДанные.Количество();
	
	Структура = Новый Структура("Ключ1", Новый Структура("Ключ2", Новый Структура("Ключ3", 42)));
	Настройки.ДобавитьНастройки(Структура);
	
	ЗначениеНастройки = Неопределено;
	бЕстьНастройка = Настройки.ЕстьНастройка("Ключ1.Ключ2.Ключ3", ЗначениеНастройки);
	Ожидаем.Что(бЕстьНастройка, "Ожидали, что для ключа Ключ1.Ключ2.Ключ3 будет найдена настройка, но это не так!")
		.ЭтоИстина();
	Ожидаем.Что(ЗначениеНастройки, "Ожидали, что для ключа Ключ1.Ключ2.Ключ3 значение это структура, кразмером 1, но это не так")
		.ИмеетТип("ФиксированнаяСтруктура")
		.ИмеетДлину(КоличествоДо + 1);
	
КонецПроцедуры


// } блок юнит-тестов - сами тесты


// { Служебные методы

&НаКлиенте
Функция НастройкиДанныеКакСтруктура()
	Перем стНастройкиДанные;
	
	стНастройкиДанные = Новый Структура();
	стНастройкиДанные.Вставить("Ключ1", 1);
	стНастройкиДанные.Вставить("Ключ2", Новый Структура("Ключ21, Ключ22", 21, 22));
	стНастройкиДанные.Вставить("Ключ3", Новый Структура("Ключ31, Ключ32", 31, Новый Структура("Ключ321", 321)));
	
	Возврат стНастройкиДанные;
КонецФункции

// } Служебные методы