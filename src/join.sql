CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR(50) NOT NULL UNIQUE,
                       phone_number VARCHAR(50),
                       first_name VARCHAR(50) NOT NULL,
                       address VARCHAR(100)
);

CREATE TABLE car (
                     id SERIAL PRIMARY KEY,
                     make VARCHAR(100) NOT NULL,
                     model VARCHAR(100) NOT NULL,
                     year_of_manufacture DATE NOT NULL,
                     mileage VARCHAR(100),
                     condition VARCHAR(50),
                     price VARCHAR(50),
                     user_id INTEGER,
                     CONSTRAINT car_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id));

INSERT INTO users (email, phone_number, first_name, address)
VALUES
    ('john.doe@example.com', '123-456-7890', 'John', '123 Main St, Springfield'),
    ('jane.smith@example.com', '987-654-3210', 'Jane', '456 Elm St, Shelbyville'),
    ('michael.brown@example.com', NULL, 'Michael', '789 Oak St, Capital City'),
    ('emily.davis@example.com', '555-555-5555', 'Emily', NULL),
    ('alex.jones@example.com', NULL, 'Alex', '101 Pine St, Metropolis');


INSERT INTO car (make, model, year_of_manufacture, mileage, condition, price, user_id)
VALUES
    ('Toyota', 'Corolla', '2018-05-20', '50000', 'Used', '15000', 1),
    ('Honda', 'Civic', '2020-03-15', '30000', 'New', '20000', 2),
    ('Ford', 'Focus', '2015-07-10', '80000', 'Used', '10000', 3),
    ('BMW', 'X5', '2022-09-01', '10000', 'New', '50000', 4),
    ('Tesla', 'Model 3', '2021-01-20', '15000', 'New', '45000', NULL); -- Car without an owner


INSERT INTO users (email, phone_number, first_name, address)
VALUES
    ('charles.miller@example.com', '111-222-3333', 'Charles', '221B Baker St, London'),
    ('sarah.connor@example.com', NULL, 'Sarah', 'Cyberdyne Blvd, Los Angeles'),
    ('bruce.wayne@example.com', '000-000-0000', 'Bruce', 'Wayne Manor, Gotham'),
    ('clark.kent@example.com', '123-987-6543', 'Clark', 'Smallville, Kansas'),
    ('diana.prince@example.com', NULL, 'Diana', 'Themyscira, Paradise Island');



INSERT INTO car (make, model, year_of_manufacture, mileage, condition, price, user_id)
VALUES
    ('Mercedes-Benz', 'C-Class', '2017-03-10', '45000', 'Used', '22000', 2),
    ('Hyundai', 'Elantra', '2019-08-15', '30000', 'Used', '18000', 3),
    ('Audi', 'A4', '2021-11-25', '15000', 'New', '35000', 4),
    ('Kia', 'Sorento', '2020-05-05', '20000', 'Used', '25000', 5),
    ('Chevrolet', 'Malibu', '2018-06-20', '60000', 'Used', '17000', 1),
    ('Volkswagen', 'Passat', '2020-01-10', '25000', 'Used', '27000', 2),
    ('Subaru', 'Outback', '2022-04-01', '5000', 'New', '34000', 3),
    ('Nissan', 'Altima', '2016-02-18', '75000', 'Used', '13000', NULL), -- Unowned car
    ('Toyota', 'Camry', '2021-09-30', '12000', 'New', '28000', NULL), -- Unowned car
    ('Ford', 'Explorer', '2015-12-12', '80000', 'Used', '20000', 5);

select * from users , car;

select * from users inner join car on car.user_id = users.id;

select * from car inner join users on users.id = car.user_id;

select car.make, car.mileage, users.email, car.model from car inner join users on users.id = car.user_id;

select * from car left join users  on car.user_id = users.id;

select users.email, car.make, car.year_of_manufacture from car join users
                                                                    on car.user_id = users.id where car.make = 'Toyota';

select users.first_name, car.make, car.condition from car join users
                                                               on car.user_id = users.id where users.first_name='John';

select users.first_name, car.make, car.condition, car.year_of_manufacture from car join users
                                                                                        on car.user_id = users.id where car.year_of_manufacture > '2020-01-01';

select * from users u left join car c on u.id = c.user_id where c.user_id is null;

select * from users where id = (select id from users where email = 'diana.prince@example.com');

insert into users(email, phone_number, first_name, address)
values ('aijamal@gmail.com', '239475899e', 'Aijamal', null);

insert into car (make, model, year_of_manufacture, mileage, condition, price, user_id)
values ('Mercedes_Benz', 'E-Class', '2020-03-10', '60000', 'New', '50000',2);

