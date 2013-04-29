# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


require 'faker'


    #  A mathod that will generate a random time stamp from one month ago to now.
def random_date
    now = Time.now.to_i
    month_ago = (Time.now - 60*60*60*24).to_i
    rand(month_ago..now)
end

def random_exp_date
    now = Time.now.to_i
    month_ago = (Time.now + 60*60*120*24).to_i
    rand(now..month_ago)
end

doctorId_array = []
nurseId_array = []

    # Creates a Admin user

User.create(    userName: "Admin", firstName: "Ray",
                lastName: "Misomali", password: "foobar", password_confirmation: "foobar",
                email: "Admin@example.com", userType: 0, status: 1)

    # Creates a Record Keeper user

User.create(    userName: "rkeeper", firstName: "Steve",
                lastName: "Luis", password: "foobar", password_confirmation: "foobar",
                email: "rkeeper@example.com", userType: 1, status: 1)

    # Creates 10 Doctor, 5 nurse, 3 Pharmacist 
    # First and Last name are random ggit enerated using the Faker gem
    # Email is the first name of the user
    # userName will be the same as the first name
    # password will be foobar
    # user type will be 1, 2, 3 that are maped to Doctor, Nurse, Pharmacist respectivly 
    # status will be a random number from 1 and 2 ( 1 = active , 2 = Inactive)

    5.times do |n|
        firstName = Faker::Name.first_name
        lastName = Faker::Name.last_name
        email = "#{firstName}@me.com"
        userName =  firstName
        password = "foobar"
        password_confirmation = "foobar"
        userType = 0
        status = rand(0..1)
        secondaryTypes = 0000

        doctorId_array.push(userName.downcase)

        Appuser.create(
            :firstName => firstName,
            :lastName => lastName,
            :email => email,
            :userName =>  firstName,
            :password => password,
            :userType => userType,
            :status => status,
            :secondaryTypes => secondaryTypes,
            )
    end


    5.times do |n|
        firstName = Faker::Name.first_name
        lastName = Faker::Name.last_name
        email = "#{firstName}@me.com"
        userName =  firstName
        password = "foobar"
        password_confirmation = "foobar"
        userType = 1
        status = rand(0..1)
        secondaryTypes = 0000

        nurseId_array.push(userName.downcase)

        Appuser.create(
            :firstName => firstName,
            :lastName => lastName,
            :email => email,
            :userName =>  firstName,
            :password => password,
            :userType => userType,
            :status => status,
            :secondaryTypes => secondaryTypes,
            )
    end


    5.times do |n|
        firstName = Faker::Name.first_name
        lastName = Faker::Name.last_name
        email = "#{firstName}@me.com"
        userName =  firstName
        password = "foobar"
        password_confirmation = "foobar"
        userType = 2
        status = rand(0..1)
        secondaryTypes = 0000

        Appuser.create(
            :firstName => firstName,
            :lastName => lastName,
            :email => email,
            :userName =>  firstName,
            :password => password,
            :userType => userType,
            :status => status,
            :secondaryTypes => secondaryTypes,

            )
    end

    5.times do |n|
        firstName = Faker::Name.first_name
        lastName = Faker::Name.last_name
        email = "#{firstName}@me.com"
        userName =  firstName
        password = "foobar"
        password_confirmation = "foobar"
        userType = 3
        status = rand(0..1)
        secondaryTypes = 0000

        Appuser.create(
            :firstName => firstName,
            :lastName => lastName,
            :email => email,
            :userName =>  firstName,
            :password => password,
            :userType => userType,
            :status => status,
            :secondaryTypes => secondaryTypes,
            )
    end


    # Will create 10 patient data using random names, random age, random sex (1 male - 2 female), 
    # and will select a village from the array of village

    10.times do |n|
      firstName = Faker::Name.first_name
      familyName = Faker::Name.last_name
      # create a time stamp then change it to integer
      createdAt = Time.now.to_i 
      patientId = "#{firstName}_#{familyName}_#{createdAt}"
      age = rand(0..54)
      sex = rand(0..1)
      village = ["Harare","Bulawayo","Chitungwiza","Mutare","Gweru", "Kwekwe"].sample

      Patient.create(
            :firstName => firstName,
            :familyName => familyName,
            #:createdAt => createdAt,
            :age => age,
            :sex =>  sex,
            :patientId => patientId,
            :villageName => village, 
            )

    # create 5 Visit entries with random generated data for each patient. 
    # Blood Pressure will be selected from an array.
    # Conditions and observation will be random lorem text using the Faker gem
    # doctorid will be a random number from 1 to 10 since there will be 10 doctors and their id are 1 to 10 in the user table
    # nurseId random number from 11 to 16 since their id's will be from 11 to 16  from the random data created in the user table
    # weight will be a random number between 50 to 150
    # Time stap will be a random date between a month ago and now using the method in the top of the file

      5.times do |t|
        bloodPressure = ["150/90","120/55","140/89","140/90","160/100","121/83","130/78"].sample
        diagnosisTitle = Faker::Lorem.sentence
        conditions = Faker::Lorem.paragraph
        observation = Faker::Lorem.paragraph
        doctorId = doctorId_array.sample
        nurseId = nurseId_array.sample
        weight = rand (50..150)
        triageIn = random_date
        triageOut = random_date + 1232
        doctorIn = random_date
        doctorOut = random_date + 1232
        heartRate = "140 BPM"
        respiration = "16 BPM"
        visitationId = "#{doctorId}#{triageIn}"

        Visit.create(
            :bloodPressure => bloodPressure,
            :diagnosisTitle => diagnosisTitle,
            :conditions => conditions,
            :observation => observation,
            :doctorId => doctorId,
            :nurseId => nurseId,
            :patientId => patientId,
            :weight => weight,
            :triageIn => triageIn,
            :triageOut => triageOut,
            :doctorIn    => doctorIn,
            :doctorOut => doctorOut,
            :heartRate => heartRate,
            :respiration => respiration,
            :visitationId => visitationId,
            )
    end
end

    name_arr = ["Acetamiophene","Acetamiophene (Mapap)","Acryclovir Cream (Zovirax)","Aspirin (Equate)","Aspirin (St. Jospeh)",
        "Inhalation Solution (Ipratorpium Bromide .5mg and Albuterol Sulfate 3.0mp)",
        "Inhalation Solution (Albuterol Sulfate .63 mg)",
        "Albezole (Albendazole Tablets)","Amoxicillin (Medamox)","Amoxicillin (Medamox)",
        "Azithromycin (Uzet)","Cephalexin","Cephalexin","Cephalexin","Co-Trimoxazole/Bactrim (unitrim)",
        "Diphenhydramine (Banophen)","Cimetidine Tablets (Cismetine)","Ciprofloxacin","Co-Amoxiclav/Augmentin Tablet (Cledomox)",
        "Clotrimazole (Clonex Cream)"]

    19.times do |n|
        name = name_arr.pop
        medId = rand(1..100000)
        numContainers = rand(30..60)
        tabletsPerContainer = rand(10..50)
        expiration = random_exp_date
        doseOfTablets = rand (10..50)

        Medication.create(
        :medId => medId,
        :name => name,
        :numContainers => numContainers,
        :tabletsPerContainer => tabletsPerContainer,
        :expiration => expiration,
        :doseOfTablets => doseOfTablets,
        )

    end