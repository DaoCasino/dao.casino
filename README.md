# DAO.Casino

DAO.Casino project on GitHub: https://github.com/DaoCasino

Airalab примет участие в проекте DAO.Casino, в части реализации и развития инвестиционного фонда данного проекта в сети Ethereum. Мы будем придерживаться следующего плана работ.

## Стадия 1. Начало февраля 2017. 
1. На основе релиза DAO factory 0.4 “Investment fund on Blockchain” будет подготовлена начальная инфраструктура умных контрактов в основной сети Ethereum, состоящая из следующих контрактов:
  * Shares. Токен, с помощью которого акционеры могут голосовать за смену контракта, со списком кураторов, а также наложения вето на исполнение конкретного запроса финансирования из фонда кураторами.
  * Shareholder association. Умный контракт, который собственно выполняет функцию контроля голосования акционеров и наложения вето.
  * Blockchain congress. Умный контракт, который выполняет функции контроля списка кураторов и голосования по запросам финансирования.
  * Ether funds. Умный контракт, который хранит эфиры и к которому имеет доступ только активный (выбранный акционерами) контракт  Blockchain congress. 

## Стадия 2. Конец февраля 2017.
1. Демонстрация работы оракла, выполняющего роль генератора случайных чисел с записью в Ethereum Blockchain. 

## Стадия 3. Начало марта 2017.  
1. Публикация результатов тестирования инвестиционного фонда DAO.Casino с обязательными составляющими частями отчёта такими как:
  * Демо на Youtube выполнения основных функций умных контрактов инвестиционного фонда.
  * Список транзакций в формате ссылок на etherscan с комментариями выполненных действий.
2. Реализация шаблона контракта разработчика игры, который автоматически будет распределять прибыль в соответствии с бизнес моделью, описанной в DAO.Casino Whitepaper. 
3. Реализация реестра одобренных кураторами DAO.Casino игр - “Whitelist”. Внесение изменений в данный реестр, включая актуализацию адреса активного контракта разработчика игры могут выполнять только кураторы.  
4. Первый публичный аудит умных контрактов инвестиционного фонда.

## Стадия 4. Конец марта 2017. 
1. Демонстрация наложения вето на решение кураторов акционерами, а также смены кураторов акционерами.
2. Реализация шаблона реестра рефералов игры. Позволяет множеству рефералов работать с каждой игрой.   
3. Демонстрация работы пост-инвестиционной стадии работы DAO.Casino на примере одной взятой игры с примерами транзакций от игроков к контракту разработчика игры и распределения прибыли между 4 сторона контракта. Включает работу реестра “Whitelist”. 
4. Второй публичный аудит умных контрактов инвестиционного фонда.

## Стадия 5. Конец марта 2017. 
1. Генеральная репетиция проведения ICO с 2 исходами:
  * Успешное ICO с переводом средств в распоряжение Blockchain конгресса кураторов.
  * Неудача и возврат средств участникам ICO.

## Стадия 6. Начало апреля 2017.  
1. Генеральная репетиция работы инвестиционного фонда с суммой в 100 Ether и распределения доходов от игроков в 1000 Ether.
