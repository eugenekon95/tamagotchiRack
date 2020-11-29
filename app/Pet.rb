require "yaml"
require_relative "Animal.rb"

class Pet < Animal
  attr_accessor :health, :mood, :hunger, :sleeping, :stamina, :agility, :intelect, :purity, :user

  def initialize(animal, name, username)
    super(animal, name)
    @health = 10
    @mood = 10
    @hunger = 10
    @sleeping = 10
    @stamina = 10
    @agility = 10
    @intelect = 10
    @purity = 10
    @user = username
  end

  #----------user actions----------
  def feed
    p "You are feeding #{@name}"
    @hunger += rand(1..5)
    @health += rand (1..5)
    p "Characteristics after event : Hunger = #{@hunger}"
    save
    pastTime
  end

  def wash
    p "You are washing #{@name}"
    @purity += rand(1..5)
    p "Characteristics after event : Purity = #{@purity}  Mood: = #{@mood}"
    save
    pastTime
  end

  def train
    p "You are training #{@name}"
    @agility += rand(1..5)
    @intelect += rand(1..5)
    @stamina += rand(1..5)
    @hunger > 0 ? @hunger -= rand(1..5) : @hunger = 0
    @sleeping > 0 ? @sleeping -= rand(1..5) : @sleeping = 0
    @mood > 0 ? @mood -= rand(1..5) : @mood = 0
    @purity > 0 ? @purity -= rand(1..5) : @purity = 0
    @health > 0 ? @health -= rand(1..5) : @health = 0

    puts "Characteristics after event :
      Agility = #{@agility}  Mood: = #{@mood}  Intelect = #{@intelect}  Stamina: = #{@stamina}
      Hunger = #{@hunger}  Sleeping: = #{@sleeping} Purity = #{@purity}"
    save
    pastTime
  end

  def play
    p "You are playing with #{@name}"
    @mood += rand(1..5)
    @stamina > 0 ? @stamina -= rand(1..5) : @stamina = 0
    @hunger > 0 ? @hunger -= rand(1..5) : @hunger = 0
    @sleeping > 0 ? @sleeping -= rand(1..5) : @sleeping = 0

    puts "Characteristics after event :
      Hunger = #{@hunger}  Mood: = #{@mood}  Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    save
    pastTime
  end

  def sleep
    p "#{@name} is sleeping "
    @mood += rand(1..5)
    @stamina += rand(1..5)
    @hunger > 0 ? @hunger -= rand(1..5) : @hunger = 0
    @sleeping += rand(1..5)

    puts "Characteristics after event :
    Hunger = #{@hunger}  Mood: = #{@mood} Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    save
    pastTime
  end

  def walk
    p "#{@name} is walking "
    @stamina += rand(1..5)
    @hunger > 0 ? @hunger -= rand(1..5) : @hunger = 0
    @sleeping > 0 ? @sleeping -= rand(1..5) : @sleeping = 0
    @purity > 0 ? @purity -= rand(1..5) : @purity = 0
    @health > 0 ? @health -= rand(1..5) : @health = 0

    puts "Characteristics after event :
    Hunger = #{@hunger}  Purity: = #{@purity} Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    save
    pastTime
  end

  def search
    p "#{@name} is searching "
    @stamina > 0 ? @stamina -= rand(1..5) : @stamina = 0
    @intelect += rand(1..5)
    puts "Characteristics after event :
    Stamina = #{@stamina}  Intelect: = #{@intelect}"
    save
    pastTime
  end

  def status
    puts "      #{@animal}      #{@name}
        |health| = #{@health}   |hunger| = #{@hunger}       |purity| = #{@purity}     |agility| = #{@agility}
        |stamina| = #{@stamina}  |sleeping| = #{@sleeping}  |intelect| = #{@intelect}   |mood| = #{@mood}
        "
  end

  def spectate
    p "You spectating on #{@name}"
    randomEvent
    save
    pastTime
  end

  def help
    puts "Tamagotchi MY PET methods"
    p "Feed: Feeding the animal increases hunger property on random value"
    p "Wash: Washing the animal increases purity property decreases mood on random value"
    p "Train: Training the animal increases agility, intelect properties dicreases stamina hunger sleeping mood purity on random value"
    p "Play: Playing with animal increases mood property decreases stamina hunger sleeping on random value"
    p "Sleep: Animal sleep increases mood stamina sleeping decreases hunger on random value"
    p "Walk: Animal walking decreases stamina hunger sleeping purity on random value"
    p "Search: Animal train searching skill increases intelect decreases stamina on random value"
    p "Status: Show animal status"
    p "Spectate: Just spectating on animal"
  end

  #----------private methods----------

  private

  def pastTime
    hours = rand(1..5)
    if hours == 0
      p "Past less than an hour"
    else
      p "Past #{hours} hours"
    end

    @sleeping > 0 ? @sleeping -= rand(1..2) : @sleeping = 0
    @mood > 0 ? @mood -= rand(1..2) : @mood = 0
    @purity > 0 ? @purity -= rand(1..2) : @purity = 0
    checkPet()
  end

  def randomEvent
    event = rand(1..5)
    case event
    when event == 1
      p "Rain is started #{@name} is very upset and running into pethouse"
      @sleeping > 0 ? @sleeping -= rand(10) : @sleeping = 0
      @purity > 0 ? @purity -= rand(10) : @purity = 0
      @mood > 0 ? @mood -= rand(10) : @mood = 0

    when event == 2
      p "#{@name} broke your shoes and hide"
      @sleeping > 0 ? @sleeping -= rand(10) : @sleeping = 0
      @purity > 0 ? @purity -= rand(10) : @purity = 0
      @mood += rand(20)

    when event == 3
      p "#{name} found old broken pet toy"
      @sleeping > 0 ? @sleeping -= rand(10) : @sleeping = 0
      @purity > 0 ? @purity -= rand(10) : @purity = 0
      @mood += rand(10)

    when event == 4
      p "#{name} trying to bite you"
      @mood > 0 ? @mood -= rand(10) : @mood = 0
      @intelect > 0 ? @intelect -= rand(10) : @intelect = 0

    when event == 5
      p "#{name} going into your house"
      @mood += rand(10)
      @intelect += rand(10)

    else
      p "Nothing happens"
    end
  end

  def hungry?
    @hunger <= 1
  end

  def sleepy?
    @sleeping <= 1 && @stamina <= 1
  end

  def bored?
    @mood <= 1
  end

  def tired?
    @stamina <= 1
  end

  def dirty?
    @purity <= 1
  end

  def runnaway?
    if @mood <= 0 && @hunger <= 0
    end
  end

  def petIsDead
    if @hunger <= 0 && @health <= 0 
      puts "I`m dying goodbye"
      puts "Game Over"
      exit

    end
  end

  def checkPet()
    puts("Feed me") if hungry?
    puts("Play with me!") if bored?
    puts("I need rest!") if sleepy?
    puts("I need shower!") if dirty?
    puts("Freedom") if runnaway?
    exit if petIsDead
  end

  def save
    yaml = YAML.dump(self)
    File.open("./database/pets.yml", 'w') { |file| file.puts(yaml) }
  end
end
