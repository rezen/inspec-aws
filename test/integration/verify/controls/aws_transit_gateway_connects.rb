control 'aws_transit_gateway_connects' do
  impact 1.0
  title 'Describes one or more Connect attachments.'

  describe aws_transit_gateway_connects do
    it { should exist }
  end

  describe aws_transit_gateway_connects do
    its('transit_gateway_attachment_ids') { should include '' }
    its('transport_transit_gateway_attachment_ids') { should include '' }
    its('transit_gateway_ids') { should include '' }
    its('states') { should include 'available' }
    its('options') { should_not be_empty }
    its('tags') { should_not be_empty }
  end
end