% Crear una conexión con Arduino
a = arduino('COM7', 'Uno', 'Libraries', 'Servo');

% Crear objetos de servo
servoLeft = servo(a, 'D11');
servoRight = servo(a, 'D12');

% Detener los servos por 1 segundo
writePosition(servoLeft, 0.52);
writePosition(servoRight, 0.51);
pause(1);

% Avanzar por 1 segundo
writePosition(servoLeft, 0.55);
writePosition(servoRight, 0.45);
pause(1);

% Detener los servos por 1 segundo
writePosition(servoLeft, 0.52);
writePosition(servoRight, 0.51);
pause(1);


% Retroceder por 1 segundo
writePosition(servoLeft, 0.45);
writePosition(servoRight, 0.55);
pause(1);

% Detener los servos por 1 segundo
writePosition(servoLeft, 0.52);
writePosition(servoRight, 0.51);
pause(0.3);

% Girar a la derecha por 1 segundo
writePosition(servoLeft, 0.55);
writePosition(servoRight, 0.56);
pause(0.3);

% Detener los servos por 1 segundo
writePosition(servoLeft, 0.52);
writePosition(servoRight, 0.51);
pause(0.3);

% Girar a la izquierda por 1 segundo
writePosition(servoLeft, 0.45);
writePosition(servoRight, 0.45);
pause(0.3);

% Detener los servos por 1 segundo
writePosition(servoLeft, 0.52);
writePosition(servoRight, 0.51);
pause(0.3);

% Limpiar la conexión con Arduino
clear servoLeft servoRight a;