require 'rubygems'
require 'chunky_png'

class ChunkyImageCompareService
  def self.compareTwoImages(image1Name, image2Name)
    images = [
      ChunkyPNG::Image.from_file(image1Name),
      ChunkyPNG::Image.from_file(image2Name)
    ]

    diff = []

    images.first.height.times do |y|
      images.first.row(y).each_with_index do |pixel, x|
        diff << [x, y] unless pixel == images.last[x, y]
      end
    end

    puts "pixels (total):     #{images.first.pixels.length}"
    puts "pixels changed:     #{diff.length}"
    puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"

    x = diff.map { |xy| xy[0] }
    y = diff.map { |xy| xy[1] }

    images.last.rect(x.min, y.min, x.max, y.max, ChunkyPNG::Color.rgb(0, 255, 0))
    images.last.save('diff.png')
  end
end
