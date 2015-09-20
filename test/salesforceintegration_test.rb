require 'test_helper'

class SalesforceintegrationTest < Minitest::Test

  def setup
      client = Databasedotcom::Client.new(:client_id => "3MVG9KI2HHAq33RwYSXuaADxYczYSG11EU6HMpqqBCy9pG8qHhBbvncqDOZsweOo0poZEUbb6dZTxXwBrYd9t", :client_secret => "4730020655226818798", :host => "login.salesforce.com")
      client.authenticate(:username => "desafio@desafio.com.br", :password => "1234qwer")
      client.materialize("Lead")
  end

  def test_that_it_has_a_version_number
    refute_nil ::Salesforceintegration::VERSION
  end

  def test_create_lead
    salesforceintegration = SalesforceIntegration::SalesforceIntegrationLead.new("3MVG9KI2HHAq33RwYSXuaADxYczYSG11EU6HMpqqBCy9pG8qHhBbvncqDOZsweOo0poZEUbb6dZTxXwBrYd9t", "4730020655226818798", "login.salesforce.com", "desafio@desafio.com.br", "1234qwer")
    id = salesforceintegration.create_lead_on_salesforce("Karla Maria", "Garcia", "karlamaria@gmail.com", "Resultados Digitais", "dddd", "9999", "fgh")
    refute_nil(Lead.find_by_Id(id)) 
  end
end
