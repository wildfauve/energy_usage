module Usage

  class ConversionFunctions

    class << self

      def function_factory(fn)
        self.send(fn)
      end

      def identity
        Fn.identity
      end

    end

  end

end
