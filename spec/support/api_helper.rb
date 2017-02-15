module ApiHelper
  def parsed_body
    JSON.parse(response.body)
  end

  # auto create methods
  ["post", "put"].each do |http_method|
    define_method("j#{http_method}") do |path, params={}, headers={}|
      headers=headers.merge("Content-Type" => "application/json") if !params.empty?
      self.send(http_method, path, params.to_json, headers)
    end
  end
end
