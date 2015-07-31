require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  xcontext 'contact_email' do
    subject { ContactMailer.contact_email('Name', 'someone@example.com', 'Comment' )}
    it "sends an email" do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
