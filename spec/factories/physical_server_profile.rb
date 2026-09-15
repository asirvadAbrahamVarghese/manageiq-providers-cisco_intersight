FactoryBot.define do
  factory :cisco_intersight_physical_server_profile,
          :class => "ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::PhysicalServerProfile" do
    sequence(:name) { |n| "Test Server Profile #{n}" }
    ems_ref { SecureRandom.uuid }

    trait :assigned do
      association :assigned_server, :factory => :cisco_intersight_physical_server
    end
  end
end
