require "hq/logger/raw-logger"
require "hq/logger/logger-examples"

module HQ
class Logger

describe RawLogger do

	include_examples "a logger"

	context "#output" do

		it "outputs JSON" do

			json = output_for(sample_log_with_content)

			MultiJson.load(json).should == {
				"mode" => "normal",
				"content" => [
					{
						"type" => "log",
						"level" => "debug",
						"hostname" => "hostname",
						"text" => "text",
						"content" => [
							"content 1",
							"content 2",
						],
					},
				],
			}

		end

	end

	context "#valid_modes" do

		it "returns [ :normal, :partial, :complete ]" do
			subject.valid_modes.should == [ :normal, :partial, :complete ]
		end

	end

end

end
end
