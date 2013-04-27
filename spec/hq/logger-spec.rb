require "hq/logger"

module HQ

describe Logger do

	it "can be initialised" do
		subject
	end

	context "#add_target" do

		[ :ansi, :html, :raw, :text ].each do
			|type|

			it "works for #{type}" do
				out = StringIO.new
				subject.add_target out, type, :notice
			end

		end

	end

end

end
