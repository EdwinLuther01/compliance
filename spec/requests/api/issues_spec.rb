require 'rails_helper'
require 'helpers/api/issues_helper'
require 'json'

describe Issue do
  let(:person) { create(:empty_person) }
  
  def assert_issue_integrity(seed_list = [])
    Issue.count.should == 1
    Person.count.should == 1
    Issue.first.person.should == person
    seed_list.each do |seed_type|
      seed_type.constantize.count.should == 1
      seed_type.constantize.last.issue.should == Issue.first
      seed_type.constantize.last.attachments.count.should == 1
    end
  end

  describe 'updating an Issue' do
    it 'responds with an Unprocessable Entity HTTP code (422) when body is empty' do
      post "/api/people/#{person.id}/issues",  params: {}
      assert_response 422
    end

    describe 'creates a new issue with a domicile seed' do
      it 'including a png file attachment' do
      	attachment = Base64.encode64(file_fixture('simple.png').read)
        issue  = Api::IssuesHelper.issue_with_domicile_seed(
          attachment, 
          'image/png',
          'file.png'
        )  
   
        post "/api/people/#{person.id}/issues", params: issue

        assert_issue_integrity(["DomicileSeed"]) 
        assert_response 201
      end
    end

    describe 'creates a new issue with an identification seed' do
      it 'including a pdf file attachment' do
      	attachment = Base64.encode64(file_fixture('simple.pdf').read)
        issue  = Api::IssuesHelper.issue_with_identification_seed(
          attachment, 
          'application/pdf',
          'file.pdf'
        )  
   
        post "/api/people/#{person.id}/issues", params: issue

        assert_issue_integrity(["IdentificationSeed"]) 
        assert_response 201
      end
    end


    describe 'creates a new issue with a natural docket seed' do
      it 'including a jpg file attachment' do
      	attachment = Base64.encode64(file_fixture('simple.jpg').read)
        issue  = Api::IssuesHelper.issue_with_natural_docket_seed(
          attachment, 
          'image/jpg',
          'file.jpg'
        )  
  
        post "/api/people/#{person.id}/issues", params: issue

        assert_issue_integrity(["NaturalDocketSeed"]) 
        assert_response 201
      end
    end

    describe 'creates a new issue with a legal entity docket seed' do
      it 'including a zip file attachment' do
      	attachment = Base64.encode64(file_fixture('simple.zip').read)
        issue  = Api::IssuesHelper.issue_with_legal_entity_docket_seed(
          attachment, 
          'application/zip',
          'file.zip'
        )  
  
        post "/api/people/#{person.id}/issues", params: issue

        assert_issue_integrity(["LegalEntityDocketSeed"]) 
        assert_response 201
      end
    end

    describe 'creates a new issue with a allowance seed' do
      it 'including a gif file attachment' do
      	attachment = Base64.encode64(file_fixture('simple.gif').read)
        issue  = Api::IssuesHelper.issue_with_allowance_seed(
          attachment, 
          'image/gif',
          'file.gif'
        )  
  
        post "/api/people/#{person.id}/issues", params: issue

        assert_issue_integrity(["AllowanceSeed"]) 
        assert_response 201
      end
    end
  end

  describe 'getting an issue' do
    it 'responds with a not found error 404 when the issue does not exist' do
      get "/api/people/#{person.id}/issues/1"
      assert_response 404
    end

    it 'shows all the person info when the issue exist' do  
      attachment = Base64.encode64(file_fixture('simple.png').read)
      issue  = Api::IssuesHelper.issue_with_domicile_seed(
        attachment, 
        'image/png',
        'file.png'
      )
      post "/api/people/#{person.id}/issues", params: issue

      assert_issue_integrity(["DomicileSeed"])
  
      get  "/api/people/#{person.id}/issues/#{Issue.first.id}"
      assert_response 200
    end
  end
end
