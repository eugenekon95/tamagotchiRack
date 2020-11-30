require "erb"
require './app/lib/controller'


class Pet
  include Controller
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    
    @req = Rack::Request.new(env)
    @health = 10
    @mood = 10
    @hunger = 10
    @sleeping = 10
    @stamina = 10
    @agility = 10
    @intelect = 10
    @purity = 10
    @speed = 10
    $stats = %w[health hunger sleeping stamina mood agility intelect purity speed]
    
  end

  #----------user actions----------
  def response
    case @req.path
    when '/'
      Rack::Response.new(render("create_pet.html.erb"))

    when '/initialize'
      Rack::Response.new do |response|
        response.set_cookie('health', @health)
        response.set_cookie('hunger', @hunger)
        response.set_cookie('sleep', @sleeping)
        response.set_cookie('mood', @mood)
        response.set_cookie('stamina', @stamina)
        response.set_cookie('agility', @agility)
        response.set_cookie('intelect', @intelect)
        response.set_cookie('speed', @speed)
        response.set_cookie('purity', @purity)
        response.set_cookie('name', @req.params['name'])
        response.redirect('/start')
      end

    when '/exit'
      Rack::Response.new('Game Over', 404)
      Rack::Response.new(render("over.html.erb"))

    when '/start'
      if get("health") <=0 || get("stamina") <= 0 || get("hunger") <= 0 || get("mood") <= 0
        Rack::Response.new('Game Over', 404)
        Rack::Response.new(render("game_over.html.erb"))
      else
        Rack::Response.new(render("index.html.erb"))
      end

    when '/change'
      return Controller.change_params(@req, 'health') if @req.params['health']
      return Controller.change_params(@req, 'hunger')   if @req.params['hunger']
      return Controller.change_params(@req, 'sleep')  if @req.params['sleep']
      return Controller.change_params(@req, 'mood')  if @req.params['mood']
      return Controller.change_params(@req, 'stamina')  if @req.params['stamina']
      return Controller.change_params(@req, 'agility')   if @req.params['agility']
      return Controller.change_params(@req, 'intelect')  if @req.params['intelect']
      return Controller.change_params(@req, 'speed')  if @req.params['speed']
      return Controller.change_params(@req, 'purity')  if @req.params['purity']
    else
      Rack::Response.new('Not Found', 404)
    end
  end

  def render(template)
    path = File.expand_path("../view/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def name
    name = @req.cookies['name'].delete(' ')
    name.empty? ? 'Pet' : @req.cookies['name']
  end

  def get(attr)
    @req.cookies["#{attr}"].to_i
  end



        
end
