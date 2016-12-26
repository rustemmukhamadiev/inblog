require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick

  plugin :determine_mime_type
  plugin :validation_helpers
  plugin :processing
  plugin :versions

  plugin :default_url do |context|
    "default-#{context[:record].model_name.param_key}-#{context[:name]}.png"
  end

  Attacher.validate do
    validate_max_size 15.megabytes
    validate_mime_type_inclusion ["image/jpeg", "image/png", "image/gif"]
  end

  process(:store) do |io, _context|
    { thumb: resize_to_limit(io.download, 200, 200) }
  end
end
