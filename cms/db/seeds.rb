  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 Patient.create(name: 'xyz', email: "xyz@xyz.com",age:20,sex:"male",phone:8686868686,doctor_id:8)
 Patient.create(name: 'xyz1', email: 'xyz2@xyz.com',age:20,sex:'male',phone:8686868686,doctor_id:8)
 Patient.create(name: 'xyz2', email: 'xyz3@xyz.com',age:20,sex:'male',phone:8686868686,doctor_id:8)
 Patient.create(name: 'xyz3', email: 'xyz4@xyz.com',age:20,sex:'male',phone:8686868686,doctor_id:8)
 Patient.create(name: 'xyz4', email: 'xyz5@xyz.com',age:20,sex:'male',phone:8686868686,doctor_id:8)
 Appointment.create(user_id:1,patient_id:1,start_time:DateTime.now, end_time: DateTime.now + 10.minutes)
 Appointment.create(user_id:2,patient_id:2,start_time:DateTime.now + 10.minutes, end_time: DateTime.now + 20.minutes)
 Appointment.create(user_id:3,patient_id:3,start_time:DateTime.now + 20.minutes, end_time: DateTime.now + 30.minutes)
 Appointment.create(user_id:4,patient_id:4,start_time:DateTime.now + 30.minutes,end_time: DateTime.now + 40.minutes)