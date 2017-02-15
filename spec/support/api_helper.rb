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

RSpec.shared_examples "resource index" do |model|
  let!(:resources) { (1..5).map {|i| FactoryGirl.create(model) } }
  let(:payload) { parsed_body }

  it "return all #{model} instances" do
    get send("#{model.to_s.pluralize}_path"), {}, {"Accept"=>"application/json"}
    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq("application/json")

    expect(payload.count).to eq(resources.count)
    response_check if respond_to?(:response_check)
  end
end
