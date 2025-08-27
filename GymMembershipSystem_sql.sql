create database GymMembershipSystem;

use GymMembershipSystem;

-- Tables creation queries
create table Members(
	member_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	gender enum('Male','Female'),
	dob date,
	phone varchar(20),
	email varchar(100) unique,
	address text
);

create table Trainers(
	trainer_id int primary key, 
	name varchar(100), 
	specialization varchar(50), 
	phone varchar(20), 
	email varchar(100) 
);

create table MembershipPlans(
	plan_id int primary key, 
	plan_name varchar(50), 
	duration_months int, 
	price decimal(10,2)
);

create table Subscriptions(
	subscription_id int primary key, 
	member_id int, 
	plan_id int, 
	start_date date, 
	end_date date, 
	status enum('Active', 'Expired', 'Cancelled'), 
	foreign key (member_id) references Members(member_id), 
	foreign key (plan_id) references MembershipPlans(plan_id)
);

create table Payments(
	payment_id int primary key, 
	subscription_id int, 
	amount decimal(10,2), 
	payment_date DATE, 
	method enum('Cash', 'Card', 'UPI'), 
	foreign key (subscription_id) references Subscriptions(subscription_id)
);

create table Equipment(
	equipment_id int primary key, 
	name VARCHAR(100), 
	purchase_date DATE, 
	`condition` enum('Good', 'Fair', 'Needs Repair'), 
	quantity int 
);

create table Classes(
	class_id int primary key, 
	class_name varchar(100), 
	trainer_id int, 
	schedule_time time,  
	day_of_week enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'), 
	foreign key (trainer_id) references Trainers(trainer_id)
);

create table Attendance(
	attendance_id int primary key, 
	member_id int, 
	class_id int, 
	date date, 
	foreign key (member_id) references Members(member_id), 
	foreign key (class_id) references Classes(class_id)
);

create table Feedback(
	feedback_id int primary key, 
	member_id int, 
	trainer_id int, 
	rating int check (rating = 1 AND rating = 5), 
	comment text, 
	foreign key (member_id) references Members(member_id), 
	foreign key (trainer_id) references Trainers(trainer_id) 
);

create table TrainerSchedule ( 
	schedule_id int primary key, 
	trainer_id int, 
	day varchar(20), 
	start_time time, 
	end_time time, 
	foreign key (trainer_id) references Trainers(trainer_id) 
);

create table Admins ( 
	admin_id int primary key, 
	username varchar(50) unique, 
	password varchar(100), 
	email varchar(100) unique 
);

-- insert Queries

