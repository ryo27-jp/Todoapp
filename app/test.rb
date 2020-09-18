class Test 

  def initialize(name,age)
    @name = name
    @age = age
  end

  def name=(value)
    @name = value
  end

  def bau
    puts "watashiha#{@name}"
    puts "ima#{@age}"
  end
end

user = Test.new("11", "22")

user.bau

user.name = "ui"
user.bau


