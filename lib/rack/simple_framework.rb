require 'action'

class SimpleFramework
  def self.app
    @app ||= begin
       Rack::Builder.new do
         map "/" do
           run ->(env) {[400, {"Content-type" => 'text/plain'}, ['Page Not Found!']]}
         end
       end
     end
  end
end

def route(pattern, &block)
  SimpleFramework.app.map(pattern) do
    run Action.new(&block)
  end
end
