-- Users class
CREATE OR REPLACE TYPE T_Users AS OBJECT (
    user_name VARCHAR2(255),
    login VARCHAR2(255),
    user_password VARCHAR2(255),
    date_birth DATE,
    MEMBER FUNCTION loginUser RETURN VARCHAR2,
    MEMBER PROCEDURE logoutUser
);

-- Consumer class
CREATE OR REPLACE TYPE T_Consumer AS OBJECT (
    dummy_attribute VARCHAR2(1),
    MEMBER PROCEDURE observeHumidity,
    MEMBER PROCEDURE viewWeather,
    MEMBER PROCEDURE recordEmotion,
    MEMBER PROCEDURE viewEmotionStatistics
);

-- Создание объектного типа T_EmotionRecording
CREATE OR REPLACE TYPE OBJ_EmotionRecording AS OBJECT (
    recorder_emotion VARCHAR2(255),
    recording_comment VARCHAR2(1000),
    MEMBER PROCEDURE chooseEmotion(emotion_name VARCHAR2),
    MEMBER PROCEDURE writeCustomEmotion(emotion_name VARCHAR2),
    MEMBER PROCEDURE addComment(recording_comment VARCHAR2)
);

-- Emotion class
CREATE OR REPLACE TYPE T_Emotion AS OBJECT (
    recording_name VARCHAR2(255)
);

-- EmotionStatistic class
CREATE OR REPLACE TYPE T_EmotionStatistic AS OBJECT (
    number_repetitions NUMBER,
    percentage_ratio FLOAT
);

-- EmotionStatistics class
CREATE OR REPLACE TYPE T_EmotionStatistics AS OBJECT (
    total_recorded_emotions NUMBER,
    MEMBER PROCEDURE viewEmotionStatistics
);

-- HumidityEnvironment class
CREATE OR REPLACE TYPE T_HumidityEnvironment AS OBJECT (
    temperature FLOAT,
    water_vapor_elasticity FLOAT,
    relative_humidity FLOAT,
    moisture_deficit FLOAT,
    dewpoint FLOAT,
    temperature_felt FLOAT
);

-- Weather class
CREATE OR REPLACE TYPE T_Weather AS OBJECT (
    temperature FLOAT,
    weather_description VARCHAR2(255)
);
