local objeto = script.Parent -- Pega o objeto onde o script está dentro

-- Configuração do tempo (em segundos)
local tempoVisivel = 3
local tempoInvisivel = 3

while true do
	-- Fica VISÍVEL e SÓLIDO
	objeto.Transparency = 0       -- 0 significa totalmente visível
	objeto.CanCollide = true      -- True significa que o jogador bate nele
	task.wait(tempoVisivel)       -- Espera o tempo configurado
	
	-- Fica INVISÍVEL e FANTASMA
	objeto.Transparency = 1       -- 1 significa totalmente transparente
	objeto.CanCollide = false     -- False significa que o jogador atravessa
	task.wait(tempoInvisivel)     -- Espera o tempo configurado
end
