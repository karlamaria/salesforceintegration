require "salesforceintegration/version"

require 'active_support'
require 'yaml'
require 'databasedotcom'

module SalesforceIntegration
  class SalesforceIntegrationLead
    def initialize(options)
      client = Databasedotcom::Client.new(:client_id => options[:client_id], :client_secret => options[:client_secret], :host => options[:force_url])
      client.authenticate(:username => options[:username], :password => options[:password])

      client.materialize("Lead")
      client.materialize("User")
    end

    #TODO: Permitir associar a contas
    #TODO: Validar campos
    def create_lead_on_salesforce(fields)
      raise "The argument last_name is required" if fields[:last_name.blank?] || fields[:company.blank?]

      lead = Lead.new

      #TODO: Nao esta claro ao que corresponde esse usuario no salesforce. Verificar
      user = User.first
      lead['OwnerId'] = user.Id

      lead['FirstName'] = fields[:first_name]
      lead['LastName'] = fields[:last_name]
      lead['Email'] = fields[:email]
      lead['Company'] = fields[:company]
      lead['Title'] = fields[:job_title]
      lead['Phone'] = fields[:phone]
      lead['Website'] = fields[:website]
      lead['IsConverted'] = false
      lead['IsUnreadByOwner'] = true
      lead.save
      lead.Id
    end
  end
end
