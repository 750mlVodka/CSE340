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