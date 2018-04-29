describe Commit_Filter do
	it "get_cwd() equals /var/www/commit_filter" do
		expect(Commit_Filter.get_cwd()).to eql("/var/www/commit_filter")
	end
end
