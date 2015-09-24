require 'rails_helper'
require 'spec_helper'

RSpec.describe "layouts/header", type: :request do
    describe "Get /home" do
        it "should use the home page layout" do
            get root_path
            expect(response).to have_http_status(200)
        end
    end
end

RSpec.describe "layouts/header", type: :request do
    describe "Get /help" do
        it "should use the home page layout" do
            get help_path
            expect(response).to have_http_status(200)
        end
    end
end

RSpec.describe "layouts/header", type: :request do
    describe "Get /contact" do
        it "should use the home page layout" do
            get contact_path
            expect(response).to have_http_status(200)
        end
    end
end

RSpec.describe "layouts/header", type: :request do
    describe "Get /about" do
        it "should use the home page layout" do
            get about_path
            expect(response).to have_http_status(200)
        end
    end
end