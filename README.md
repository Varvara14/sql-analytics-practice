# SQL Analytics Practice

Репозиторий с проектами по аналитике на SQL

**Технологии:** PostgreSQL 15+, psql / pgAdmin.

## Проекты

| Проект | Задача | Ключевые SQL-приемы |
|--------|--------|---------------------|
| [01_loyalty_program](01_loyalty_program) | Расчет персональной скидки по частоте заказов | CASE, GROUP BY, ROW_NUMBER |
| [02_product_segmentation](02_product_segmentation) | Функция: найти рестораны по цене и факту посещения | PL/pgSQL, параметры по умолчанию |
| [03_currency_interpolation](03_currency_interpolation) | Пересчет баланса в USD с поиском ближайшего курса | Коррелированные подзапросы, временная логика |
| [04_concurrent_access](04_concurrent_access) | Lost Update и Repeatable Read | Транзакции, уровни изоляции |
| [05_route_optimization](05_route_optimization) | Поиск min/max маршрута коммивояжера | Рекурсивный CTE |

## Как запускать

1. Создайте базу данных PostgreSQL
2. Зайдите в папку проекта → выполните файлы по порядку (01 → 02 → ...)
3. Все запросы проверены на PostgreSQL 15