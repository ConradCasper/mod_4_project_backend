# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ******User data********
# Faker::Address.city
# Faker::Company.name
# Faker::Name.name
# Faker::Internet.username
# Faker::Internet.email

# ********* Cohort data *********
# Faker::Address.city
# Faker::Date.between(from: 85.days.ago, to: Date.today)


Cohort.destroy_all
User.destroy_all
UserCohort.destroy_all


50.times do
    User.create(
        name: Faker::Name.name,
        location: Faker::Address.city,
        username: Faker::Internet.username,
        password: "password",
        email: Faker::Internet.email,
        project_1: "https://github.com/conradcasper22/jwt-auth-rails-atlanta-web-060319",
        project_2: "https://github.com/conradcasper22/react-components-as-routes-atlanta-web-060319",
        facebook: "https://www.facebook.com/conrad.casper.5",
        github: "https://github.com/conradcasper22",
        linkedIn: "https://www.linkedin.com/in/conradcasper/",
        twitter: "https://twitter.com/Conrad_Casper",
        current_employer: Faker::Company.name    
    )
end

git_lit = Cohort.create(
    official_name: "atlanta-042219",
    slogan: "Git Lit",
    location: "Atlanta, GA",
    start_date: "Mon, 22 Apr 2019",
    end_date: "Fri, 02 Aug 2019"
)

git_rich = Cohort.create(
    official_name: "atlanta-web-060319",
    location: "Atlanta, GA",
    start_date: "Mon, 03 Jun 2019",
    end_date: "Fri, 13 Sep 2019"

)

6.times do
    Cohort.create(
        official_name: "atlanta-XXXXXX",
        location: "Atlanta, GA",
        slogan: "we don't have a cool name like the other guys",
        start_date: Faker::Date.between(from: 85.days.ago, to: Date.today),
        end_date: Faker::Date.between(from: 85.days.ago, to: Date.today)
    )
end

25.times do
    student = User.all.sample
    UserCohort.create(
        user_id: student.id,
        cohort_id: git_lit.id
    )
end

25.times do
    student = User.all.sample
    UserCohort.create(
        user_id: student.id,
        cohort_id: git_rich.id
    )
end