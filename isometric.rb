#!/usr/bin/ruby
# (Orthographic and) Isometric Projection
# Norbert Reschke

require 'hexapdf'
require_relative 'cc'

x = 0.866 # x = cos(30*PI/180); if you include Math
y = 0.577 # y = tan(30*PI/180); dito

doc = HexaPDF::Document.new
  page = doc.pages.add
  canvas = page.canvas 

  cc(canvas) # license

# begin frame
  canvas.font('Helvetica', size: 8)
  canvas.text( "Produkterstellung - Technische Zeichnungen - in der Ausbildungsvorbereitung", at:[mm(25),mm(288.5)])
  canvas.text( "#{File.basename(__FILE__,'.rb')}.pdf", at:[mm(180),mm(288.5)])
  canvas.line_width(2) {
    canvas.line_cap_style = 2
    canvas.line(mm(25.8),mm(7),mm(199.2),mm(7)).stroke
    canvas.line(mm(25.8),mm(25),mm(199.2),mm(25)).stroke
    canvas.line(mm(25.8),mm(287),mm(199.2),mm(287)).stroke
    canvas.line(mm(25.8),mm(7),mm(25.8),mm(287)).stroke
    canvas.line(mm(199.2),mm(7),mm(199.2),mm(287)).stroke
  }
  canvas.font('Helvetica', size: 15)
  canvas.text( "Isometrie", at:[mm(27),mm(20)])
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
        [1,2,3,4,5,6,7].each { |i|
          canvas.line(mm(43.2)+mm(20*x)*i,mm(25),mm(43.2)+mm(20*x)*i,mm(287)).stroke   # top-bottom
          canvas.line(mm(25.8),mm(35)+mm(20*i),mm(199.2),mm(35)+mm(20*i)+mm(173.4*y)).stroke # left up
          canvas.line(mm(25.8),mm(35)+mm(20*i)+mm(173.4)*y,mm(199.2),mm(35)+mm(20*i)).stroke # right up
        }
      }
    }
  end # helping lines

  canvas.line_width(1.2) { # begin helping line marker
    canvas.stroke_color('000000') {
      canvas.line_cap_style = 1
      [1,2,3,4,5,6,7].each { |i|
        canvas.line(mm(43.2)+mm(20*x)*i,mm(25),mm(43.2)+mm(20*x)*i,mm(28)).stroke   # top
        canvas.line(mm(43.2)+mm(20*x)*i,mm(284),mm(43.2)+mm(20*x)*i,mm(287)).stroke # bottom
        canvas.line(mm(25.8),mm(35)+mm(20*i),mm(28.8),mm(35)+mm(20*i)+mm(3*y)).stroke             # left up, left part
        canvas.line(mm(196.2),mm(135-3*y)+mm(20*i),mm(199.2),mm(135-3*y)+mm(20*i)+mm(3*y)).stroke # left up, right part
        canvas.line(mm(196.2),mm(35)+mm(20*i)+mm(3)*y,mm(199.2),mm(35)+mm(20*i)).stroke           # right up, right part
        canvas.line(mm(25.8),mm(135)+mm(20*i),mm(28.8),mm(135)+mm(20*i)-mm(3*y)).stroke           # right up, left part
      }
    }
  } # end helping line marker

  if ARGV.include?("sign") == true # begin marker sign
    canvas.line_width(1.2) {
      canvas.stroke_color('000000') {
        canvas.line_cap_style = 1
        [1,2,3,4,5,6,7].each { |i|
          canvas.font('Helvetica', size: 10)
          canvas.text( i.to_s, at:[mm(42.2)+mm(20*x)*i,mm(29)])
          canvas.text( i.to_s, at:[mm(42.2)+mm(20*x)*i,mm(281)])
        }
        ['A','B','C','D','E','F','G'].each_with_index { |i,j|
          canvas.text(i, at:[mm(29),mm(36)+mm(20*(j+1))])
          canvas.text(i, at:[mm(193.5),mm(131.5)+mm(20*(j+1))])
        }
        ['g','f','e','d','c','b','a'].each_with_index { |i,j|
          canvas.text(i, at:[mm(193.5),mm(36)+mm(20*(j+1))])
          canvas.text(i, at:[mm(29),mm(131.5)+mm(20*(j+1))])
        }
      }
    }
  end # marker sign

doc.write("#{File.basename(__FILE__,'.rb')}.pdf", optimize: true)
