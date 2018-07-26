admin:
        email: admin@admin.com
        password: administrator

You can use the Backbone.js implementation by changing one setting in `config/settings.yml`
        use_mvc: yes

        Задание
  Базовая (прим. 60% объёма проекта) функциональность проекта описана ниже:

        As guest I want to
        +++     create new account
        +++     log in into my account using email and password
        +++     recover forgotten password
        +++     edit my email and/or password
        As guest I want to
        ---     sign up using my Google account
        ---     sign in using my Google account

        As user I want to:
                view my 10 recent posts at main page sorted by creation date (new posts first)
        +++     create new post with title and content
        +++     view my post with comments sorted by creation date, older comments first
        +++     edit previous post title and/or content
        +++     be able to delete my post
        +++     not be able to delete not my posts

        As user I want to:
        ---    view 10 recent posts of specified user at /username URL (sorted by creation              date)
        +++    view any post of other user with comments sorted by creation date, older                 comments first

        As user I want to
        ---     create new comment (simple text) to post using form at the bottom of post page
        ---     be able to delete my comment
        ---     not be able to delete not my comments

  Дополнительная функциональность (прим. 40% объёма проекта) обсуждается с каждым стажёром индивидуально, в зависимости от выбранной направленности проекта, например, можно дополнительно реализовать:

        +   Использование markdown для редактора публикаций и комментариев
        Уведомления на почту автору публикации при появлении новых комментариев
        Уведомления на почту авторам комментариев при появлении новых комментариев
        Аналитику, например, Google Analitycs
        Работу с геоданными, например, сохранение геопозиции вместе с публикацией
        Возможность экспорта данных аккаунта (публикаций с комментариями)
        Интерфейс администратора для управления пользователями
        Различные тарифные планы (как основу для реализации платных услуг)
        Подключение платёжной системы (для реализации платных тарифных планов)
        Подключения внешних сервисов (Amazon AWS, переводчики, любые сервисы, использующие API)
В проекте обязательно необходимо выделить код, реализующий Presentation Layer и Service Layer, а также использовать паттерны Decorator (Presenter), QueryObject, PageObject, FormObject.

  Рекомендуемые для использования библиотеки:
        +   Devise для аутентификации пользователей
        +   Pundit для создания политик авторизации действий пользователей
        Interactor для реализации паттерна Service Layer
        Draper для реализации паттерна Decorator
        +   Twitter Bootstrap для создания минимального пользовательского интерфейса
        Bootswatch для оформления интерфейса с помощью "тем"
        +   Slim вместо стандартного движка шаблонов ERB
        +   SimpleForm для создания форм
        Responders для уменьшения дублирования кода в контроллерах
        +   Decent Exposure для уменьшения количества кода в контроллерах
        Kaminari для управления пагинацией
        +   RSpec для написания тестов
        +   Capybara для написания тестов, симулирующих поведение пользователя
