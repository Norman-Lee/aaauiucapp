require 'rails_helper'
require 'spec_helper'

describe Event do
	before { @event = FactoryGirl.build(:event) }

	subject { @event }

	it { should respond_to(:name) }
	it { should respond_to(:location) }
	it { should respond_to(:event_time)}
	it { should respond_to(:desc) }
	it { should respond_to(:deploy_time)}

	it { should validate_presence_of (:name) }
	it { should validate_presence_of (:location) }
	it { should validate_presence_of (:event_time) }
	it { should validate_presence_of(:desc) }
	it { should validate_presence_of(:deploy_time) }

	it { should be_valid }
end