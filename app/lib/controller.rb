module Controller
  def self.change_params(req, name)
    Rack::Response.new do |response|
      case name
      when 'hunger'
        response.set_cookie('hunger', req.cookies['hunger'].to_i + 10) if req.cookies['hunger'].to_i < 100
        response.set_cookie('health', req.cookies['health'].to_i + 1)
      when 'purity'
        response.set_cookie('purity', req.cookies['purity'].to_i + 10) if req.cookies['hunger'].to_i < 100
        response.set_cookie('mood', req.cookies['mood'].to_i - 5) if req.cookies['mood'].to_i > 0
      when 'mood'
        response.set_cookie('purity', req.cookies['purity'].to_i - 5) if req.cookies['purity'].to_i > 0
        response.set_cookie('mood', req.cookies['mood'].to_i + 10) if req.cookies['mood'].to_i < 100
        response.set_cookie('hunger', req.cookies['hunger'].to_i - 5) if req.cookies['hunger'].to_i > 0
        response.set_cookie('sleep', req.cookies['sleep'].to_i - 5) if req.cookies['sleep'].to_i > 0
      when 'speed'
        response.set_cookie('speed', req.cookies['speed'].to_i + 10) if req.cookies['speed'].to_i < 100
        response.set_cookie('purity', req.cookies['purity'].to_i - 5) if req.cookies['purity'].to_i > 0
        response.set_cookie('hunger', req.cookies['hunger'].to_i - 5) if req.cookies['hunger'].to_i > 0
        response.set_cookie('sleep', req.cookies['sleep'].to_i - 5) if req.cookies['sleep'].to_i > 0
        response.set_cookie('mood', req.cookies['mood'].to_i + 10) if req.cookies['mood'].to_i < 100
        response.set_cookie('intelect', req.cookies['intelect'].to_i - 5) if req.cookies['intelect'].to_i > 0
      when 'stamina'
        response.set_cookie('speed', req.cookies['speed'].to_i + 10) if req.cookies['speed'].to_i < 100
        response.set_cookie('purity', req.cookies['purity'].to_i - 5) if req.cookies['purity'].to_i > 0
        response.set_cookie('hunger', req.cookies['hunger'].to_i - 5) if req.cookies['hunger'].to_i > 0
        response.set_cookie('sleep', req.cookies['sleep'].to_i - 5) if req.cookies['sleep'].to_i > 0
        response.set_cookie('agility', req.cookies['agility'].to_i + 10) if req.cookies['agility'].to_i < 100
        response.set_cookie('intelect', req.cookies['intelect'].to_i + 10) if req.cookies['intelect'].to_i < 100
        response.set_cookie('health', req.cookies['health'].to_i - 5) if req.cookies['health'].to_i > 0
      when 'sleep'
        response.set_cookie('sleep', req.cookies['sleep'].to_i + 10) if req.cookies['sleep'].to_i < 100
        response.set_cookie('stamina', req.cookies['stamina'].to_i + 10) if req.cookies['intelect'].to_i < 100
      when 'intelect'
        response.set_cookie('intelect', req.cookies['intelect'].to_i + 10) if req.cookies['intelect'].to_i < 100
        response.set_cookie('purity', req.cookies['purity'].to_i + 10) if req.cookies['purity'].to_i < 100

      end

      response.redirect('/start')
    end
  end
end
