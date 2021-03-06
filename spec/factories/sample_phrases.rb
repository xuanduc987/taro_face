# frozen_string_literal: true

FactoryBot.define do
  factory :sample_phrase do
    sequence(:phrase) { |i| "Sample phrase #{i}" }
    term
  end
end
