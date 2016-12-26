# require "shrine"
# require "shrine/storage/s3"
require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
require "shrine/plugins/activerecord"

s3_options = {
  access_key_id: ENV["S3_ACCESS_KEY_ID"],
  secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
  region: ENV["S3_BUCKET_REGION"],
  bucket: ENV["S3_BUCKET_NAME"]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :backgrounding
Shrine.plugin :determine_mime_type
Shrine.plugin :delete_raw
Shrine.plugin :pretty_location
Shrine.plugin :cached_attachment_data

Shrine::Attacher.promote { |data| ImageUploaderPromoteJob.perform_later(data) }
Shrine::Attacher.delete { |data| ImageUploaderDeleteJob.perform_later(data) }
