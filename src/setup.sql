-- ========================================
-- Organization Table
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Project Table
-- ========================================
CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES organization(organization_id),
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL
);


-- ========================================
-- Insert sample data: Projects
-- ========================================
INSERT INTO project (organization_id, title, description, location, date)
VALUES
-- Organization 1: BrightFuture
(1, 'Park Cleanup', 'Cleaning the central park.', 'Central Park', '2024-11-10'),
(1, 'School Supply Drive', 'Collecting school supplies for children.', 'Community Center', '2024-12-05'),
(1, 'Holiday Toy Collection', 'Gathering toys for underprivileged families.', 'Downtown Hall', '2024-12-18'),
(1, 'Neighborhood Painting', 'Painting public spaces and community murals.', 'East District', '2025-01-15'),
(1, 'Youth Mentorship Program', 'Mentoring local high school students.', 'BrightFuture Office', '2025-02-08'),

-- Organization 2: GreenHarvest
(2, 'Community Garden', 'Planting fall crops.', 'Westside Center', '2024-11-15'),
(2, 'Tree Planting Day', 'Planting native trees throughout the city.', 'Riverside Park', '2024-12-01'),
(2, 'Recycling Awareness Campaign', 'Educating residents about recycling.', 'City Library', '2025-01-12'),
(2, 'River Cleanup', 'Removing waste from the local river.', 'Green River', '2025-02-20'),
(2, 'Urban Farming Workshop', 'Teaching sustainable urban farming techniques.', 'GreenHarvest HQ', '2025-03-10'),

-- Organization 3: UnityServe
(3, 'Food Drive', 'Collecting canned goods.', 'Main Plaza', '2024-11-20'),
(3, 'Winter Clothing Donation', 'Collecting coats and blankets.', 'Unity Center', '2024-12-10'),
(3, 'Senior Assistance Day', 'Helping senior citizens with household tasks.', 'North District', '2025-01-25'),
(3, 'Blood Donation Campaign', 'Organizing a community blood drive.', 'General Hospital', '2025-02-15'),
(3, 'Health Fair', 'Providing free health screenings and education.', 'City Convention Center', '2025-03-22');

-- ========================================
-- Category Table
-- ========================================
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

-- ========================================
-- Project_Category Junction Table
-- ========================================
CREATE TABLE project_category (
    project_id INT NOT NULL REFERENCES project(project_id),
    category_id INT NOT NULL REFERENCES category(category_id),
    PRIMARY KEY (project_id, category_id)
);

-- ========================================
-- Insert sample data: Categories
-- ========================================
INSERT INTO category (name) 
VALUES 
('Environmental'), 
('Educational'), 
('Community Service'), 
('Health and Wellness');

-- ========================================
-- Insert sample data: Project_Category links
-- ========================================
-- IDs: 1: Environmental | 2: Educational | 3: Community Service | 4: Health and Wellness
INSERT INTO project_category (project_id, category_id) 
VALUES 
-- BrightFuture
(1, 1), (1, 3), -- Park Cleanup (Environmental, Community Service)
(2, 2), (2, 3), -- School Supply Drive (Educational, Community Service)
(3, 3),         -- Holiday Toy Collection (Community Service)
(4, 3),         -- Neighborhood Painting (Community Service)
(5, 2), (5, 3), -- Youth Mentorship (Educational, Community Service)

-- GreenHarvest
(6, 1), (6, 4), -- Community Garden (Environmental, Health and Wellness)
(7, 1),         -- Tree Planting Day (Environmental)
(8, 1), (8, 2), -- Recycling Awareness (Environmental, Educational)
(9, 1), (9, 3), -- River Cleanup (Environmental, Community Service)
(10, 1), (10, 2),-- Urban Farming Workshop (Environmental, Educational)

-- UnityServe
(11, 3), (11, 4),-- Food Drive (Community Service, Health and Wellness)
(12, 3),         -- Winter Clothing Donation (Community Service)
(13, 3), (13, 4),-- Senior Assistance Day (Community Service, Health and Wellness)
(14, 4), (14, 3),-- Blood Donation Campaign (Health and Wellness, Community Service)
(15, 4), (15, 2);-- Health Fair (Health and Wellness, Educational)