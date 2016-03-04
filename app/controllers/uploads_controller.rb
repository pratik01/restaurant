class UploadsController < ApplicationController
  require 'base64'
  require 'openssl'
  require 'digest/sha1'
  def index
    expiration_date = 10.hours.from_now.utc.iso8601
    max_filesize = 500.megabytes
    acl = 'public-read'
    key = 'test'
    filter_title = 'Images'
    filter_extentions = 'jpg,jpeg,gif,png,bmp'
    content_type = 'image/'
    bucket            = "myrestaurant"
    access_key_id     = "AKIAIM2SKKJJIVUTIPAA"
    secret_access_key = "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"
    @policy = Base64.encode64(
        "{'expiration': '#{expiration_date}',
        'conditions': [
          {'bucket': '#{bucket}'},
          {'acl': 'public-read'},
          {'success_action_status': '201'},
          ['content-length-range', 0, #{max_filesize}],
          ['starts-with', '$key', 'test/']
        ]
      }").gsub(/\n|\r/, '')


    @signature = Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            secret_access_key, @policy)).gsub("\n","")


  end

  def create
    @upload = Upload.create(params[:doc])
    render :json => {
        :policy => s3_upload_policy_document,
        :signature => s3_upload_signature,
        :key => @upload.s3_key,
        :success_action_redirect => document_upload_success_document_url(@upload)
    }
  end

  def s3_confirm
    head :ok
  end


  private

  def s3_upload_policy_document
    return @policy if @policy
    ret = {"expiration" => 5.minutes.from_now.utc.xmlschema,
           "conditions" =>  [
               {"bucket" =>  "myrestaurant"},
               ["starts-with", "$key", @upload.s3_key],
               {"acl" => "private"},
               {"success_action_status" => "200"},
               ["content-length-range", 0, 1048576]
           ]
    }
    @policy = Base64.encode64(ret.to_json).gsub(/\n/,'')
  end

  # sign our request by Base64 encoding the policy document.
  def s3_upload_signature
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), "0wU8qcDC6Jv5St+4nGTtvWU7QyeQwDhBGwcvxFs/", s3_upload_policy_document)).gsub("\n","")
  end

end
