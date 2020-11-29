class Animal
  attr_accessor :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
  ANIMAL_VOICES = {
    dog: 'bark',
    cat: 'meow',
    raven: 'croak',
    monkey: 'whoop'

  }

  def voice
    voice = ANIMAL_VOICES.keys.include?(@animal) ? ANIMAL_VOICES[@animal] : "hello"
    p voice
  end
end
