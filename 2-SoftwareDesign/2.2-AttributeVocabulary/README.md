### Словник атрибутів об’єктів

| Об’єкт | Атрибут | Короткий опис | Тип | Обмеження|
| --- | --- | ---  | --- | --- |
| User | name | Як звати  | Текст | |
| User | login  | Логін  | Текст | Унікальність логіну для кожного користувача |
| User | password | Пароль  | Текст | Унікальність паролю для кожного користувача|
| User | date_birth | Дата народження  | Дата | |
| Consumer |  |  Споживач ПП |  |  |
| EmotionRecording | recorded_emotion | Обрана або записана емоція  | Текст |Довжина символів < 60|
| EmotionRecording | comment | Коментар до записаної емоції  | Текст | Довжина символів < 300|
| Emotion | name |  Назва емоції | Текст | |
| EmotionStatistic | number_repetitions | кількість повторень емоції | Число | |
| EmotionStatistic | percentage_ratio | процентне_відношення емоції  | Число | |
| Weather | temperature | Температура  | Число | |
| Weather | weather_description | опис погоди  | Текст | |
| HumidityEnvironment | water_vapor_elasticity | Пружність водяної пари  | Число | |
| HumidityEnvironment | relative_humidity |  Відносна вологість | Число | |
| HumidityEnvironment | moisture_deficit | Дефіцит вологи  | Число | |
| HumidityEnvironment | dewpoint | Точка роси  | Число | |
| HumidityEnvironment | temperature_felt | Як відчуваєтся температура  | Число | |
