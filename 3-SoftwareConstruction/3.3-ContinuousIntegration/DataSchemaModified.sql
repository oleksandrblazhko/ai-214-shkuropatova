CREATE TABLE Users (
    Id_User INT PRIMARY KEY,
    User_Name VARCHAR(100),
    User_Login VARCHAR(100) UNIQUE,
    User_Password VARCHAR(100),
    Date_Birth DATE
);

CREATE TABLE Consumers (
    Id_Consumer INT PRIMARY KEY,
    User_Id INT REFERENCES Users (Id_User)
);

CREATE TABLE EmotionRecording (
    Id_Recording INT PRIMARY KEY,
    Recorder_Emotion VARCHAR(255),
    Recording_Comment CLOB,
    Consumer_Id INT REFERENCES Consumers (Id_Consumer)
);

CREATE TABLE Emotion (
    Id_Emotion INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE
);

CREATE TABLE EmotionStatistic (
    Id_Statistic INT PRIMARY KEY,
    Number_Repetitions INT,
    Percentage_Ratio FLOAT,
    Emotion_Id INT REFERENCES Emotion (Id_Emotion)
);

CREATE TABLE EmotionStatistics (
    Id_Statistics INT PRIMARY KEY,
    Total_Recorded_Emotions INT,
    Consumer_Id INT REFERENCES Consumers (Id_Consumer)
);

CREATE TABLE HumidityEnvironment (
    Id_Humidity INT PRIMARY KEY,
    Temperature FLOAT,
    Water_Vapor_Elasticity FLOAT,
    Relative_Humidity FLOAT,
    Moisture_Deficit FLOAT,
    Dewpoint FLOAT,
    Temperature_Felt FLOAT
);

CREATE TABLE Weather (
    Id_Weather INT PRIMARY KEY,
    Weather_Temperature FLOAT,
    Weather_Description VARCHAR(255)
);