insert into Members (member_id, first_name, last_name, gender, dob, phone, email, address) values  
(6, 'Rang', 'Rang', 'Male', '1998-05-15', '753-456-7530', 'rang.rang@example.com', '472 
Zai Street'), 
(7, 'Chen', 'Zheyian', 'Male', '1996-10-29', '987-654-3210', 'chen.zheyuan@example.com', '462 
Zhao Avenue'), 
(8, 'Sang', 'Yan', 'Male', '1998-11-03', '723-679-0823', 'sang.Yan@example.com', '779 Jain 
Road'), 
(9, 'Zhao', 'Lusi', 'Female', '1999-05-11', '891-754-2470', 'zhao.lusi@example.com', '357 
Zhao Avenue'), 
(10, 'Joseph', 'Stein', 'Male', '1989-07-19', '654-321-0987', 'joseph.stein@example.com', '654 
Cedar Blvd'),
(11, 'Wang', 'Seng', 'Female', '1990-04-15', '123-456-7890', 'wang.beng@example.com', '123 
Elm Street'), 
(12, 'Gwan', 'Sik', 'Male', '1985-09-20', '957-754-3780', 'gwan.sik@example.com', '456 
Oak Avenue'), 
(13, 'Guwei', 'Sin', 'Male', '1995-10-30', '776-359-0173', 'gwei.sin@example.com', '679 Pine 
Road'), 
(14, 'Elsa', 'Davis', 'Female', '1999-06-11', '641-604-3320', 'elsa.davis@example.com', '971 
Maple Lane'), 
(15, 'Aana', 'Miller', 'Female', '2000-11-29', '784-771-0247', 'aana.miller@example.com', '284 
Cedar Blvd'),
(16, 'Sang', 'Shi', 'Female', '1988-04-15', '353-956-7780', 'sang.shi@example.com', '363 
Elm Street'), 
(17, 'Saara', 'Jack', 'Female', '1987-09-20', '947-453-3710', 'saara.jack@example.com', '982 
Oak Avenue'), 
(18, 'Zhoya', 'John', 'Female', '1996-12-03', '956-749-0793', 'zhoya.john@example.com', '572 Pine 
Road'), 
(19, 'Emi', 'Davis', 'Female', '1997-06-11', '741-164-9230', 'emi.davis@example.com', '337 
Maple Lane'), 
(20, 'Lurang', 'Sin', 'Male', '1986-11-29', '684-041-0907', 'lurang.sin@example.com', '654 
Cedar Blvd'),
(21, 'Ran', 'Rang', 'Male', '1988-05-15', '953-756-0530', 'ran.rang@example.com', '432 
Zai Street'), 
(22, 'Chen', 'Zhe', 'Male', '1996-11-29', '687-600-3210', 'chen.zhe@example.com', '972 
Zhao Avenue'), 
(23, 'Jane', 'Yan', 'Male', '1996-11-03', '763-679-0983', 'jane.Yan@example.com', '679 Jain 
Road'), 
(24, 'Zhi', 'Yi', 'Female', '1995-05-11', '831-774-2470', 'zhi.yi@example.com', '557 
Zhao Avenue'), 
(25, 'Jose', 'Stein', 'Male', '1999-07-19', '684-321-0897', 'jose.stein@example.com', '944 
Cedar Blvd');


insert into Trainers (trainer_id, name, specialization, phone, email) values  
(1, 'John Carter', 'Strength', '111-222-3333', 'john.carter@gym.com'), 
(2, 'Amy Taylor', 'Cardio', '222-333-4444', 'amy.taylor@gym.com'), 
(3, 'Robert Wilson', 'Yoga', '333-444-5555', 'robert.wilson@gym.com'), 
(4, 'Laura Lee', 'Crossfit', '444-555-6666', 'laura.lee@gym.com'), 
(5, 'Daniel Clark', 'Strength', '555-666-7777', 'daniel.clark@gym.com'),
(6, 'Sophia Adams', 'Pilates', '666-777-8888', 'sophia.adams@gym.com'),  
(7, 'Michael Brown', 'Strength', '777-888-9999', 'michael.brown@gym.com'),  
(8, 'Emma Davis', 'Cardio', '888-999-0000', 'emma.davis@gym.com'),  
(9, 'William Evans', 'Crossfit', '999-000-1111', 'william.evans@gym.com'),  
(10, 'Olivia Foster', 'Yoga', '000-111-2222', 'olivia.foster@gym.com'),  
(11, 'James Green', 'Strength', '123-456-7890', 'james.green@gym.com'),  
(12, 'Isabella Harris', 'Cardio', '234-567-8901', 'isabella.harris@gym.com'),  
(13, 'Benjamin Jackson', 'Pilates', '345-678-9012', 'benjamin.jackson@gym.com'),  
(14, 'Mia King', 'Yoga', '456-789-0123', 'mia.king@gym.com'),  
(15, 'Logan Lewis', 'Crossfit', '567-890-1234', 'logan.lewis@gym.com'),  
(16, 'Charlotte Martinez', 'Strength', '678-901-2345', 'charlotte.martinez@gym.com'),  
(17, 'Elijah Nelson', 'Cardio', '789-012-3456', 'elijah.nelson@gym.com'),  
(18, 'Amelia Perez', 'Yoga', '890-123-4567', 'amelia.perez@gym.com'),  
(19, 'Lucas Roberts', 'Crossfit', '901-234-5678', 'lucas.roberts@gym.com'),  
(20, 'Harper Scott', 'Pilates', '012-345-6789', 'harper.scott@gym.com'),  
(21, 'Henry Turner', 'Strength', '321-654-9870', 'henry.turner@gym.com'),  
(22, 'Evelyn Walker', 'Cardio', '432-765-0981', 'evelyn.walker@gym.com'),  
(23, 'Alexander Young', 'Yoga', '543-876-1092', 'alexander.young@gym.com'),  
(24, 'Abigail Allen', 'Crossfit', '654-987-2103', 'abigail.allen@gym.com'),  
(25, 'Daniela Wright', 'Pilates', '765-098-3214', 'daniela.wright@gym.com'); 

insert into MembershipPlans (plan_id, plan_name, duration_months, price) values 
(1, 'Basic', 1, 1000.00), 
(2, 'Standard', 3, 2500.00), 
(3, 'Premium', 6, 4500.00), 
(4, 'Basic', 1, 1200.00), 
(5, 'Standard', 3, 2800.00),
(6, 'Premium', 6, 5000.00), 
(7, 'Basic', 1, 1100.00), 
(8, 'Standard', 3, 2600.00), 
(9, 'Premium', 12, 8500.00), 
(10, 'Basic Plus', 2, 1800.00), 
(11, 'Standard Plus', 4, 3500.00), 
(12, 'Premium Plus', 8, 6200.00), 
(13, 'Weekend Only', 3, 1500.00), 
(14, 'Student Basic', 1, 900.00), 
(15, 'Student Premium', 6, 4000.00), 
(16, 'Corporate Basic', 3, 2300.00), 
(17, 'Corporate Premium', 6, 4200.00), 
(18, 'Family Plan', 6, 7500.00), 
(19, 'Couples Plan', 3, 3900.00), 
(20, 'Senior Plan', 3, 2000.00), 
(21, 'Basic', 1, 950.00), 
(22, 'Standard', 3, 2450.00), 
(23, 'Premium', 12, 8800.00), 
(24, 'Holiday Offer', 2, 1600.00), 
(25, 'Festival Special', 3, 2100.00);

insert into Subscriptions (subscription_id, member_id, plan_id, start_date, end_date, status) values  
(1, 1, 3, '2025-01-10', '2025-07-10', 'Active'), 
(2, 2, 1, '2025-05-01', '2025-06-01', 'Expired'), 
(3, 3, 2, '2025-03-15', '2025-06-15', 'Active'), 
(4, 4, 5, '2025-02-20', '2025-05-20', 'Cancelled'), 
(5, 5, 4, '2025-04-01', '2025-07-01', 'Active'), 
(6, 6, 6, '2025-03-10', '2025-09-10', 'Active'),  
(7, 7, 7, '2025-01-01', '2025-02-01', 'Expired'),  
(8, 8, 8, '2025-06-15', '2025-09-15', 'Active'),  
(9, 9, 9, '2025-02-10', '2026-02-10', 'Active'),  
(10, 10, 10, '2025-04-05', '2025-06-05', 'Cancelled'),  
(11, 11, 11, '2025-05-01', '2025-09-01', 'Active'),  
(12, 12, 12, '2025-01-20', '2025-09-20', 'Active'),  
(13, 13, 13, '2025-03-01', '2025-06-01', 'Expired'),  
(14, 14, 14, '2025-07-01', '2025-08-01', 'Active'),  
(15, 15, 15, '2025-01-15', '2025-07-15', 'Cancelled'),  
(16, 16, 16, '2025-04-25', '2025-07-25', 'Active'),  
(17, 17, 17, '2025-03-05', '2025-09-05', 'Active'),  
(18, 18, 18, '2025-05-10', '2025-11-10', 'Active'),  
(19, 19, 19, '2025-02-01', '2025-05-01', 'Expired'),  
(20, 20, 20, '2025-06-01', '2025-09-01', 'Active'),  
(21, 21, 21, '2025-03-10', '2025-04-10', 'Expired'),  
(22, 22, 22, '2025-01-20', '2025-04-20', 'Cancelled'),  
(23, 23, 23, '2025-02-14', '2026-02-14', 'Active'),  
(24, 24, 24, '2025-05-25', '2025-07-25', 'Active'),  
(25, 25, 25, '2025-06-30', '2025-09-30', 'Active');
 
insert into Payments (payment_id, subscription_id, amount, payment_date, method) values
(1, 1, 4500.00, '2025-01-10', 'Card'), 
(2, 2, 1000.00, '2025-05-01', 'UPI'), 
(3, 3, 2500.00, '2025-03-15', 'Cash'), 
(4, 4, 2800.00, '2025-02-20', 'Card'), 
(5, 5, 1200.00, '2025-04-01', 'UPI'),
(6, 6, 5000.00, '2025-03-10', 'Card'),
(7, 7, 1100.00, '2025-01-01', 'Cash'),
(8, 8, 2600.00, '2025-06-15', 'UPI'),
(9, 9, 8500.00, '2025-02-10', 'Card'),
(10, 10, 1800.00, '2025-04-05', 'UPI'),
(11, 11, 3500.00, '2025-05-01', 'Card'),
(12, 12, 6200.00, '2025-01-20', 'Card'),
(13, 13, 1500.00, '2025-03-01', 'Cash'),
(14, 14, 900.00, '2025-07-01', 'UPI'),
(15, 15, 4000.00, '2025-01-15', 'Card'),
(16, 16, 2300.00, '2025-04-25', 'Cash'),
(17, 17, 4200.00, '2025-03-05', 'UPI'),
(18, 18, 7500.00, '2025-05-10', 'Card'),
(19, 19, 3900.00, '2025-02-01', 'Cash'),
(20, 20, 2000.00, '2025-06-01', 'Card'),
(21, 21, 950.00, '2025-03-10', 'UPI'),
(22, 22, 2450.00, '2025-01-20', 'Card'),
(23, 23, 8800.00, '2025-02-14', 'Card'),
(24, 24, 1600.00, '2025-05-25', 'Cash'),
(25, 25, 2100.00, '2025-06-30', 'UPI');

insert into Equipment (equipment_id, name, purchase_date, `condition`, quantity) values 
(1, 'Treadmill', '2020-03-12', 'Good', 5), 
(2, 'Dumbbells', '2019-07-25', 'Fair', 20), 
(3, 'Bench Press', '2021-01-15', 'Good', 3), 
(4, 'Cycle', '2022-09-10', 'Good', 4), 
(5, 'Rowing Machine', '2018-12-05', 'Needs Repair', 2),
(6, 'Elliptical Trainer', '2021-06-15', 'Good', 3),
(7, 'Kettlebells', '2020-01-20', 'Fair', 15),
(8, 'Smith Machine', '2019-11-08', 'Good', 2),
(9, 'Leg Press Machine', '2022-02-18', 'Good', 2),
(10, 'Pull-Up Bar', '2020-08-10', 'Fair', 6),
(11, 'Battle Ropes', '2023-03-22', 'Good', 4),
(12, 'Lat Pulldown Machine', '2018-10-05', 'Needs Repair', 1),
(13, 'Medicine Balls', '2021-04-17', 'Fair', 10),
(14, 'Resistance Bands', '2022-01-05', 'Good', 25),
(15, 'Plyo Box', '2020-07-11', 'Fair', 5),
(16, 'Cable Crossover Machine', '2019-09-30', 'Needs Repair', 1),
(17, 'Seated Row Machine', '2023-05-10', 'Good', 2),
(18, 'Incline Bench', '2020-12-22', 'Good', 4),
(19, 'Step Platforms', '2021-08-19', 'Fair', 12),
(20, 'Leg Curl Machine', '2019-04-04', 'Needs Repair', 1),
(21, 'Chest Fly Machine', '2022-06-14', 'Good', 2),
(22, 'Foam Rollers', '2023-01-25', 'Good', 8),
(23, 'Wrist Weights', '2021-10-30', 'Fair', 10),
(24, 'Hyperextension Bench', '2020-02-27', 'Good', 2),
(25, 'Adjustable Dumbbells', '2023-07-15', 'Good', 6);

insert into Classes (class_id, class_name, trainer_id, schedule_time, day_of_week) values  
(1, 'Yoga', 3, '070000', 'Monday'), 
(2, 'HIIT', 4, '080000', 'Tuesday'), 
(3, 'Zumba', 2, '090000', 'Tuesday'), 
(4, 'Strength Training', 1, '180000', 'Friday'), 
(5, 'Yoga', 3, '063000', 'Wednesday'),
(6, 'Pilates', 6, '073000', 'Monday'),  
(7, 'Cardio Blast', 8, '080000', 'Wednesday'),  
(8, 'Crossfit', 4, '183000', 'Thursday'),  
(9, 'Spin Class', 9, '070000', 'Friday'),  
(10, 'Strength Training', 7, '060000', 'Saturday'),  
(11, 'Zumba', 2, '083000', 'Sunday'),  
(12, 'Yoga', 10, '070000', 'Thursday'),  
(13, 'Functional Training', 16, '190000', 'Monday'),  
(14, 'Kickboxing', 15, '173000', 'Tuesday'),  
(15, 'Aerobics', 22, '080000', 'Saturday'),  
(16, 'TRX Suspension', 13, '064500', 'Wednesday'),  
(17, 'Stretch & Tone', 14, '100000', 'Friday'),  
(18, 'Bootcamp', 19, '060000', 'Monday'),  
(19, 'Bodyweight Circuit', 11, '090000', 'Thursday'),  
(20, 'Pilates', 25, '103000', 'Sunday'),  
(21, 'Balance & Core', 12, '071500', 'Tuesday'),  
(22, 'Strength Training', 21, '184500', 'Wednesday'),  
(23, 'Dance Fitness', 23, '093000', 'Saturday'),  
(24, 'Mobility & Flexibility', 17, '070000', 'Friday'),  
(25, 'Senior Fitness', 20, '080000', 'Thursday');

insert into Attendance (attendance_id, member_id, class_id, date) values  
(1, 1, 1, '2025-07-01'), 
(2, 2, 2, '2025-07-01'), 
(3, 3, 3, '2025-07-01'), 
(4, 1, 4, '2025-07-02'), 
(5, 4, 5, '2025-07-02'),
(6, 5, 6, '2025-07-02'),  
(7, 6, 7, '2025-07-03'),  
(8, 7, 8, '2025-07-03'),  
(9, 8, 9, '2025-07-03'),  
(10, 9, 10, '2025-07-04'),  
(11, 10, 11, '2025-07-04'),  
(12, 11, 12, '2025-07-04'),  
(13, 12, 13, '2025-07-05'),  
(14, 13, 14, '2025-07-05'),  
(15, 14, 15, '2025-07-05'),  
(16, 15, 16, '2025-07-06'),  
(17, 16, 17, '2025-07-06'),  
(18, 17, 18, '2025-07-06'),  
(19, 18, 19, '2025-07-07'),  
(20, 19, 20, '2025-07-07'),  
(21, 20, 21, '2025-07-07'),  
(22, 21, 22, '2025-07-08'),  
(23, 22, 23, '2025-07-08'),  
(24, 23, 24, '2025-07-08'),  
(25, 24, 25, '2025-07-08');

insert into Feedback (feedback_id, member_id, trainer_id, rating, comment) values  
(1, 1, 1, 5, 'Great strength training tips!'), 
(2, 2, 2, 4, 'Very energetic Zumba session.'), 
(3, 3, 3, 5, 'Peaceful and focused yoga.'), 
(4, 4, 4, 3, 'Could improve on pacing.'), 
(5, 5, 2, 2, 'Too crowded class.'),
(6, 6, 1, 5, 'Trainer was very motivating.'),  
(7, 7, 2, 4, 'Loved the music and moves.'),  
(8, 8, 3, 5, 'Yoga helped my back pain.'),  
(9, 9, 4, 3, 'Instructor arrived late.'),  
(10, 10, 5, 4, 'Good mix of cardio and strength.'),  
(11, 11, 1, 5, 'Trainer is very knowledgeable.'),  
(12, 12, 2, 2, 'Too fast for beginners.'),  
(13, 13, 3, 4, 'Calming yoga environment.'),  
(14, 14, 4, 3, 'Needs more stretching time.'),  
(15, 15, 5, 4, 'Well-paced HIIT session.'),  
(16, 16, 1, 5, 'Friendly and professional.'),  
(17, 17, 2, 4, 'Good for weight loss.'),  
(18, 18, 3, 5, 'Helped with flexibility.'),  
(19, 19, 4, 3, 'Room was too hot.'),  
(20, 20, 5, 4, 'Enjoyed the group dynamics.'),  
(21, 21, 1, 5, 'Trainer gave personal attention.'),  
(22, 22, 2, 3, 'Needs better explanations.'),  
(23, 23, 3, 4, 'Great for stress relief.'),  
(24, 24, 4, 2, 'Didn’t feel challenged.'),  
(25, 25, 5, 5, 'Best class I’ve attended!');

insert into TrainerSchedule (schedule_id, trainer_id, day, start_time, end_time) values 
(1, 1, 'Monday', '070000', '090000'), 
(2, 2, 'Tuesday', '080000', '100000'), 
(3, 3, 'Wednesday', '063000', '083000'), 
(4, 4, 'Thursday', '170000', '190000'), 
(5, 5, 'Friday', '180000', '200000'),
(6, 1, 'Wednesday', '070000', '090000'),
(7, 1, 'Friday', '070000', '090000'),
(8, 2, 'Monday', '100000', '120000'),
(9, 2, 'Thursday', '080000', '100000'),
(10, 2, 'Saturday', '090000', '110000'),
(11, 3, 'Monday', '063000', '083000'),
(12, 3, 'Thursday', '070000', '090000'),
(13, 3, 'Saturday', '080000', '100000'),
(14, 4, 'Monday', '170000', '190000'),
(15, 4, 'Wednesday', '170000', '190000'),
(16, 4, 'Saturday', '160000', '180000'),
(17, 5, 'Tuesday', '180000', '200000'),
(18, 5, 'Thursday', '180000', '200000'),
(19, 5, 'Sunday', '090000', '110000'),
(20, 1, 'Sunday', '070000', '090000'),
(21, 2, 'Sunday', '100000', '120000'),
(22, 3, 'Sunday', '080000', '100000'),
(23, 4, 'Sunday', '170000', '190000'),
(24, 5, 'Wednesday', '180000', '200000'),
(25, 1, 'Thursday', '070000', '090000');

insert into Admins (admin_id, username, password, email) values  
(1, 'admin1', 'securePass123', 'admin1@gym.com'), 
(2, 'admin2', 'pass456Secure', 'admin2@gym.com'), 
(3, 'gym_admin', 'gymAdmin@2025', 'gym_admin@gym.com'), 
(4, 'adminUser', 'Adm1nUs3r!', 'adminUser@gym.com'), 
(5, 'superadmin', 'Sup3rAdm1n$', 'superadmin@gym.com'), 
(6, 'john_admin', 'JohN1234!@#', 'john_admin@gym.com'),  
(7, 'maria_admin', 'Mar@456admin', 'maria_admin@gym.com'),  
(8, 'dave_super', 'Sup3rDave!@', 'dave_super@gym.com'),  
(9, 'lucy_admin', 'LucYpass2025', 'lucy_admin@gym.com'),  
(10, 'kevin_gym', 'Kev!nGym#01', 'kevin_gym@gym.com'),  
(11, 'nancy_admin', 'N@ncY987', 'nancy_admin@gym.com'),  
(12, 'steve_adm', 'AdmSteve2025$', 'steve_adm@gym.com'),  
(13, 'linda_super', 'SuperLinda!23', 'linda_super@gym.com'),  
(14, 'tony_admin', 'ToNyPass#99', 'tony_admin@gym.com'),  
(15, 'admin_chris', 'ChRi$2025', 'admin_chris@gym.com'),  
(16, 'admin_megha', 'M3gh@Secure', 'admin_megha@gym.com'),  
(17, 'rohit_admin', 'Roh1tAdmin#$', 'rohit_admin@gym.com'),  
(18, 'sara_admin', 'S@raGYM456', 'sara_admin@gym.com'),  
(19, 'vikram_adm', 'Vikr@M$789', 'vikram_adm@gym.com'),  
(20, 'admin_lee', 'L33_Admin@12', 'admin_lee@gym.com'),  
(21, 'ashwin_admin', 'Ash123@@Gym', 'ashwin_admin@gym.com'),  
(22, 'reena_admin', 'Reena#123', 'reena_admin@gym.com'),  
(23, 'jake_admin', 'Jak3Pa$$w0rd', 'jake_admin@gym.com'),  
(24, 'neha_super', 'Neh@S2025$', 'neha_super@gym.com'),  
(25, 'karthik_admin', 'Kar#th1k!@', 'karthik_admin@gym.com');

-- view tables by select queries

select  from Members;
select  from Trainers;
select  from MembershipPlans;
select  from Subscriptions;
select  from Payments;
select  from Equipment;
select  from Classes;
select  from Attendance;
select  from Feedback;
select  from TrainerSchedule;
select  from Admins;

-- select queries 

-- Join Get member name and their enrolled class name 
SELECT M.first_name, M.last_name, C.class_name 
FROM Members M 
JOIN Attendance E ON M.member_id = E.member_id 
JOIN Classes C ON E.class_id = C.class_id; 

-- Group By Count how many members in each class 
SELECT C.class_name, COUNT(E.member_id) AS total_members 
FROM Classes C 
LEFT JOIN Attendance E ON C.class_id = E.class_id 
GROUP BY C.class_name;

-- Join Query 
SELECT M.first_name, M.last_name, MP.plan_name, S.status 
FROM Members M 
JOIN Subscriptions S ON M.member_id = S.member_id 
JOIN MembershipPlans MP ON S.plan_id = MP.plan_id;

-- Group By 
SELECT trainer_id, COUNT() AS total_classes FROM Classes GROUP BY trainer_id;

-- Order By 
SELECT  FROM Payments ORDER BY amount DESC;

-- Order By List members alphabetically 
SELECT  FROM Members ORDER BY first_name ASC;

-- Limit Show only 5 recent enrollments 
SELECT  FROM subscriptions ORDER BY start_date DESC LIMIT 5;

-- Limit 
SELECT  FROM Members LIMIT 5; 

-- View 
CREATE VIEW ActiveMembers AS 
SELECT M.member_id, M.first_name, M.last_name 
FROM Members M 
JOIN Subscriptions S ON M.member_id = S.member_id 
WHERE S.status = 'Active'; 

-- Update Query 
UPDATE Members SET phone = '9999999999' WHERE member_id = 1; 

-- Delete Query 
DELETE FROM Feedback WHERE rating  3; 

-- Alter Table 
ALTER TABLE Members ADD COLUMN join_date DATE; 

-- Rename Table 
RENAME TABLE Equipment TO GymEquipment; 

-- Drop Table 
DROP TABLE Admins; 

-- Truncate Table 
TRUNCATE TABLE Attendance; 

-- Union Query 
SELECT email FROM Members 
UNION 
SELECT email FROM Trainers;

-- List all trainers with their specialization 
SELECT name, specialization FROM Trainers; 

-- Show all membership plans that cost more than 2000 
SELECT plan_name, price FROM MembershipPlans WHERE price  2000; 

-- Get all classes scheduled on Wednesday 
SELECT class_name, schedule_time FROM Classes WHERE day_of_week = 'Wednesday'; 

-- Display member names and their email addresses 
SELECT first_name, last_name, email FROM Members; 

-- List all feedback comments for trainer_id = 2 
SELECT comment FROM Feedback WHERE trainer_id = 2;

-- Get members who attended classes on '2025-07-01' 
SELECT M.first_name, M.last_name, C.class_name 
FROM Attendance A 
JOIN Members M ON A.member_id = M.member_id 
JOIN Classes C ON A.class_id = C.class_id 
WHERE A.date = '2025-07-01'; 

-- Find total amount paid by each member 
SELECT M.member_id, M.first_name, SUM(P.amount) AS total_paid 
FROM Members M 
JOIN Subscriptions S ON M.member_id = S.member_id 
JOIN Payments P ON S.subscription_id = P.subscription_id 
GROUP BY M.member_id, M.first_name; 

-- List all classes and show how many times each was attended 
SELECT C.class_name, COUNT(A.attendance_id) AS attendance_count 
FROM Classes C 
LEFT JOIN Attendance A ON C.class_id = A.class_id 
GROUP BY C.class_name; 

-- Get all members whose subscription has expired 
SELECT M.first_name, M.last_name 
FROM Members M 
JOIN Subscriptions S ON M.member_id = S.member_id 
WHERE S.status = 'Expired'; 

-- Get all equipment with quantity less than 5 
SELECT name, quantity FROM GymEquipment WHERE quantity  5;

-- Get trainers who have received an average rating above 4 
SELECT T.trainer_id, T.name, AVG(F.rating) AS avg_rating 
FROM Trainers T 
JOIN Feedback F ON T.trainer_id = F.trainer_id 
GROUP BY T.trainer_id, T.name 
HAVING avg_rating  4; 

-- Get members who never attended any classes 
SELECT M.first_name, M.last_name 
FROM Members M 
LEFT JOIN Attendance A ON M.member_id = A.member_id 
WHERE A.member_id IS NULL; 

-- Get class names and names of trainers who handle more than one class 
SELECT T.name AS trainer_name, C.class_name 
FROM Trainers T 
JOIN Classes C ON T.trainer_id = C.trainer_id 
WHERE T.trainer_id IN ( 
SELECT trainer_id FROM Classes GROUP BY trainer_id HAVING COUNT()  1 
); 

-- List members along with their subscription start and end date, and plan price 
SELECT M.first_name, M.last_name, S.start_date, S.end_date, P.price 
FROM Members M 
JOIN Subscriptions S ON M.member_id = S.member_id 
JOIN MembershipPlans P ON S.plan_id = P.plan_id; 

-- Get the top 3 members who paid the highest total amount 
SELECT M.first_name, M.last_name, SUM(P.amount) AS total_payment 
FROM Members M  
JOIN Subscriptions S ON M.member_id = S.member_id 
JOIN Payments P ON S.subscription_id = P.subscription_id 
GROUP BY M.member_id 
ORDER BY total_payment DESC 
LIMIT 3;

-- queries using procedure

-- returns the list of members (first_name, last_name) who currently have an Active subscription.
DELIMITER &&

CREATE PROCEDURE GetActiveMembers()
BEGIN
    SELECT first_name, last_name 
    FROM Members M
    JOIN Subscriptions S ON M.member_id = S.member_id
    WHERE S.status = 'Active';
END&&

DELIMITER ;

CALL GetActiveMembers();

-- Create a procedure to get total amount paid by a member
DELIMITER 

CREATE PROCEDURE GetTotalPayment(IN mem_id INT)
BEGIN
    SELECT M.first_name, M.last_name, SUM(P.amount) AS total_paid
    FROM Members M
    JOIN Subscriptions S ON M.member_id = S.member_id
    JOIN Payments P ON S.subscription_id = P.subscription_id
    WHERE M.member_id = mem_id
    GROUP BY M.member_id;
END 

DELIMITER ;

CALL GetTotalPayment(1);



-- CASE Scenarios

-- Categorize members by subscription plan price

SELECT M.first_name, M.last_name, MP.plan_name, MP.price,
CASE 
    WHEN MP.price  2000 THEN 'Low'
    WHEN MP.price BETWEEN 2000 AND 5000 THEN 'Medium'
    ELSE 'High'
END AS price_category
FROM Members M
JOIN Subscriptions S ON M.member_id = S.member_id
JOIN MembershipPlans MP ON S.plan_id = MP.plan_id;

-- Show membership status with remarks

SELECT M.first_name, M.last_name, S.status,
CASE 
    WHEN S.status = 'Active' THEN 'Keep Active'
    WHEN S.status = 'Expired' THEN 'Renew Soon'
    WHEN S.status = 'Cancelled' THEN 'Check Reason'
END AS remarks
FROM Members M
JOIN Subscriptions S ON M.member_id = S.member_id;


-- IF…ELSE Scenarios
-- Procedure to check if member has active subscription
DELIMITER 

CREATE PROCEDURE CheckMemberStatus(IN mem_id INT)
BEGIN
    DECLARE sub_status ENUM('Active','Expired','Cancelled');

    SELECT status INTO sub_status
    FROM Subscriptions
    WHERE member_id = mem_id
    ORDER BY subscription_id DESC
    LIMIT 1;

    IF sub_status = 'Active' THEN
        SELECT CONCAT('Member ID ', mem_id, ' is Active Member') AS result;
    ELSE
        SELECT CONCAT('Member ID ', mem_id, ' is Inactive Member') AS result;
    END IF;
END 

DELIMITER ;

CALL CheckMemberStatus(1);


-- Procedure to update equipment condition based on usage

DELIMITER 

CREATE PROCEDURE UpdateEquipmentCondition()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE eq_id INT;
    DECLARE qty INT;
    DECLARE cur CURSOR FOR SELECT equipment_id, quantity FROM GymEquipment;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop LOOP
        FETCH cur INTO eq_id, qty;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF qty  5 THEN
            UPDATE GymEquipment SET `condition` = 'Needs Repair' WHERE equipment_id = eq_id;
        ELSE
            UPDATE GymEquipment SET `condition` = 'Good' WHERE equipment_id = eq_id;
        END IF;
    END LOOP;
    CLOSE cur;
END 

DELIMITER ;

CALL UpdateEquipmentCondition();