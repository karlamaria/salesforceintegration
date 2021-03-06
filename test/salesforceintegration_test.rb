require 'test_helper'

class SalesforceintegrationTest < Minitest::Test

  def setup
    @salesforceintegration = SalesforceIntegration::SalesforceIntegrationLead.new(:client_id => "3MVG9KI2HHAq33RwYSXuaADxYczYSG11EU6HMpqqBCy9pG8qHhBbvncqDOZsweOo0poZEUbb6dZTxXwBrYd9t", :client_secret => "4730020655226818798", :url => "login.salesforce.com", :username => "desafio@desafio.com.br", :password => "1234qwer")
  end

  def teardown
    @salesforceintegration = nil
  end

  def test_that_it_has_a_version_number
    refute_nil ::Salesforceintegration::VERSION
  end

  def test_connect_on_salesforce_without_some_field
    exception = assert_raises(RuntimeError) { SalesforceIntegration::SalesforceIntegrationLead.new(:client_id => "3MVG9KI2HHAq33RwYSXuaADxYczYSG11EU6HMpqqBCy9pG8qHhBbvncqDOZsweOo0poZEUbb6dZTxXwBrYd9t", :client_secret => "4730020655226818798" ) }
    assert_equal( "It's necessary to inform client_id, client_secret, url, username and password!", exception.message )
  end

  def test_create_lead
    id = @salesforceintegration.create_lead_on_salesforce(:first_name => "Karla Maria", :last_name => "Garcia", :email => "", :company => "Resultados Digitais", :job_title => "dddd", :phone => "9999", :password => "fgh")
    refute_nil(Lead.find_by_Id(id)) 
  end

  def test_create_lead_without_last_name_field
    exception = assert_raises(RuntimeError) { id = @salesforceintegration.create_lead_on_salesforce(:first_name => "Karla Maria", :email => "karlamaria@gmail.com", :company => "Resultados Digitais", :job_title => "dddd", :phone => "9999", :password => "fgh") }
    assert_equal( "The fields last_name and company are required", exception.message )
  end

  def test_create_lead_without_company_field
    exception = assert_raises(RuntimeError) { id = @salesforceintegration.create_lead_on_salesforce(:first_name => "Karla Maria", :last_name => "Garcia", :email => "karlamaria@gmail.com", :job_title => "dddd", :phone => "9999", :password => "fgh") }
    assert_equal( "The fields last_name and company are required", exception.message )
  end
 
  def test_create_lead_with_blank_last_name_and_company_fields
    exception = assert_raises(RuntimeError) { id = @salesforceintegration.create_lead_on_salesforce(:first_name => "Karla Maria", :last_name => " ", :email => "karlamaria@gmail.com", :company => " ", :job_title => "dddd", :phone => "9999", :password => "fgh") }
    assert_equal( "The fields last_name and company cannot be blank", exception.message )
  end

  def test_create_lead_with_invalid_email_field
    exception = assert_raises(RuntimeError) { id = @salesforceintegration.create_lead_on_salesforce(:first_name => "Karla Maria", :last_name => "Garcia", :email => "abc", :company => "Resultados Digitais", :job_title => "dddd", :phone => "9999", :password => "fgh") }
    assert_equal( "Email must be valid", exception.message )
  end
end
