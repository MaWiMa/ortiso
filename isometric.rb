#!/usr/bin/ruby
# Orthographic and Isometric Projection 
# Norbert Reschke

require 'hexapdf'
require_relative 'cc'
#include Math

x = 0.866 # x = cos(30*PI/180); if you include Math
y = 0.577 # y = tan(30*PI/180); dito
#x = cos(30*PI/180)
#y = tan(30*PI/180)

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

# begin helping lines
  canvas.line_width(0.5) {
    canvas.stroke_color('a1a1a1') {
      canvas.line_cap_style = 1
      [1,2,3,4,5,6,7].each { |i|
        canvas.line(mm(43.2)+mm(20*x)*i,mm(25),mm(43.2)+mm(20*x)*i,mm(287)).stroke   # top-bottom
        canvas.line(mm(25.8),mm(35)+mm(20*i),mm(199.2),mm(35)+mm(20*i)+mm(173.4*y)).stroke # left (plane)
        canvas.line(mm(25.8),mm(35)+mm(20*i)+mm(173.4)*y,mm(199.2),mm(35)+mm(20*i)).stroke # left (plane)
      }
    }
  }
# end helping lines

# begin helping line marker

# end helping line marker

doc.write("#{File.basename(__FILE__,'.rb')}.pdf", optimize: true)
