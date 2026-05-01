# Пиццерия

Информационная система для пиццерии. Демонстрационный экзамен 09.02.07.

## Запуск
1. Установить зависимости: `pip install PyQt6 PyMySQL Pillow`
2. Импортировать БД: `mysql -u root -p pizzeria_pm02 < docs/db.sql`
3. Запустить: `python main.py`

## Тестовые входы
- admin / admin123 (админ)
- manager / manager123 (менеджер)
- client / client123 (клиент)

## Сборка .exe
`pyinstaller --onefile --windowed --add-data "resources;resources" --add-data "ui;ui" main.py`

## Документация
- ER-диаграмма: docs/ER_diagram.pdf
- Блок-схема: docs/block_diagram.pdf

