# frozen_string_literal: true

# The Singleton class defines the `instance` method that lets clients access the
# unique singleton instance.
# SOURCE: https://refactoring.guru/pt-br/design-patterns/singleton/ruby/example#example-1
class Singleton
  private_class_method :new
  @instance_mutex = Mutex.new
  def initialize
    pp @instance_mutex
  end

  # The static method that controls the access to the singleton instance.
  #
  # This implementation let you subclass the Singleton class while keeping just
  # one instance of each subclass around.
  def self.instance
    return @instance if @instance

    pp 'test'
    pp @instance_mutex
    @instance_mutex.synchronize do
      @instance ||= new
    end

    @instance
  end
end
