#!/usr/bin/ruby
# Orthographic and Isometric Projection 
# Norbert Reschke

require 'hexapdf'

def mm(z) # point to mm
  z * 72/25.4
end  

def mscale(y)
  y * mm(5)
end

doc = HexaPDF::Document.new
  page = doc.pages.add
  canvas = page.canvas 

# begin   CC
cEye = canvas.graphic_object(:arc,cx: 0,cy: 0,a: 17,b: 17, start_angle: 49, end_angle: 309)
canvas.line_width(4.5)
canvas.translate(mm(10),mm(7)){
  canvas.scale(0.2){
    canvas.translate(125,245) {
      canvas.circle(0,0,55).stroke
  #  canvas.font('Helvetica', size: 55)
  #  canvas.text("CC", at: [-40,-18])
      [-1,1].each { |i|
        canvas.translate(i*20,i+5){
          canvas.draw(cEye).stroke
        }
      }
    canvas.line(-8,-32,12,-29).stroke
    }

    canvas.line(100,183,100,5).stroke
    canvas.font('Helvetica', size: 38)
    canvas.text("SA", at: [106,137])
    canvas.text("NC", at: [106,90])
    canvas.text("BY", at: [106,47])
    canvas.rotate(90) {
      canvas.font('Helvetica', size: 26)
      canvas.text( "Ausbildungsvorbereitung", at: [7,-60])
      canvas.font('Helvetica', size: 13)
      canvas.text( "https://creativecommons.org/licenses/by-nc-sa/4.0", at: [5,-35])
      canvas.font('Helvetica', size: 15)
      canvas.text( "Norbert.Reschke@gMail.com", at: [5,-80])  
    }
  }
}

canvas.rotate(90) {
  canvas.font('Helvetica', size: 6.5)
  canvas.text( "This work in digital or printed form - but neither the handwritten content nor the drawn by hand content - is under this license: < https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode >. At < https://creativecommons.org/licenses/by-nc-sa/4.0 > you", at: [90,-52])
  canvas.text( "will find a human-readable summary. This work is made with hexapdf < https://https://hexapdf.gettalong.org/ >. Why you may use Creative Commons (CC) on your own work? Take a look at these sites: < https://en.wikipedia.org/wiki/Creative_Commons >", at: [90,-59])
  canvas.text( "or < https://creativecommons.org >. If there is any handwritten or drawn by hand content on this paper, signed by another author, you are not allowed to share the paper.", at: [90,-66])
  canvas.text( "Norbert.Reschke@gMail.com [ " + Date.today.to_s + " ]", at: [690,-66])
}
# end CC

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
canvas.text( "Vorname", at:[mm(27),mm(15)])
canvas.text( "Name", at:[mm(60),mm(15)])
canvas.text( "Nummer", at:[mm(100),mm(15)])
canvas.text( "Klasse", at:[mm(130),mm(15)])
canvas.text( "Datum", at:[mm(170),mm(15)])
# end frame

# begin helping lines
canvas.line_width(0.5) {
  canvas.stroke_color('a1a1a1') {
      canvas.line_cap_style = 1
      [1,2,3,4,5,6,7,8].each { |i|
        canvas.line(mm(25)+mm(20*i),mm(25),mm(25)+mm(20*i),mm(290)).stroke
        canvas.line(mm(25),mm(65)+mm(20*i),mm(200),mm(65)+mm(20*i)).stroke
    }
  }
}
# end helping lines

# begin helping line marker
canvas.line_width(1.2) {
  canvas.stroke_color('000000') {
    canvas.line_cap_style = 1
    [1,2,3,4,5,6,7,8].each { |i|
      canvas.line(mm(25)+mm(20*i),mm(25),mm(25)+mm(20*i),mm(28)).stroke
      canvas.line(mm(25)+mm(20*i),mm(286),mm(25)+mm(20*i),mm(290)).stroke
        canvas.line(mm(25),mm(65)+mm(20*i),mm(28),mm(65)+mm(20*i)).stroke
        canvas.line(mm(196),mm(65)+mm(20*i),mm(200),mm(65)+mm(20*i)).stroke
    }
  }
}
# end helping line marker


doc.write("#{File.basename(__FILE__,'.rb')}.pdf", optimize: true)
