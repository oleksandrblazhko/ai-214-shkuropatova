-- HumidityEnvironment class
CREATE OR REPLACE TYPE T_HumidityEnvironment AS OBJECT (
    temperature FLOAT,
    water_vapor_elasticity FLOAT,
    relative_humidity FLOAT,
    moisture_deficit FLOAT,
    dewpoint FLOAT,
    temperature_felt FLOAT
);

CREATE OR REPLACE FUNCTION observeHumidity(humidityData IN OBJ_HumidityEnvironment) RETURN VARCHAR2 IS
   result VARCHAR2(100) := 'Допустимі параметри';
BEGIN
   -- Перевірка вхідних параметрів
   IF humidityData.temperature < -50.0 OR humidityData.temperature > 50.0 OR
      humidityData.water_vapor_elasticity <= 0 OR
      humidityData.relative_humidity < 0 OR humidityData.relative_humidity > 100 OR
      humidityData.moisture_deficit < 0 OR
      humidityData.dewpoint < -50.0 OR humidityData.dewpoint > 50.0 OR
      humidityData.temperature_felt < -50.0 OR humidityData.temperature_felt > 50.0 THEN
      result := 'Значення параметрів виходять за допустимі межі';
   END IF;

   RETURN result;

EXCEPTION
   WHEN OTHERS THEN
      result := 'Помилка: ' || SQLERRM;
      RETURN result;
END;

CREATE OR REPLACE FUNCTION observeHumidity(humidityData IN OBJ_HumidityEnvironment) RETURN VARCHAR2 IS
   result VARCHAR2(100);
BEGIN
   -- Перевірка вхідних параметрів
   IF humidityData.temperature < -50.0 OR humidityData.temperature > 50.0 OR
      humidityData.water_vapor_elasticity <= 0 OR
      humidityData.relative_humidity < 0 OR humidityData.relative_humidity > 100 OR
      humidityData.moisture_deficit < 0 OR
      humidityData.dewpoint < -50.0 OR humidityData.dewpoint > 50.0 OR
      humidityData.temperature_felt < -50.0 OR humidityData.temperature_felt > 50.0 THEN
      result := 'Значення параметрів виходять за допустимі межі';
      RETURN result;
   END IF;

EXCEPTION
   WHEN OTHERS THEN
      result := 'Помилка: ' || SQLERRM;
      RETURN result;
END;

CREATE OR REPLACE TRIGGER HumidityEnvironment_Check
BEFORE INSERT ON HumidityEnvironment
FOR EACH ROW
DECLARE
   result VARCHAR2(100);
BEGIN
   result := observeHumidity(OBJ_HumidityEnvironment(
      :new.temperature,
      :new.water_vapor_elasticity,
      :new.relative_humidity,
      :new.moisture_deficit,
      :new.dewpoint,
      :new.temperature_felt
   ));

   IF result <> 'OK' THEN
      RAISE_APPLICATION_ERROR(-20001, result);
   END IF;
END;

CREATE OR REPLACE TRIGGER HumidityEnvironment_Check_Update
BEFORE UPDATE ON HumidityEnvironment
FOR EACH ROW
DECLARE
   result VARCHAR2(100);
BEGIN
   result := observeHumidity(OBJ_HumidityEnvironment(
      :new.temperature,
      :new.water_vapor_elasticity,
      :new.relative_humidity,
      :new.moisture_deficit,
      :new.dewpoint,
      :new.temperature_felt
   ));

   IF result <> 'OK' THEN
      RAISE_APPLICATION_ERROR(-20002, result);
   END IF;
END;


CREATE OR REPLACE TYPE BODY T_Consumer AS
  MEMBER FUNCTION observeHumidity(humidityData IN OBJ_HumidityEnvironment) RETURN VARCHAR2 IS
    result VARCHAR2(100);
  BEGIN
    -- Перевірка вхідних параметрів
    result := self.checkHumidityLimits(humidityData);
    RETURN result;
  END observeHumidity;

-- Функція для перевірки обмежень вологості
  MEMBER FUNCTION checkHumidityLimits(humidityData IN OBJ_HumidityEnvironment) RETURN VARCHAR2 IS
    result VARCHAR2(100);
  BEGIN
    IF humidityData.temperature < -50.0 OR humidityData.temperature > 50.0 OR
       humidityData.water_vapor_elasticity <= 0 OR
       humidityData.relative_humidity < 0 OR humidityData.relative_humidity > 100 OR
       humidityData.moisture_deficit < 0 OR
       humidityData.dewpoint < -50.0 OR humidityData.dewpoint > 50.0 OR
       humidityData.temperature_felt < -50.0 OR humidityData.temperature_felt > 50.0 THEN
      result := 'Значення параметрів виходять за допустимі межі';
    ELSE
      result := 'Спостереження за вологістю успішне';
    END IF;
    RETURN result;
  END checkHumidityLimits;

-- Процедура для перегляду погоди
  MEMBER PROCEDURE viewWeather(weatherData IN OBJ_Weather) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Інформація про погоду:');
    DBMS_OUTPUT.PUT_LINE('Температура: ' || weatherData.temperature);
    DBMS_OUTPUT.PUT_LINE('Опис: ' || weatherData.weather_description);
  END viewWeather;


-- Процедура для запису емоцій
  MEMBER PROCEDURE recordEmotion(emotionData IN VARCHAR2) IS
    v_emotion_record EmotionRecord;  -- Об'єкт для запису емоцій
  BEGIN
    -- Логіка для запису даних емоцій в таблицю EmotionRecording
    v_emotion_record := EmotionRecord(recording_id_sequence.NEXTVAL, emotionData, NULL);
    
    INSERT INTO EmotionRecording (recording_id, recorder_emotion, recording_comment)
    VALUES (v_emotion_record.recording_id, v_emotion_record.recorder_emotion, v_emotion_record.recording_comment);

    DBMS_OUTPUT.PUT_LINE('Емоцію записано: ' || emotionData);
  END recordEmotion;

  
-- Процедура для перегляду статистики емоцій
  MEMBER PROCEDURE viewEmotionStatistics(emotionStats IN OBJ_EmotionStatistic) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Статистика емоцій:');
    DBMS_OUTPUT.PUT_LINE('Повторення: ' || emotionStats.number_repetitions);
    DBMS_OUTPUT.PUT_LINE('Відсоткове співвідношення: ' || emotionStats.percentage_ratio);
  END viewEmotionStatistics;
END;

