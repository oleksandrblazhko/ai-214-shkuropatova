DECLARE
  -- Створення об'єкта користувача
  user1 T_Consumer := T_Consumer('A', NULL, NULL, NULL, NULL);
  -- Створення об'єкта середовища вологості
  humidityData OBJ_HumidityEnvironment := OBJ_HumidityEnvironment(
    25.0, 10.0, 70.0, 5.0, 15.0, 25.0
  );
BEGIN
  -- Спостереження за вологістю та вивід результату
  DBMS_OUTPUT.PUT_LINE('Результат спостереження за вологістю: ' || user1.observeHumidity(humidityData));
END;

DECLARE
  -- Створення об'єкта користувача
  user1 T_Consumer := T_Consumer('A', NULL, NULL, NULL, NULL);
  -- Дані емоцій для запису
  emotionData VARCHAR2(255) := 'Happy';
  -- Дані для статистики емоцій
  emotionStats OBJ_EmotionStatistic := OBJ_EmotionStatistic(1, 90.5, 1);
BEGIN
  -- Запис емоції користувачем
  user1.recordEmotion(emotionData);
  -- Перегляд статистики емоцій користувачем
  user1.viewEmotionStatistics(emotionStats);
END;

DECLARE
  -- Створення об'єкта користувача
  user1 T_Consumer := T_Consumer('A', NULL, NULL, NULL, NULL);
  -- Створення об'єкта погоди
  weatherData OBJ_Weather := OBJ_Weather(25.0, 'Сонячно');
BEGIN
  -- Перегляд інформації про погоду користувачем
  user1.viewWeather(weatherData);
END;

DECLARE
  -- Створення об'єкта користувача
  user1 T_Consumer := T_Consumer('A', NULL, NULL, NULL, NULL);
  -- Створення об'єкта статистики емоцій
  emotionStats OBJ_EmotionStatistic := OBJ_EmotionStatistic(1, 90.5, 1);
BEGIN
  -- Перегляд статистики емоцій користувачем
  user1.viewEmotionStatistics(emotionStats);
END;
