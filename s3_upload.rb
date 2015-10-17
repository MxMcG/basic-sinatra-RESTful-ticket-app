require 'aws-sdk'



Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(access_key, secret_key),
})

s3 = Aws::S3::Resource.new(region:'us-east-1')

puts 'ticket title?'
title = gets.chomp

filename =  "_#{title}.png"
obj = s3.bucket('tixzoo').object("#{DateTime.now.to_date}/#{filename}")
obj.upload_file('./screenshot.png')
