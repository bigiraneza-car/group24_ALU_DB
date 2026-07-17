-- =====================
-- Member B: Classroom Table
-- =====================

-- Create Classroom table
CREATE TABLE Classroom (
    classroom_id INT PRIMARY KEY AUTO_INCREMENT,
    room_number VARCHAR(20) NOT NULL,
    building VARCHAR(100),
    capacity INT NOT NULL,
    floor_number INT
);

-- Member B: Insert 5 sample rows
INSERT INTO Classroom (room_number, building, capacity, floor_number)
VALUES
    ('101', 'Block A', 30, 1),
    ('202', 'Block B', 25, 2),
    ('303', 'Block C', 40, 3),
    ('104', 'Block A', 35, 1),
    ('205', 'Block B', 20, 2);
