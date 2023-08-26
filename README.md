СУБД
Використовується SQLite, як у розробці, так і в виробництві.Таблиці, наявні в СУБД (моделі), та їхні асоціації:
Ticket(s)

has many users through bookings
has many bookings

Booking(s)

belongs to user
belongs to ticket

User(s)

has many bookings
has many tickets through bookings

Заповнення бази даних
БД заповнено фальшивими даними за допомогою Gem Faker (подробиці в seeds.rb):

20 квитки
15, які мають дату відправлення протягом 60 днів (з дня написання, 2020-06-02)
2, выдправлення меньше ныж за 2 години
3, для перевірки можливостей пошуку
0 бронювань
1 користувач
Останні 5 квитки призначені для тестування функції, яка:

ви можете придбати квиток, відправлення якого менше ніж через 2 годину, але ви не можете його скасувати
квитки, час відправлення яких минув, видаляються зі списку, як для всіх квитків, так і для користувачів, які купили квитки
Щоб отримати найновіші квитки з цими тестами, я пропоную запустити rake db:seed перед запуском rails s

Автентифікація та використання програми
Виконано з використанням gem "devise". Ви можете переглядати квитки без входу/реєстрації, але щоб придбати квиток, вам потрібно зареєструватися/увійти. Як описано вище, у базу даних занесено 1 тестового користувача, але ви також можете зареєструвати нового користувача. Увійшовши в систему, ви побачите своє ім’я користувача, яке відображається у верхньому правому куті домашньої сторінки (і в заголовку вашого списку бронювань).

Після входу ви зможете переглянути список своїх бронювань, натиснувши «Мої квитки» на головній сторінці. Ви завжди можете повернутися на головну сторінку, натиснувши кнопку «Назад до квитків». Усі квитки та бронювання відображаються в порядку зростання відправлення. Ви можете вийти, натиснувши «Вийти» на головній сторінці.

Купівля квитка
Щоб придбати квиток, потрібно ввести номер картки. Щоб зробити це максимально простим, ми припускаємо, що номер картки – це будь-яке число довжиною 16 (!), лише цифри, без дефісів (-) або символів [a-zA-Z]. Після того, як ви купите квитки (успішно), ви отримаєте підтвердження та деталі вашої покупки. Натисніть «Назад до квитків», щоб повернутися на головну сторінку. Якщо більше немає доступних квитків на поїздку, поруч із цим квитком на головній сторінці ви побачите напис «Більше немає доступних квитків», де зазвичай розташована кнопка КУПИТИ, тобто ви не можете купити квиток, у якому 0 квитків.

Скасування
Щоб скасувати придбаний квиток, натисніть «Мої квитки» на головній сторінці та натисніть «Скасувати» поруч із квитком, який потрібно скасувати. Ви можете зробити це лише за годину до відправлення (якщо до відправлення залишилося менше чим 2 години, ви побачите напис «Занадто пізно для скасування» там, де зазвичай розташована кнопка СКАСУВАТИ). Після скасування квиток зникає зі списку бронювань, а лічильник біля цього квитка на головній сторінці збільшується на 1.
Також реалізована можливість редагувати дані на сторінці квитків, та пошук по критеріям

