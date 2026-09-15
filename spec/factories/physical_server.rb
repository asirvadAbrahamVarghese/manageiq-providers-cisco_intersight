FactoryBot.define do
  factory :cisco_intersight_physical_server,
          :class  => "ManageIQ::Providers::CiscoIntersight::PhysicalInfraManager::PhysicalServer",
          :parent => :physical_server do
    vendor { "cisco" }
    ems_ref { SecureRandom.uuid }

    trait :with_hardware do
      after(:create) do |server|
        computer_system = server.create_computer_system!
        computer_system.create_hardware!(
          :cpu_total_cores => 16,
          :memory_mb       => 65_536
        )
      end
    end

    trait :with_asset_detail do
      after(:create) do |server|
        server.create_asset_detail!(:model => "UCSX-210C-M6")
      end
    end
  end
end
