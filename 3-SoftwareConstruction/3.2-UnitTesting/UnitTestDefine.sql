-- Модульне тестування
DECLARE
   humidityData1 T_HumidityEnvironment;
   result VARCHAR2(100);
BEGIN
   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE('Unit-testing of observeHumidity');
   
   -- TC1.1: Правильний тест
   DBMS_OUTPUT.PUT('TC1.1: ');
   humidityData1 := T_HumidityEnvironment(20, 7, 20, 0, -10, 5);
   result := observeHumidity(humidityData1);
   IF result = '1' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.2: Порушення умови (температура за межами)
   DBMS_OUTPUT.PUT('TC1.2: ');
   humidityData1 := T_HumidityEnvironment(52, 7, 20, 0, -10, 5);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.3: Порушення умови (еластичність пари за межами)
   DBMS_OUTPUT.PUT('TC1.3: ');
   humidityData1 := T_HumidityEnvironment(20, 0, 20, 0, -10, 5);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.4: Порушення умови (відносна вологість за межами)
   DBMS_OUTPUT.PUT('TC1.4: ');
   humidityData1 := T_HumidityEnvironment(20, 7, 120, 0, -10, 5);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.5: Порушення умови (вологий дефіцит менше 0)
   DBMS_OUTPUT.PUT('TC1.5: ');
   humidityData1 := T_HumidityEnvironment(20, 7, 20, -5, -10, 5);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.6: Порушення умови (точка роси за межами)
   DBMS_OUTPUT.PUT('TC1.6: ');
   humidityData1 := T_HumidityEnvironment(20, 7, 20, 0, 111111, 5);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;

   -- TC1.7: Порушення умови (відчутна температура за межами)
   DBMS_OUTPUT.PUT('TC1.7: ');
   humidityData1 := T_HumidityEnvironment(20, 7, 20, 0, -10, 111111);
   result := observeHumidity(humidityData1);
   IF result = 'Значення параметрів виходять за допустимі межі' THEN
      DBMS_OUTPUT.PUT_LINE('Passed');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Failed');
   END IF;
END;