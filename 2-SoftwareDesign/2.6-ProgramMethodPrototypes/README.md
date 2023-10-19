### Прототипи методів програмних класів
| FR |Опис вимоги | Назва класу | Назва методу класу|
| --- | --- | --- | --- |
| FR1.1 |Вхід користувача в систему | User |loginUser(username: string, password: string): boolean |
| FR1.2 |Вихід користувача з системи |User  |logoutUser(): void |
| FR1.1 | Спостереження за вологою | Consumer | observeHumidity(): void|
| FR1.2 |   Перегляд погоди |Consumer  | viewWeather(): Weather |
| FR2.1 | Запис емоцій| Consumer | recordEmotion(emotion: Emotion, comment: string): void |
| FR2.1 | Вибір емоції | EmotionRecording | chooseEmotion(emotion: Emotion): void |
| FR2.2 | Запис емоцій| EmotionRecording |writeCustomEmotion(emotionText: string, comment: string): void |
| FR2.3 | Додавання коментаря до запису | EmotionRecording |addComment(comment: string): void |
| FR3.1 |Перегляд статистики емоцій | Consumer | viewEmotionStatistics(): EmotionStatistics|
