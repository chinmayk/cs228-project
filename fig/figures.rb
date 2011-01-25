#!/usr/bin/ruby

#require 'myutils'
require 'rfig/FigureSet'
require 'rfig/Presentation'

############################################################

initFigureSet(:outPrefix => '.', :defaultFont => 'times',
              :latexHeader => IO.readlines('../std-macros.tex') +
                              ['\usepackage{stmaryrd}'],
              :lazy => true)

def exReview
	rtable(
		table(
			['{\bf Summary}:', 'Loved It!'],
			['{\bf Date}:', '22 September 2007'],
			['{\bf Author}:', 'ur2290488'],
			['{\bf Location}:', 'New York, NY USA'],
			['{\bf Helpful}:', '9 out of 10'],
			['{\bf Rating}:', '10 out of 10'],
		nil).outerMargin(u(0.3),u(0.0)),
		autowrap(
			'{\it I saw this series mentioned in the magazine Entertainment 
			Weekly and looked for it online. I was pleasantly surprised 
			to see the episodes posted on YouTube. I just finished watching 
			this particular episode and have to say for a ``fan'' effort 
			I thought it was far superior to any of the spin offs.
			I think Gene Roddenberry would be very pleased with what\'s up 
			there on that screen. What kept going through my mind is that I 
			was watching something that should have occurred thirty years ago. 
			I always felt that the spin offs had been taken over by people 
			who really were not fans of the original and that Gene 
			Roddenberry\'s original vision had been butchered horribly. 
			``Star Trek: New Voyages'' is what should have happened 
			all those years ago!} \newline
			[$\dots$]'
    		).width(u(15)).flushfull,
		nil).center.border(1).borderColor(darkgrey).ospace(u(0.2))
end
printObj(:obj => exReview.signature(18), :outPrefix => 'exReview')
############################################################
def results
	data = DataTable.new(:cellName => 'correlation ($\rho$)',
	  :rowName => 'Feature Set', :colName => 'Pearson Correlation',
	  :rowLabels => [	'{\tt KIM}', 
	  					'{\tt KIM+TIME}',
  						'{\tt KIM+SEM}',
  						'{\tt KIM+TIME+SEM}',
  						'{\tt ALL}',
  						'{\tt OTHER\_RATINGS}',
					],
	  :colLabels => ['train','test'],
	  :contents => [
	  					[0.225,0.312,0.308,0.352,0.486,0.435], 
  						[0.106,0.212,0.260,0.299,0.493,0.458], 
					].transpose)
	rtable(
    	barGraph(data).legendPosition(1.0,0.5),
		nil)
end
printObj(:obj => results.signature(4), :outPrefix => 'results')
############################################################

finishFigureSet
