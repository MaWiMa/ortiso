#!/usr/bin/ruby
# Orthographic (and Isometric) Projection
# Norbert Reschke

require 'hexapdf'
require_relative 'cc'

doc = HexaPDF::Document.new
  page = doc.pages.add
  canvas = page.canvas

  cc(canvas) # license

# begin frame
  canvas.font('Helvetica', size: 8)
  canvas.text( "Produkterstellung - Technische Zeichnungen - in der Ausbildungsvorbereitung", at:[mm(25),mm(291.5)])
  canvas.text( "#{File.basename(__FILE__,'.rb')}.pdf", at:[mm(180),mm(291.5)])
  canvas.line_width(2) {
    canvas.line_cap_style = 2
    canvas.line(mm(25),mm(7),mm(200),mm(7)).stroke
    canvas.line(mm(25),mm(25),mm(200),mm(25)).stroke
    canvas.line(mm(25),mm(290),mm(200),mm(290)).stroke
    canvas.line(mm(25),mm(7),mm(25),mm(290)).stroke
    canvas.line(mm(200),mm(7),mm(200),mm(290)).stroke
  }
  canvas.font('Helvetica', size: 15)
  canvas.text( "3-Tafel-Projektion", at:[mm(27),mm(20)])
  canvas.font('Helvetica', size: 8)
  canvas.text( "Vorname", at:[mm(27),mm(8)])
  canvas.text( "Name", at:[mm(60),mm(8)])
  canvas.text( "Nummer", at:[mm(100),mm(8)])
  canvas.text( "Klasse", at:[mm(150),mm(8)])
  canvas.text( "Datum", at:[mm(180),mm(8)])
# end frame

  if ARGV.include?("helpline") == true # begin helping lines
    canvas.line_width(0.5) {
      canvas.stroke_color('a1a1a1') {
        canvas.line_cap_style = 1
        [1,2,3,4,5,6,7,8].each { |i|
          canvas.line(mm(25)+mm(20*i),mm(25),mm(25)+mm(20*i),mm(290)).stroke
          canvas.line(mm(25),mm(65)+mm(20*i),mm(200),mm(65)+mm(20*i)).stroke
        }
      }
    }
  end # helping lines

  canvas.line_width(1.2) { # begin helping line marker
    canvas.stroke_color('000000') {
      canvas.line_cap_style = 1
      [1,2,3,4,5,6,7,8].each { |i|
        canvas.line(mm(25)+mm(20*i),mm(25),mm(25)+mm(20*i),mm(28)).stroke
        canvas.line(mm(25)+mm(20*i),mm(287),mm(25)+mm(20*i),mm(290)).stroke
        canvas.line(mm(25),mm(65)+mm(20*i),mm(28),mm(65)+mm(20*i)).stroke
        canvas.line(mm(197),mm(65)+mm(20*i),mm(200),mm(65)+mm(20*i)).stroke
      }
    }
  } # end helping line marker

  if ARGV.include?("sign") == true # begin marker sign
    canvas.line_width(1.2) {
      canvas.stroke_color('000000') {
        canvas.line_cap_style = 1
        [1,2,3,4,5,6,7,8].each { |i|
          canvas.line(mm(25)+mm(20*i),mm(25),mm(25)+mm(20*i),mm(28)).stroke
          canvas.font('Helvetica', size: 10)
          canvas.text( i.to_s, at:[mm(24)+mm(20)*i,mm(29)])
          canvas.text( i.to_s, at:[mm(24)+mm(20)*i,mm(284)])
        }
        ['A','B','C','D','E','F','G','H'].each_with_index { |i,j|
          canvas.text( i.to_s, at:[mm(28.5),mm(83.7)+mm(20)*j])
          canvas.text( i.to_s, at:[mm(194),mm(83.7)+mm(20)*j])
        }
      }
    }
  end # marker sign

doc.write("#{File.basename(__FILE__,'.rb')}.pdf", optimize: true)
