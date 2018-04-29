#!/usr/bin/env ruby

require 'net/http'

commit_msg_file = ARGV[0]

def is_commit_msg_empty(commit_msg_file)
	length = 0
	File.open(commit_msg_file).each_line do |line|
		line.chomp!
		if line.length < 1 || line.start_with?('#')
			break
		end
		length += 1
	end

	if length < 1
		return true
	end
end

def check_profanities(commit_msg_file)
	if is_commit_msg_empty(commit_msg_file)
		printf("Aborting commit due to empty commit message.\n")
		exit 1
	end
	commit_msg = ''
	commit_msg_contents = File.open(commit_msg_file, 'rb') { |f| f.read }
	commit_msg_contents.each_line do |line|
		if line.start_with?('#')
			break
		end
		commit_msg += line
	end
	commit_msg.strip!
	commit_msg.chomp!
	profanity_api_uri = URI('https://www.purgomalum.com/service/containsprofanity')
	params = { :text => commit_msg }
	profanity_api_uri.query = URI.encode_www_form(params)
	puts profanity_api_uri.query
	res = Net::HTTP.get_response(profanity_api_uri)
	has_profanities = res.body
	if has_profanities.to_s == "true"
		return true
	else
		return false
	end
end

contains_profanities = check_profanities(commit_msg_file)

if contains_profanities
	printf("The commit message must not contain profanities.\n")
	exit 1
end

exit 0
