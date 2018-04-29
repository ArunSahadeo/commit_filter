#!/usr/bin/env ruby

require 'fileutils'

class Commit_Filter
	def self.create_commit_hook
		commit_hook_script = File.expand_path('commit-msg.rb', File.dirname(__FILE__))
		hook_dir = File.join(Dir.pwd, '.git', 'hooks') 
		FileUtils.cp(commit_hook_script, "#{hook_dir}/commit-msg")
	end
end
