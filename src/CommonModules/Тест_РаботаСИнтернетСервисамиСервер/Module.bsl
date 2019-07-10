// @unit-test
Процедура Тест_МетодУстановитьТелоОтветаИзJSON(Фреймворк) Экспорт
	
	Ответ = Новый HTTPСервисОтвет(200);
	ЭталонJSON = "123fffвап";
	РаботаСИнтернетСервисами.УстановитьТелоОтветаИзJSON(Ответ, ЭталонJSON);
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);
	
	Ответ = Новый HTTPСервисОтвет(200);
	Данные = Новый Структура("Ключ1", "Значение1");
	РаботаСИнтернетСервисами.УстановитьТелоОтветаИзJSON(Ответ, Данные);
	ЭталонJSON =	"{
					|""Ключ1"": ""Значение1""
					|}";
	
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);

КонецПроцедуры

// @unit-test
Процедура Тест_МетодСобытиеЖурналаРегистрацииВТелоОтвета(Фреймворк) Экспорт
	
	Ответ = Новый HTTPСервисОтвет(200);
	Сообщение = "ТекстСообщения1";
	РаботаСИнтернетСервисами.СобытиеЖурналаРегистрацииВТелоОтвета(Ответ, Сообщение);
	ЭталонJSON = "{
				 |""Информация"": {
				 |""Сообщение"": ""ТекстСообщения1""
				 |}
				 |}";
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);
	
	Сообщение = "ТекстСообщения2";
	Информация = Перечисления.УровеньЖурналаРегистрации.Информация;
	РаботаСИнтернетСервисами.СобытиеЖурналаРегистрацииВТелоОтвета(Ответ, Сообщение, Информация);
	ЭталонJSON = "{
				 |""Информация"": {
				 |""Сообщение"": ""ТекстСообщения2""
				 |}
				 |}";
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);

	Сообщение = "ТекстСообщения3";
	Ошибка = Перечисления.УровеньЖурналаРегистрации.Ошибка;
	РаботаСИнтернетСервисами.СобытиеЖурналаРегистрацииВТелоОтвета(Ответ, Сообщение, Ошибка);
	ЭталонJSON = "{
				 |""Ошибка"": {
				 |""Сообщение"": ""ТекстСообщения3""
				 |}
				 |}";
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);

	
	Сообщение = "ТекстСообщения4";
	Информация = Новый Структура();
	РаботаСИнтернетСервисами.СобытиеЖурналаРегистрацииВТелоОтвета(Ответ, Сообщение, Информация);
	ЭталонJSON = "{
				 |""Информация"": {
				 |""Сообщение"": ""ТекстСообщения4""
				 |}
				 |}";
	Фреймворк.ПроверитьРавенство(Ответ.ПолучитьТелоКакСтроку(), ЭталонJSON);

КонецПроцедуры

Функция ОписаниеСервисаПоАдресуВызовСервера(Знач URL) Экспорт
	Возврат РаботаСИнтернетСервисами.ОписаниеСервисаПоАдресу(URL);	
КонецФункции

Функция ОписаниеСервисаВызовСервера(Знач Сервис) Экспорт
	Возврат РаботаСИнтернетСервисами.ОписаниеСервиса(Сервис);	
КонецФункции


//// Эксперименты.
//Процедура Тест_МетодПолученияОписанияВебСервисаПоАдресуСуществует(Фреймворк) Экспорт
//	
//	ГлобальныеПеременные = ПолучитьГлобальныеПеременные(Фреймворк);
//	
//КонецПроцедуры
//
//Функция ПолучитьГлобальныеПеременные(Знач Фреймворк)
//	
//	Если ЗначениеЗаполнено(Фреймворк.КаталогПроекта) Тогда
//		ПутьКФайлу = Фреймворк.КаталогПроекта + "\user_settings.json";
//	Иначе
//		ПутьКФайлу = Фреймворк.КаталогИнструментов + "\user_settings.json";
//	КонецЕсли;
//	
//	Структура = Новый Структура;
//	Файл = Новый Файл(ПутьКФайлу);
//	
//	Если НЕ Файл.Существует() Тогда
//		Возврат Структура;
//	КонецЕсли;
//	
//	ТекЮзер = ТекущийПользовательОС();
//	
//	ЧтениеПеременных = Новый ЧтениеJSON();
//	ЧтениеПеременных.ОткрытьФайл(ПутьКФайлу);
//	ГлобальныеПеременные = ПрочитатьJSON(ЧтениеПеременных, Истина);
//	ЧтениеПеременных.Закрыть();
//	
//	МассивНастроек = ГлобальныеПеременные["userSettings"];
//
//	Для каждого СтрокаПользователя Из МассивНастроек Цикл
//		Если ВРег(СтрокаПользователя["user"]) = ВРег(ТекЮзер) Тогда 
//			СтрокаНастроек = СтрокаПользователя["settings"];
//			Для каждого ПеременнаяПользователя Из СтрокаНастроек Цикл
//				Структура.Вставить(ПеременнаяПользователя.Ключ, ПеременнаяПользователя.Значение);
//			КонецЦикла;
//		КонецЕсли;
//	КонецЦикла;
//	
//	Возврат Структура;
//
//КонецФункции
//
//Функция ТекущийПользовательОС()
//	
//	СисИнфо = Новый СистемнаяИнформация;
//	
//	Если СисИнфо.ТипПлатформы = ТипПлатформы.Windows_x86
//		Или СисИнфо.ТипПлатформы = ТипПлатформы.Windows_x86_64 Тогда
//	
//		ПользовательОС = "";
//		Попытка
//			NetWork = Новый COMObject("wscript.network");
//			ПользовательОС = NetWork.Username; 
//		Исключение
//			Shell = Новый COMОбъект("WScript.Shell");
//			ПапкаПользователя = Shell.ExpandEnvironmentStrings("%UserProfile%");
//			Направление = НаправлениеПоиска.СКонца;
//			СимволРазделителя = "\";
//			ИндексРазделителя = СтрНайти(ПапкаПользователя, СимволРазделителя , Направление);
//			ПользовательОС = Прав(ПапкаПользователя, СтрДлина(ПапкаПользователя) - ИндексРазделителя);
//		КонецПопытки;
//		
//	Иначе
//	КонецЕсли;
//	
//	Возврат ПользовательОС;
//	
//КонецФункции