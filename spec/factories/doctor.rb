# spec/factories/doctor.rb

FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    specialty { Faker::Job.field }
    years_of_experience { rand(1..20) }
    bio { Faker::Lorem.paragraph }
    age { rand(30..60) }
    qualifications { Faker::Lorem.words(number: 3).join(' ') }
    location_of_work { Faker::Address.city }
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/sample.png'), 'image/jpeg') }
  end
end
