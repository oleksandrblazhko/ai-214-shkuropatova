CREATE TABLE User (
  user_id INT PRIMARY KEY,
  name VARCHAR(255),
  login VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  date_birth DATE
);

CREATE TABLE Consumer (
  consumer_id INT PRIMARY KEY,
  user_id INT REFERENCES User(user_id),
);

CREATE TABLE EmotionRecording (
  recording_id INT PRIMARY KEY,
  recorder_emotion VARCHAR(255),
  comment TEXT,
  consumer_id INT REFERENCES Consumer(consumer_id),
);

CREATE TABLE Emotion (
  emotion_id INT PRIMARY KEY,
  name VARCHAR(255) UNIQUE,
);

CREATE TABLE EmotionStatistic (
  statistic_id INT PRIMARY KEY,
  number_repetitions INT,
  percentage_ratio FLOAT,
  emotion_id INT REFERENCES Emotion(emotion_id),
);

CREATE TABLE EmotionStatistics (
  statistics_id INT PRIMARY KEY,
  total_recorded_emotions INT,
  consumer_id INT REFERENCES Consumer(consumer_id),
  -- Інші атрибути EmotionStatistics
);

CREATE TABLE HumidityEnvironment (
  humidity_id INT PRIMARY KEY,
  temperature FLOAT,
  water_vapor_elasticity FLOAT,
  relative_humidity FLOAT,
  moisture_deficit FLOAT,
  dewpoint FLOAT,
  temperature_felt FLOAT,
);

CREATE TABLE Weather (
  weather_id INT PRIMARY KEY,
  temperature FLOAT,
  weather_description VARCHAR(255),
);