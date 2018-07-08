//
//  PollutantContent.swift
//  Aire
//
//  Created by Pau Escalante on 7/8/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import Foundation
import UIKit

struct PollutantContent {
    var title : String = ""
    var content: [String] = []

    init(title : String) {
        self.title = title
        self.content = pollutantsContentInfo[title]!
    }
    
    func getContentByIndex(index: Int) -> String{
        return content[index]
    }
	
	func stylize() {
		// style pm10
		attributedPollutantsContentInfo["pm10"]![0]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm10"]![0]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["pm10"]![1]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm10"]![1]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["pm10"]![2]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm10"]![2]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		
		// style pm25
		attributedPollutantsContentInfo["pm25"]![0]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm25"]![0]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["pm25"]![1]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm25"]![1]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["pm25"]![2]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["pm25"]![2]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		
		// style o3
		attributedPollutantsContentInfo["o3"]![0]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["o3"]![0]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["o3"]![1]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["o3"]![1]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["o3"]![2]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["o3"]![2]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		
		// style so2
		attributedPollutantsContentInfo["so2"]![0]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["so2"]![0]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["so2"]![1]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["so2"]![1]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		attributedPollutantsContentInfo["so2"]![2]
			.setColor(color: UIColor.blue, forText: "Material Particulado 10")
		attributedPollutantsContentInfo["so2"]![2]
			.bold(stringValue: "Material Particulado 10", fontSize: 20)
		//textView.font = UIFont.systemFont(ofSize: 26)
		//textView.attributedText = attributedString
		//self.view.addSubview(textView)
	}
}

