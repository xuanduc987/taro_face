# frozen_string_literal: true

module Mutations
  class CreateTerm < BaseMutation
    argument :term, String, required: true
    argument :reading, String, required: false
    argument :meaning, String, required: false

    field :term, Types::TermType, null: true
    field :errors, [String], null: false

    def resolve(term:, reading: nil, meaning: nil)
      term = Term.new(term: term, reading: reading, meaning: meaning)
      if term.save
        {
          term: term,
          errors: []
        }
      else
        {
          term: nil,
          errors: term.errors.full_messages
        }
      end
    end
  end
end
