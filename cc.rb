#!/usr/bin/ruby
# cc.rb 
# Norbert Reschke

def mm(z) # point to mm
  z * 72/25.4
end

def cc(canvas)
  cEye = canvas.graphic_object(:arc,cx: 0,cy: 0,a: 17,b: 17, start_angle: 49, end_angle: 309)
  canvas.line_width(4.5)
  canvas.translate(mm(10),mm(7)){
    canvas.scale(0.2){
      canvas.translate(125,245) {
        canvas.circle(0,0,55).stroke
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
end