var attributedPollutantsContentInfo: Dictionary<String,[NSMutableAttributedString]> = [
	"pm10": [NSMutableAttributedString(string: pollutantsContentInfo["pm10"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["pm10"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["pm10"]![2]), ],
	"pm25": [NSMutableAttributedString(string: pollutantsContentInfo["pm25"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["pm25"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["pm25"]![2]), ],
	"o3": [NSMutableAttributedString(string: pollutantsContentInfo["o3"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["o3"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["o3"]![2]), ],
	"so2": [NSMutableAttributedString(string: pollutantsContentInfo["so2"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["so2"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["so2"]![2]), ],
	"no2": [NSMutableAttributedString(string: pollutantsContentInfo["no2"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["no2"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["no2"]![2]), ],
	"co": [NSMutableAttributedString(string: pollutantsContentInfo["co"]![0]), NSMutableAttributedString(string: pollutantsContentInfo["co"]![1]), NSMutableAttributedString(string: pollutantsContentInfo["co"]![2]), ]
]

let pollutantsContentInfo: Dictionary<String,[String]> = [
    "pm10": ["El Material Particulado 10 o “Particulate Matter 10” es una mezcla de sustancias sólidas o líquidas de un tamaño igual o menor a 10 micras de diámetro. Es decir, 7 veces más pequeño que un cabello humano o 9 veces más chico que un grano de arena. Estas partículas no tienden a mantenerse suspendidas en el aire tanto tiempo, por lo que no se llegan a mover tan lejos.", "Pueden ser originadas de forma primaria: polvo, asfalto y concreto de los caminos, pedacitos de llanta, carbono de combustión, pollen, erosión. De forma secundaria: las que se crean después de reacciones atmosféricas.","Limita la función de los pulmones, creación de enfermedades respiratorias y ataques de asma, muerte prematura de personas con enfermedades pulmonares y ataques de corazón. Diversos estudios concluyen que la exposición a estas partículas aumentan la mortalidad y hospitalizaciones de emergencia. Por cada 10μg/m3 de aumento en PM10, se incrementa la mortalidad respiratoria en 0.58%"],
    "pm25": ["El Material Particulado 2.5 o “Particulate Matter 2.5” es una mezcla de sustancias sólidas o líquidas de un tamaño igual o menor a 2.5 micras de diámetro. Es decir, 28 veces más pequeño que un cabello humano. Su tamaño permite que se mantengan en el aire por largos periodos de tiempo y que viajen distancias largas y entren a nuestros pulmones","Las PM2.5 pueden ser ocasionada de modo primario, es decir (emisión directa) o secundario (reacciones en el aire). Fuentes primarias incluyen la combustión, minería, construcción, erosión. Estas fuentes son fáciles de identificar y monitorear, suelen venir de vehículos, plantas de energía, fogatas, incendios forestales, quema de cultivo y algunos procesos industriales. Sin embargo, las PM2.5 en su mayoría están compuestas por partículas de fuentes secundarias, por lo que rastrear sus emisiones es muy complicado, haciendo difícil el trabajo de controlarlas.","Las PM2.5 son tan pequeñas que penetran en nuestro sistema respiratorio y se quedan en nuestros pulmones. Esto les da oportunidad de penetrar a nuestro torrente sanguíneo. Diversos estudios concluyen que la exposición a estas partículas aumentan la mortalidad y hospitalizaciones de emergencia. Por cada 10μg/m3 de aumento en PM2.5, se incrementa la mortalidad cardiopulmonar en 6-13%"],
    "o3": ["El ozono es un compuesto que se forma y reacciona gracias a la luz solar. Se encuentra en dos partes de la atmósfera: En la estratósfera (una de las capas más alejadas de la tierra) sirve como filtro solar y protege la tierra de los rayos ultravioleta. En la troposfera (capa de la atmósfera más cercana a la tierra) se le considera contaminante ya que trae muchas repercusiones a la salud humana.", "El ozono estratosférico es generado naturalmente cuando la radiación de los rayos ultravioleta del sol interactúan con el oxígeno molecular. El ozono troposférico se forma principalmente por reacciones químicas que involucran la luz solar y dos tipos de contaminantes muy importantes: VOC y NOx. Esto significa que durante el verano las concentraciones de O3 es más alta. El ozono contribuye muchísimo a lo que llamamos “neblina” por contaminación.", "El ozono es especialmente peligroso ya que entra al cuerpo por medio de las vías respiratorias y gracias a sus propiedades oxidantes, irrita los tejidos pulmonares que conlleva a tos, dolores de cabeza e irritación de ojos. Después de periodos largos de exposición, provoca enfermedades como cataratas, ceguera, cáncer de piel, entre otros efectos en el sistema inmunológico. Además, detiene el crecimiento de las plantas y afecta al proceso de fotosíntesis."],
    "no2": ["Es un gas formado por la combinación de oxígeno y nitrógeno. Es un gas tóxico e irritante","Los óxidos de nitrógeno se producen de forma natural durante los incendios forestales y quema de cultivos, las tormentas eléctricas, las erupciones volcánicas, etc. Las actividades humanas contribuyen a la emisión de óxidos de nitrógeno mediante el escape de vehículos motorizados, sobre todo de tipo diesel, la combustión del carbón, petróleo o gas natural, procesos tales como la soldadura al arco, galvanoplastia, grabado de metales y la detonación de dinamita. Del conjunto de óxidos de nitrógeno emitidos a la atmósfera el más abundante es el óxido nítrico (NO) y, en menor proporción, el dióxido de nitrógeno (NO2).","Puede provocar lesiones en las vías respiratorias y en los pulmones, ocasionando una reducción de la capacidad pulmonar y una mayor sensibilidad a los alérgenos. Por otro lado, es causante de lluvia ácida."],
    "so2": ["Es un gas con un olor fuerte que reacciona fácilmente. Es un componente que causa muchas preocupaciones y es usado como indicador de otros gases llamados óxidos de sulfuro.","El 99% del SO2 en el aire viene de fuentes humanas. La principal fuente de SO2 son las chimeneas de las fábricas. La materia orgánica contiene entre 1-4% de azufre, al descomponerse y convertirse en combustible se queda almacenada. Una vez que se quema, el azufre se combina con el Ozono del aire para crear SO2.También se puede crear por medio de fuentes naturales como los volcanes.","El SO2 afecta de un modo inmediato irritando las vías respiratorias ocasionando tos, falta de aliento y sensación de compresión en el pecho. Los efectos son rápidos y se sienten a los 10-15 minutos de respirarlo. Las reacciones del SO2 en el aire pueden llevarlo a formar partículas y contribuir a la contaminación de PM. Las personas con más riesgo de sufrir problemas son aquellas con asthma o condiciones similares. En la presencia de luz solar, los enlaces del ozono (O2) se rompen y se crean partículas de SO3, el cual se combina con el agua de la lluvia y forma ácido SO4H2."],
    "co": ["El monóxido de carbono es un gas tóxico, inodoro, incoloro e insípido, parcialmente soluble en agua, alcohol y benceno, resultado de la oxidación incompleta del carbono durante el proceso de combustión. Este gas no es irritante por lo que su exposición pasa desapercibida.","La principal fuente de emisión del monóxido de carbono se produce en el sector transporte debido a la combustión incompleta de gas, petróleo, gasolina, carbón y aceites. Los aparatos domésticos que queman combustibles fósiles como las estufas, hornillos ó calentadores, también son una fuente de emisión común. Con respecto a los sectores industriales que mayores cantidades de CO emiten a la atmósfera destacan: Industria metalurgia, en la fundición de aceros, industrias de fabricación de papel y plantas productoras de formaldehído.","En pequeñas concentraciones, puede dar lugar a confusión mental, vértigo, dolor de cabeza, náuseas, debilidad y pérdida del conocimiento. Si se produce una exposición prolongada ó continua, pueden verse afectados el sistema nervioso y el sistema cardiovascular, dando lugar a alteraciones neurológicas y cardiacas.En cuanto a su impacto en el medio ambiente, se trata de una sustancia extremadamente inflamable que reacciona vigorosamente con oxígeno, acetileno, cloro, flúor y óxidos nitrosos, pudiendo provocar humos tóxicos e incendios si existen focos de calentamiento. Es un precursor de ozono, es decir, al combinarse con otros contaminantes atmosféricos forma ozono troposférico (próximo a la superficie terrestre) que provoca quemaduras importantes en el ser humano y es dañino para la flora y fauna autóctona."],
]
