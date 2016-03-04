
module UploadsHelper
  require 'base64'
  require 'openssl'
  require 'digest/sha1'
  def s3_upload_policy
    return @policy if @policy
    ret = {"expiration" => 5.minutes.from_now.utc.xmlschema,
           "conditions" =>  [
               {"bucket" =>  "myrestaurant"},
               {"acl" => "public-read"},
               ["starts-with", "$key", "test"],
               ['starts-with', '$Content-Type', 'image/'],
               ['starts-with', '$name', ''],
               ['starts-with', '$Filename', '']
           ]
    }
    @policy = Base64.encode64(ret.to_json).gsub(/\n/,'')
    @policy
  end

  def s3_upload_signature
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), "0wU8qcDC6Jv5St+4nGTtvWU7QyeQwDhBGwcvxFs/", s3_upload_policy)).gsub("\n","")
  end
end
