 % Clear workspace and command windo
clear all;
clc;

% Create a connection with Arduino
a = arduino('COM7', 'Uno', 'Libraries', 'Servo');

% Create servo objects
servoLeft = servo(a, 'D11');
servoRight = servo(a, 'D12');

% Create a webcam object
cam = webcam;
% Create a figure to display real-time video
figure;

while true

    % Capture a frame from the webcam
    I = snapshot(cam);
    
    % Display the original image
    subplot(2, 1, 1);
    imshow(I);
    title('Original');

    % Convert the image to the HSV color space and reduce saturation
    hsv = rgb2hsv(I);
    hsv(:,:,2) = 15;

    % Extract the blue channel from the image
    Ib = I(:,:,3);

    % Subtract the red and green channels to enhance blue regions
    I_blue = Ib - I(:,:,1) - I(:,:,2);

    % Perform histogram equalization
    I = histeq(I_blue);

    % Apply a Gaussian filter to eliminate noise
    sigma = 5;
    filtered_blue_channel = imgaussfilt(double(I), sigma);

    % Convert the filtered blue channel to grayscale
    I = mat2gray(filtered_blue_channel);

    % Convert to binary image using a threshold
    I = im2bw(I, 0.8);

    % Display the binary image
    subplot(2, 1, 2);
    imshow(I);
    title('Binary Image');

    % Use regionprops to extract properties of regions in the binary image
    moments = regionprops(I, 'Centroid', 'Area', 'BoundingBox');

    % Set a threshold for the minimum area to filter out small regions
    spect_area = 10000;

    % Filter regions based on area
    IScircle = [moments.Area] >= spect_area;

    % Coordinates for the intersection point of the two lines
    xLine = size(I, 2) / 2;
    yLine = size(I, 1) / 2;

    % Draw a point at the center of the image
    plot(xLine, yLine, 'g.', 'MarkerSize', 20);

    % Variables to store information about the largest region
    maxArea = 0;
    maxIndex = 0;
    maxBounding = 0;

    % Iterate over the regions and find the largest one
    for k = 1 : length(IScircle)
        if moments(k).Area > spect_area
            % Check if the current region is larger than the previously recorded maximum
            if moments(k).Area > maxArea
                maxArea = moments(k).Area;
                maxIndex = k;
            end
        end
    end
    
    % If a valid region is found
    if maxIndex > 0
        % Access properties of the largest region
        largestCentroid = moments(maxIndex).Centroid;
        maxBounding = moments(maxIndex).BoundingBox;
        boundingArea = maxBounding(3) * maxBounding(4);
        disp(boundingArea)

        % Get the perimeter of the object
        perimeter = bwperim(I);
        % Draw the perimeter of the object
        hold on;
        visboundaries(perimeter, 'Color', 'b', 'LineWidth', 1);
        
        % Calculate the difference in x and y coordinates
        DifferenceX = xLine - largestCentroid(1);
        DifferenceY = yLine - largestCentroid(2);
        
        % Display the difference as text in the figure
        text(10, 20, sprintf('Delta X: %.2f, Delta Y: %.2f', DifferenceX, DifferenceY), 'Color', 'w', 'FontSize', 8);

        % Decision-making based on the differences
        if DifferenceX > 30
            text(10, 50, 'Right', 'Color', 'w', 'FontSize', 8);
            turnRight(servoLeft, servoRight);
            stopServos(servoLeft, servoRight);
            pause(0.2);

        elseif DifferenceX < -30
            text(10, 50, 'Left', 'Color', 'w', 'FontSize', 8);
            turnLeft(servoLeft, servoRight);
            stopServos(servoLeft, servoRight);
            pause(0.2);
            
        elseif DifferenceX > -29 && DifferenceX < 29
                text(300, 50, 'Stop', 'Color', 'w', 'FontSize', 8);
                stopServos(servoLeft, servoRight);
            % Flag to indicate no significant movement in the X direction
            Flag = 1;
            Flag2 = 1;
            % Check if both X and Y flags indicate no movement
        end

        if boundingArea < 80000
            moveForward(servoLeft, servoRight)
        else
            stopServos(servoLeft, servoRight)
        end   

        % Pause to allow the figure to update
        drawnow;
    end
end

% Function to stop the servos

function stopServos(servoLeft, servoRight)
    % Stop the servos for 1 second
    writePosition(servoLeft, 0.52);
    writePosition(servoRight, 0.51);
    pause(0.2);
end

% Functions to control movement
function moveForward(servoLeft, servoRight)
    % Move forward
    writePosition(servoLeft, 0.55);
    writePosition(servoRight, 0.45);
    pause(0.1);
    writePosition(servoLeft, 0.52);
    writePosition(servoRight, 0.51);
    pause(0.2);
end

function moveBackward(servoLeft, servoRight)
    % Move backwards
    writePosition(servoLeft, 0.45);
    writePosition(servoRight, 0.55);
    pause(0.1);
    writePosition(servoLeft, 0.52);
    writePosition(servoRight, 0.51);
    pause(0.2);
end

function turnLeft(servoLeft, servoRight)
    % Turn right 
    writePosition(servoLeft, 0.55);
    writePosition(servoRight, 0.55);
end

function turnRight(servoLeft, servoRight)
    % Turn left 
    writePosition(servoLeft, 0.45);
    writePosition(servoRight, 0.45);
end