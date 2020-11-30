module Controller
    def self.change_params(req, name)

        Rack::Response.new do |response|
          response.set_cookie(name, req.cookies["#{name}"].to_i + 2) if req.cookies["#{name}"].to_i < 10
    
          stat = ($stats - [name]).sample
    
          response.set_cookie(stat, req.cookies["#{stat}"].to_i - 2 )
       
          response.redirect('/start')
        end
      end
end