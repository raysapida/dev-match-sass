require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  it { should validate_attachment_content_type(:avatar).
       allowing('image/png', 'image/gif', 'image/jpeg', 'image/bmp').
       rejecting('text/plain', 'text/xml') }
end
