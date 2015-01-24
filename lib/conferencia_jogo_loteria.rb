#encoding: UTF-8
require "net/http"

class ConferenciaJogoLoteria
	jogo_lotofacil_1 =  [1,2,3,6,7,9,11,13,15,17,18,19,22,23,25] #array de jogo
	jogo_lotofacil_2 = [4,6,8,10,12,16,17,18,19,20,21,22,23,24,25]
	jogo_lotofacil_3 = [1,3,4,9,10,12,14,15,16,17,18,21,22,23,24]
	jogo_lotofacil_4 = [2,3,4,7,8,9,10,11,13,15,16,17,18,20,22]
	#buscando o resultado da lotofacil
	uri = URI('http://g1.globo.com/loterias/lotofacil.html')
	lotofacil = Net::HTTP.get(uri).split("<div class=\"resultado-concurso \">")[1].split("</div>")[0].gsub("<span class=\"numero-sorteado\">", "").gsub("</span>", ",").gsub(" ", "").gsub("\n", "").split(",").map{|i| i.to_i}

	puts "Loto Fácil"
	puts "Acertos Jogo 1 = " + (jogo_lotofacil_1 & lotofacil).size.to_s
	puts "Acertos Jogo 2 = " + (jogo_lotofacil_2 & lotofacil).size.to_s
	puts "Acertos Jogo 3 = " + (jogo_lotofacil_3 & lotofacil).size.to_s
	puts "Acertos Jogo 4 = " + (jogo_lotofacil_4 & lotofacil).size.to_s

	lotomania_jogo_1 = [1,3,5,6,12,15,16,17,18,19,21,22,23,25,27,28,29,31,33,36,39,41,42,43,45,46,47,50,52,54,55,58,61,63,65,67,69,72,76,80,81,82,83,85,87,89,91,93,94,98]
	lotomania_jogo_2 = [1,2,5,6,8,13,14,16,20,23,26,29,32,33,34,36,37,38,42,43,44,45,48,49,51,54,56,57,58,59,64,66,67,68,69,72,73,75,78,80,81,86,87,88,89,93,94,95,96,98]
	lotomania_jogo_3 = [1,8,10,11,12,14,15,17,19,20,21,23,26,28,32,33,34,35,37,38,43,44,45,46,53,54,55,56,59,62,64,65,67,71,73,74,76,77,78,82,85,87,89,91,92,95,96,98,99,00]

	#buscando o resultado da lotomania
	uri = URI('http://g1.globo.com/loterias/lotomania.html')
	lotomania = Net::HTTP.get(uri).split("<div class=\"resultado-concurso \">")[1].split("</div>")[0].gsub("<span class=\"numero-sorteado\">", "").gsub("</span>", ",").gsub(" ", "").gsub("\n", "").split(",").map{|i| i.to_i}

	puts "Lotomania"
	puts "Acertos Jogo 1 = " + (lotomania_jogo_1 & lotomania).size.to_s
	puts "Acertos Jogo 2 = " + (lotomania_jogo_2 & lotomania).size.to_s
	puts "Acertos Jogo 3 = " + (lotomania_jogo_3 & lotomania).size.to_s
end