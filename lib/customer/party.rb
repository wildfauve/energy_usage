module Customer

  class Party

    class << self
      def find
        self.new
      end
    end

    def name
      "Household"
    end

    def type
      :group
    end

  end

end
