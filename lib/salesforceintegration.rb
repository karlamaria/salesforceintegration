require "salesforceintegration/version"

require 'active_support'
require 'yaml'
require 'databasedotcom'

module SalesforceIntegration
  class SalesforceIntegrationLead
    def initialize(salesforce_client_id, salesforce_client_secret, salesforce_url, salesforce_username, salesforce_password)
      client = Databasedotcom::Client.new(:client_id => salesforce_client_id, :client_secret => salesforce_client_secret, :host => salesforce_url)
      client.authenticate(:username => salesforce_username, :password => salesforce_password)

      client.materialize("Lead")
      client.materialize("User")
    end

    #TODO: Permitir associar a contas
    def create_lead_on_salesforce(first_name, last_name, email, company, job_title, phone, website)
      lead = Lead.new

      #TODO: Nao esta claro ao que corresponde esse usuario no salesforce. Verificar
      user = User.first
      lead['OwnerId'] = user.Id

      lead['FirstName'] = first_name
      lead['LastName'] = last_name
      lead['Email'] = email
      lead['Company'] = company
      lead['Title'] = job_title
      lead['Phone'] = phone
      lead['Website'] = website
      lead['IsConverted'] = false
      lead['IsUnreadByOwner'] = true
      lead.save
    end
  end
end
