FactoryGirl.define do

  factory :city_fixed, class: 'City' do
    name "test"
  end

  factory :city_sequence, class: 'City' do
    sequence(:name) { |n| "test#{n}" }
  end

  factory :city_names, class: 'City' do
    sequence(:name) { |n| ["Larry", "Chooti", "Qismat"][n%3] }
  end

  factory :city_transient, class: 'City' do
    name "test"
    transient do
      male true
    end

    after(:build) do |object, props|
      object.name = props.male ? "Mr. Test" : "Ms. Test"
    end
  end

  factory :city_faker, class: 'City' do
    name { Faker::Address.city }
  end

  factory :city_ctor, class: 'City' do
    transient do
      hash {}
    end
    initialize_with { City.new(hash) }
  end

  factory :city, :parent => :city_fixed do
  end

end
