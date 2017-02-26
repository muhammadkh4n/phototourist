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

  def signup registration, status=:ok
    jpost user_registration_path, registration
    expect(response).to have_http_status(status)
    payload=parsed_body
    if response.ok?
      registration.merge(:id=>payload["data"]["id"],
                         :uid=>payload["data"]["uid"])
    end
  end

  def login credentials, status=:ok
    jpost user_session_path, credentials.slice(:email, :password)
    expect(response).to have_http_status(status)
    return response.ok? ? parsed_body["data"] : parsed_body
  end

  def access_tokens?
    !response.headers["access-token"].nil? if response
  end

  def access_tokens
    if access_tokens?
      @last_tokens=["uid", "client", "token-type", "access-token"].inject({}) {|h,k| h[k]=response.headers[k]; h}
    end
    @last_tokens || {}
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

RSpec.shared_examples "show resource" do |model|
  let(:resource) { FactoryGirl.create(model) }
  let(:bad_id) { 12323423234 }
  let(:payload) { parsed_body }

  it "returns #{model} when using correct ID" do
    get send("#{model}_path", resource.id)
    expect(response).to have_http_status(:ok)
    expect(response.content_type).to eq("application/json")
    response_check if respond_to?(:response_check)
  end

  it "returns not found when using incorrect ID" do
    get send("#{model}_path", bad_id)
    expect(response).to have_http_status(:not_found)
    expect(response.content_type).to eq("application/json")

    payload=parsed_body
    expect(payload).to have_key("errors")
    expect(payload["errors"]).to have_key("full_messages")
    expect(payload["errors"]["full_messages"][0]).to include("cannot", "#{bad_id}")
  end

end

RSpec.shared_examples "create resource" do |model|
  let(:resource_attr) { FactoryGirl.attributes_for(model) }
  let(:payload) { parsed_body }
  
  it "can create #{model} with provided name" do
    jpost send("#{model.to_s.pluralize}_path"), resource_attr
    expect(response).to have_http_status(:created)
    expect(response.content_type).to eq("application/json")

    response_check if respond_to?(:response_check)
  end
end

RSpec.shared_examples "existing resource" do |model|
  let(:resource) { FactoryGirl.create(model) }
  let(:new_name) { "testing" }

  it "can update #{model} name" do
    expect(resource.name).to_not eq(new_name)

    jput send("#{model}_path", resource.id), {:name=>new_name}
    expect(response).to have_http_status(:no_content)

    check_update if respond_to?(:check_update)
  end

  it "can be deleted" do
    head send("#{model}_path", resource.id)
    expect(response).to have_http_status(:ok)

    delete send("#{model}_path", resource.id)
    expect(response).to have_http_status(:no_content)

    head send("#{model}_path", resource.id)
    expect(response).to have_http_status(:not_found)
  end
end
