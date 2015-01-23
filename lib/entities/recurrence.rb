require_relative 'entity'

module GCAPI
  class Recurrence < Entity
    def initialize(attributes)
      @recurrence = parse_recurrence(attributes[:reccurence]) if attributes
    end

    def parse_reccurence(string)
      string
    end
  end
end